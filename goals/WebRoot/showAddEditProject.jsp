<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel">Project - Add/Edit</h4>
		</div>
		<div class="modal-body">
			<div class="col-md-12 form-group">
				<span class="label label-danger" id="projectMessages"></span>
			</div>
			<s:form name="project" theme="simple">
				<div class="form-group">
					<label for="name">Name</label> 
						<s:textfield name="name" cssClass="form-control"  placeholder="Enter Name" ></s:textfield>
				</div>
				<div class="form-group">
					<label for="name">Author</label> <s:textfield name="ownerName" cssClass="form-control" readonly="true"></s:textfield>
				</div>
				<div class="form-group">
					<label for="name">Number of users</label> <s:textfield name="numberOfLearners" cssClass="form-control" readonly="true"></s:textfield>
				</div>
				<div class="form-group">
					<label for="description">Description</label> <s:textarea name="description" cssClass="form-control"></s:textarea>
				</div>
				<s:hidden name="action"></s:hidden>
				<s:hidden name="id"></s:hidden>
			</s:form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="button" id="savBtn" class="btn btn-primary" onclick="saveProject();">Save changes</button>
		</div>
	</div>
</div>
