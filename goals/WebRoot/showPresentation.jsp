<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<br>
<br>
<div style="width: 50%; float:right;">
	<a href="presentation.action?action=showAddEdit&id=0&projectId=<s:property value="%{#session['projectId']}" />" data-toggle="modal"
		data-target="#myModalPresentation"><i class="fa  fa-file fa-lg"></i></a> <a
		href="removePresentations()"><i class="fa   fa-eraser fa-lg"></i></a>
</div>
<div style="width: 50%; margin: 20px;padding: 20px;">
	<table id="presentationTable" style="margin: 20px">
		<thead>
			<tr>
				<th>Select</th>
				<th>Presentation</th>
				<th>Description</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="presentationList">
				<tr id="row_<s:property value='id' />">
					<td><input type="checkbox" name="presentationSelect"
						value="<s:property value="id" />"></td>
					<td><s:property value="name" /></td>
					<td><s:property value="description" /></td>
					<td><a
						href="presentation.action?action=showAddEdit&id=<s:property value='id' />&projectId=<s:property value="%{#session['projectId']}" />"
						data-toggle="modal" data-target="#myModalPresentation"><i
							class="fa  fa-edit"></i></a> <a
						href="javascript:deletePresentation(<s:property value='id' />)"><i
							class="fa  fa-trash-o"></i></a></td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
</div>

	<div class="modal fade" id="myModalPresentation" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content"></div>
		</div>
	</div>