<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!doctype html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Welcome <s:property value="%{#session['loginName']}" />
</title>
<style type="text/css">
.highlight {
	background-color: whitesmoke !important;
}
</style>
<link rel="stylesheet" href="css/bootstrap.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">

<script src="script/jquery-2.1.0.js"></script>
<script src="script/bootstrap.js"></script>
<script src="script/jquery.dataTables.js"></script>
<script src="script/bootbox.js"></script>
<script src="script/jquery.validate.js"></script>

<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/jquery.dataTables.css" />
<link rel="stylesheet" type="text/css" href="css/bootstrapValidator.css" />
<!-- Latest compiled and minified CSS -->


<!-- Latest compiled and minified JavaScript -->





<script type="text/javascript">
	var table;
	$(document).ready(function() {

		$('body').on('hidden.bs.modal', '.modal', function() {
			$(this).removeData('bs.modal');
		});

		$('#myModal').on('shown.bs.modal', function(e) {
			e.stopPropagation();
			$("#project").validate({
				rules : {
					project_name : "required",
					name : "required"
				},
				messages : {
					firstname : "Please enter your firstname"
				}
			});

		});

		table = $('#projectTable').DataTable({
			"columns" : [ {
				"width" : "5%"
			}, {
				"width" : "15%"
			}, {
				"width" : "15%"
			}, {
				"width" : "10%"
			}, {
				"width" : "40%"
			}, {
				"width" : "15%"
			} ]
		});

	});

	function saveProject() {
	
	 if($("#project").valid())
	 {
		document.project.action.value = "addEdit";
		var posting = $.post("project.action", {
			action : 'addEdit',
			name : $('#project_name').val(),
			description : $('#project_description').val(),
			id : $('#project_id').val()
		});

		/* Put the results in a div */
		posting.done(function(data) {

					/* var a = '{"name" : "ClesFinal","description" : "","ownerName" : "","numberOfUsers" : "","id" : "8","action" : "addEdit"}';
					if(data == a)
						alert(a +"\n"+data); */
					var obj = $.parseJSON(data);

					var a = '<a href="project.action?action=openProject&id='
							+ obj.id
							+ '" ><i class="fa  fa-folder-open"></i></a> <a href="project.action?action=showAddEdit&id='
							+ obj.id
							+ '" data-toggle="modal" data-target="#myModal"><i class="fa  fa-edit"></i></a> <a href="javascript:deleteProject('
							+ obj.id + ')"><i class="fa  fa-trash-o"></i></a>';

					if (obj.newObject == "true") {

						var addedRow = table.row
								.add([
										'<input type="checkbox" value="'+obj.id+'"/>',
										$('#project_name').val(),
										'<s:property value="%{#session[\'loginName\']}" />',
										0, $('#project_description').val(), a ]);
						$(addedRow.node()).attr('id', 'row_' + obj.id);

						table.draw();

					} else {
						var rowId = $('#row_' + $('#project_id').val());

						try {
							var row = table.row(rowId);

							var aPos = row.data();
							aPos[1] = $('#project_name').val();
							aPos[4] = $('#project_description').val();

							row.data(aPos);
							/* 						table.fnUpdate($('#project_name').val(), aPos, 1); // Single cell
							 table
							 .fnUpdate($('#project_description').val(),
							 aPos, 4); // Single cell */
						} catch (e) {
							alert(e);
						}

					}
					
					$("#projectMessages").html("Project saved successfullt");

					//$('#myModal').modal('hide');
				});
				}
	}

	function deleteProject(id) {

		bootbox.confirm("This is an irreversible action. Are you sure? ",
				function(result) {
					if (result) {
						$.ajax({
							url : "project.action?action=delete&id=" + id,
							context : document.body
						}).done(function(data) {

							bootbox.alert({
								message : 'Project deleted successfully',
								title : 'Project delete message',
								closeButton : true
							});

							var rowId = $('#row_' + id);
							table.row(rowId).remove().draw();

						}).error(function(a, b, c) {
							alert(a + "\n" + b + "\n" + c);
						});
					}
				});

		return;

	}
</script>
</head>
<body>


	<div class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"><s:property
						value="%{#session['loginName']}" /></a>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="#">Profile</a></li>
					<li><a href="user.action?action=logout">Sign out</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
	<ul class="nav nav-pills">
		<li class="active"><a href="#">Projects</a></li>

		<li><a href="learner.action?action=show">Learners</a></li>
	</ul>


	<div class="row">
		<div class="col-sm-10">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h3 class="panel-title">Projects</h3>
				</div>
				<div class="panel-body">
					<div style="width: 80%; float:right;">
						<a href="project.action?action=showAddEdit&id=0"
							data-toggle="modal" data-target="#myModal"><i
							class="fa  fa-file fa-lg"></i></a> <a href="removeElements()"><i
							class="fa   fa-eraser fa-lg"></i></a>
					</div>
					<div style="width: 100%; margin: 20px;padding: 20px;">

						<table id="projectTable">
							<thead>
								<tr>
									<th>Select</th>
									<th>Name</th>
									<th>Author</th>
									<th>Number of users</th>
									<th>Description</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="projectList">
									<tr id="row_<s:property value='id' />">
										<td><input type="checkbox"
											value="<s:property value='id' />" /></td>
										<td><s:property value="name" /></td>
										<td><s:property value="ownerName" /></td>
										<td><s:property value="numberOfLearners" /></td>
										<td><s:property value="description" /></td>
										<td><a
											href="project.action?action=openProject&id=<s:property value='id' />"><i
												class="fa  fa-folder-open"></i></a> <a
											href="project.action?action=showAddEdit&id=<s:property value='id' />"
											data-toggle="modal" data-target="#myModal"><i
												class="fa  fa-edit"></i></a> <a
											href="javascript:deleteProject(<s:property value='id' />)"><i
												class="fa  fa-trash-o"></i></a></td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
		<!-- /.col-sm-4 -->

	</div>

	<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>

</body>
<script type="text/javascript">
	
</script>
</html>