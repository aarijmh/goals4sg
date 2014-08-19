function initializeLearner() {

	$('#myModalLearner')
			.on(
					'shown.bs.modal',
					function(e) {
						e.stopPropagation();
						
						$('#learner_datebirth').datepicker({
							format : "dd/mm/yyyy",
							startDate : "01/01/1990"
						});
						
						$("#learner").validate({
							rules : {
								name : "required",
								datebirth : "required",
								email : {
									required : true,
									email : true
								}
							},
							messages : {
								name : "Please enter your firstname",
								datebirth : "Please enter your Date of Birth",
								email : "Please enter your email"
							}
						});

						editableGridLearner = new EditableGrid("DemoGridJSON");
						editableGridLearner.tableLoaded = function() {

							this.renderGrid("tablecontentLearner", "testgrid");

							$("#learnerFilter").keyup(function() {
								editableGridLearner.filter($("#learnerFilter").val());
							});

							editableGridLearner
									.setCellRenderer(
											"action",
											new CellRenderer(
													{
														render : function(cell,
																value) {

															cell.innerHTML = "<a onclick=\"if (confirm('Are you sure you want to delete this? ')) { editableGridLearner.remove("
																	+ cell.rowIndex
																	+ ");} \" style=\"cursor:pointer\">"
																	+ "<i class=\'fa   fa-eraser fa-lg\'></i></a>";

															editableGridLearner
																	.filter("");

														}
													}));

							editableGridLearner
									.setCellRenderer(
											"select",
											new CellRenderer(
													{
														render : function(cell,
																value) {

															cell.innerHTML = "<input type=\"checkbox\" name=\"learnerCheck\" value=\""
																	+ editableGridLearner
																			.getRowId(cell.rowIndex)
																	+ "\">";
														}
													}));
						};
						var cid = $("#learner_id").val();
						editableGridLearner
								.loadJSON('learner.action?action=showJSON&id='
										+ cid );

					});

}

var rowIIDLearner = 0;
function addRowLearner() {
	try {
		var string = '{"select":"0","concept":"0","values":"0","desc":"","action":" "}';

		var jSon = JSON.parse(string);

		editableGridLearner.insertAfter(0, rowIIDLearner--, jSon);

	} catch (e) {
		alert(e);
	}
}


function deleteRow(rowIndex) {
	alert(rowIndex);
	if (confirm("Are you sure?")) {
		alert(rowIndex);
	}
}

function saveLearner() {
	if (!$("#learner").valid())
		return false;
	try {
		var superValues = [];
		for ( var i = 0; i < editableGridLearner.getRowCount(); i++) {
			var values = editableGridLearner.getRowValues(i);
			if(values.concept == 0 || values.concept == "" || values.values == 0 || values.values == "")
			{
				alert("Concept and Concept Values are required");
				return false;
			}
			superValues.push(editableGridLearner.getRowValues(i));
		}

		
		var formData = {
			name : $("#learner_name").val(),
			description : $("#learner_description").val(),
			id : $("#learner_id").val(),
			organization : $('#learner_organization').val(),
			email : $('#learner_email').val(),
			datebirth : $('#learner_datebirth').val(),
			adresse : $('#learner_adresse').val(),
			json : JSON.stringify(superValues),
			action : "addEditWorkspace"
		};

		$.ajax({
			url : "learner.action",
			type : 'POST',
			data : formData,
			context : document.body
		}).done(function(data) {
			
			var obj = JSON.parse(data);
			$("#learnerMessages").html(obj.messages);
			$("#learner_id").val(obj.id);
			
			
			var obj = $.parseJSON(data);

			var a = '<a href="learner.action?action=showAddEditWorkspace&id='
					+ obj.id
					+ '" data-toggle="modal" data-target="#myModalLearner"><i class="fa  fa-edit"></i></a> <a href="javascript:deleteLearner('
					+ obj.id + ')"><i class="fa  fa-trash-o"></i></a>';

			if (obj.newObject) {

				var addedRow = learnerTable.row
				.add([
						'<input name="learnerIds" type="checkbox" value="'+obj.id+'"/>',
						$('#learner_name').val(),
						$('#learner_datebirth').val(),
						$('#learner_email').val(),
						$('#learner_adresse').val(),
						$('#learner_organization').val(),
						$('#learner_organization').val(), a ]);
		$(addedRow.node()).attr('id', 'row_' + obj.id);

				learnerTable.draw();

			} else {
				var rowId = $('#row_' + obj.id);

				try {
					var row = learnerTable.row(rowId);

					var aPos = row.data();
					aPos[1] = $('#learner_name').val();
					aPos[2] = $('#learner_datebirth').val();
					aPos[3] = $('#learner_email').val();
					aPos[4] = $('#learner_adresse').val();
					aPos[5] = $('#learner_organization').val();
					aPos[6] = $('#learner_description').val();

					row.data(aPos);
				} catch (e) {
					alert(e);
				}

			}

			

		}).fail(function(a, b, c) {
			alert(a + "\n" + b + "\n" + c);
		});

	} catch (e) {
		alert(e);
	}
}