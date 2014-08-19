function initializeGPR() {

	$('#myModalGPR')
			.on(
					'shown.bs.modal',
					function(e) {
						e.stopPropagation();

						editableGridGPR = new EditableGrid("DemoGridJSON");
						editableGridGPR.tableLoaded = function() {

							this.renderGrid("tablecontentGPR", "testgrid");
						};
						var cid = parseInt($("#gr_relationId").val());
						editableGridGPR.loadJSON('gameresource.action?action=showJSONRelation&relationId='
										+ cid + '&projectId=' + projectId);

					});

}

function saveConceptGPR() {

	try {
		var superValues = [];
		for ( var i = 0; i < editableGridGPR.getRowCount(); i++) {
			var values = editableGridGPR.getRowValues(i);
			if(values.pr == 0 ||  values.gr == 0  || values.gr == "" ||  values.pr == "" )
			{
				alert("Game resource and/or Pedagogical resource cannot be empty");
				return false;
			}
			superValues.push(editableGridGPR.getRowValues(i));
		}

		var formData = {
			relationId : $("#gr_relationId").val(),
			json : JSON.stringify(superValues),
			action : "addEditRelation",
			projectId : projectId
		};

		$.ajax({
			url : "gameresource.action",
			type : 'POST',
			data : formData,
			context : document.body
		}).done(function(data) {
			var obj = JSON.parse(data);
			$("#gprMessages").html(obj.messages);
			$("#gr_relationId").val(obj.relationId);
			
			var node = cy.filter('edge[id = "gpr_' + obj.relationId + '"]');
			if (node.length != 0) {
				node.remove();
			} 
			cy.add({
				group : "edges",
				data : {
					weight : 75,
					id : 'gpr_'+this.id,
					name : this.name,
					source : 'pr_' + obj.source.toString(),
					target : 'gr_' + obj.target.toString(),
					type : 6
				}
			});
			
		}).fail(function(a, b, c) {
			alert(a + "\n" + b + "\n" + c);
		});

	} catch (e) {
		alert(e);
	}
}