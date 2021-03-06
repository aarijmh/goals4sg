function initializeConcept() {

	$('#myModal')
			.on(
					'shown.bs.modal',
					function(e) {
						e.stopPropagation();
						$("#concept").validate({
							rules : {
								name : "required"
							},
							messages : {
								name : "Name is required"
							}
						});
						
						editableGrid = new EditableGrid("DemoGridJSON");
						editableGrid.tableLoaded = function() {

							this.renderGrid("tablecontent", "testgrid");

							$("#conceptFilter").keyup(function() {
								editableGrid.filter($("#conceptFilter").val());
							});

							editableGrid
									.setCellRenderer(
											"action",
											new CellRenderer(
													{
														render : function(cell,
																value) {

															cell.innerHTML = "<a onclick=\"if (confirm('Are you sure you want to delete this? ')) { editableGrid.remove("
																	+ cell.rowIndex
																	+ ");} \" style=\"cursor:pointer\">"
																	+ "<i class=\'fa   fa-eraser fa-lg\'></i></a>";

															editableGrid
																	.filter("");

														}
													}));

							editableGrid
									.setCellRenderer(
											"select",
											new CellRenderer(
													{
														render : function(cell,
																value) {

															cell.innerHTML = "<input type=\"checkbox\" name=\"conceptCheck\" value=\""
																	+ editableGrid
																			.getRowId(cell.rowIndex)
																	+ "\">";
														}
													}));
						};
						var cid = $("#concept_id").val();
						editableGrid
								.loadJSON('concept.action?action=showJSON&id='
										+ cid + '&projectId=' + projectId);

						conceptPropertiesGrid = new EditableGrid("CPGridJSON");
						conceptPropertiesGrid.tableLoaded = function() {
							this.renderGrid("conceptPropertiesContent",
									"testgrid");

							conceptPropertiesGrid
									.setCellRenderer(
											"select",
											new CellRenderer(
													{
														render : function(cell,
																value) {
															// this action will
															// remove the row,
															// so first find the
															// ID of the row
															// containing this
															// cell
															cell.innerHTML = "<input type=\"checkbox\" name=\"conceptPropertySelect\" value=\""
																	+ conceptPropertiesGrid
																			.getRowId(cell.rowIndex)
																	+ "\">";
														}
													}));

							conceptPropertiesGrid
									.setCellRenderer(
											"action",
											new CellRenderer(
													{
														render : function(cell,
																value) {

															// this action will
															// remove the row,
															// so first find the
															// ID of the row
															// containing this
															// cell
															cell.innerHTML = "<a onclick=\"if (confirm('Are you sure you want to delete this element ? ')) { conceptPropertiesGrid.remove("
																	+ cell.rowIndex
																	+ ");} \" style=\"cursor:pointer\">"
																	+ "<i class=\'fa   fa-eraser fa-lg\'></i></a>";
														}
													}));

						};

						conceptPropertiesGrid
								.loadJSON('concept.action?action=showProperties&id='
										+ cid);

					});

}

var rowIID = 0;
function addRow() {
	try {
		var string = '{"select":"0","concept":"0","relation":"0","functions":"0","values":"0","action":" "}';

		var jSon = JSON.parse(string);

		editableGrid.insertAfter(0, rowIID--, jSon);

	} catch (e) {
		alert(e);
	}
}

var prRowIID = 0;
function addPrRow() {
	try {
		var string = '{"select":"0","name":"","value":""}';

		var jSon = JSON.parse(string);

		conceptPropertiesGrid.insertAfter(0, prRowIID--, jSon);

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

function saveConcept() {

	 if(!$("#concept").valid()) return false;
	try {
		var superValues = [];
		for ( var i = 0; i < editableGrid.getRowCount(); i++) {
			if(editableGrid.getRowValues(i).concept == 0 || editableGrid.getRowValues(i).concept == "")
				{
					alert("You have to select a concept for concept relation");
					return false;
				}
			superValues.push(editableGrid.getRowValues(i));
		}

		var superPrValues = [];
		for ( var i = 0; i < conceptPropertiesGrid.getRowCount(); i++) {
			superPrValues.push(conceptPropertiesGrid.getRowValues(i));
		}

		var formData = {
			name : $("#concept_name").val(),
			description : $("#concept_description").val(),
			id : $("#concept_id").val(),
			json : JSON.stringify(superValues),
			action : "addEdit",
			prJson : JSON.stringify(superPrValues),
			projectId : projectId
		};

		$.ajax({
			url : "concept.action",
			type : 'POST',
			data : formData,
			context : document.body
		}).done(function(data) {
			
			var obj = JSON.parse(data);
			$("#conceptMessages").html(obj.messages);
			$("#concept_id").val(obj.id);
			
			var node = cy.filter('node[id = "con_'+obj.id+'"]');
			if(node.length == 0)
				{
				
					cy.add(createNode(1, obj.id, $("#concept_name").val(), 0, 0)) ;
				}
			else
				{
					node[0].data('name',$("#concept_name").val());
				}

		}).fail(function(a, b, c) {
			alert(a + "\n" + b + "\n" + c);
		});

	} catch (e) {
		alert(e);
	}
}