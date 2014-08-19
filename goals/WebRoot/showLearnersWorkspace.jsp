<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<br>
<br>
<div style="width: 50%; float:right;">
	<a href="learner.action?action=showAddEditWorkspace&id=0" data-toggle="modal"
		data-target="#myModalLearner"><i class="fa  fa-file fa-lg"></i></a> <a
		href="removeLearners()"><i class="fa   fa-eraser fa-lg"></i></a>
</div>
<div style="width: 70%; margin: 20px;padding: 20px;">
	<table id="learnerTable" style="margin: 20px">

							<thead>
								<tr>
									<th>Select</th>
									<th>Name</th>
									<th>Date of Birth</th>
									<th>Email</th>
									<th>Address</th>
									<th>Organization</th>
									<th>Description</th>
									<th>Action</th>
								</tr>
							</thead>
							<tbody>
								<s:iterator value="learnerList">
									<tr id="row_<s:property value='id' />">
										<td><input type="checkbox"
											value="<s:property value='id' />" /></td>
										<td><s:property value="name" /></td>
										<td><s:property value="datebirth" /></td>
										<td><s:property value="email" /></td>
										<td><s:property value="adresse" /></td>
										<td><s:property value="organization" /></td>
										<td><s:property value="description" /></td>
										<td><a
											href="learner.action?action=showAddEditWorkspace&id=<s:property value='id' />"
											data-toggle="modal" data-target="#myModalLearner"><i
												class="fa  fa-edit"></i></a> <a
											href="javascript:deleteLearner(<s:property value='id' />)"><i
												class="fa  fa-trash-o"></i></a></td>
									</tr>
								</s:iterator>
							</tbody>
						</table>
					</div>

	


	<div class="modal fade" id="myModalLearner" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>

</body>
<script type="text/javascript">
	
</script>
</html>