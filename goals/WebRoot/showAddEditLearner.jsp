<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel">Learner Add Edit</h4>
		</div>
		<div class="modal-body">
			<div class="col-md-12 form-group">
				<span class="label label-danger" id="learnerMessages"></span>
			</div>
			<s:form name="learner" theme="simple">
				<div class="col-md-6 form-group">
					<label for="textbox1">Name</label>
					<s:textfield name="name" cssClass="form-control"
						placeholder="Enter Name"></s:textfield>
				</div>
				<div class="col-md-6 form-group">
					<label for="textbox1">Date of Birth</label>
					
					<input type="text" name="datebirth" value="<s:property value='datebirth' />" class="form-control" id="learner_datebirth"/>

				</div>
				<span class="clearfix"> </span>

				<div class="col-md-6 form-group">
					<label for="textbox1">E-Mail</label>
					<s:textfield name="email" cssClass="form-control"
						placeholder="Enter Email"></s:textfield>
				</div>

				<div class="col-md-6 form-group">
					<label for="textbox1"> Adresse</label>
					<s:textfield name="adresse" cssClass="form-control"
						placeholder="Enter  Adresse"></s:textfield>
				</div>
				<span class="clearfix"> </span>
				<div class="col-md-6 form-group">
					<label for="textbox1"> Organization</label>
					<s:textfield name="organization" cssClass="form-control"
						placeholder="Enter Organization"></s:textfield>
				</div>
				<div class="col-md-6 form-group">

					<label for="textbox1">Description</label>
					<s:textarea name="description" cssClass="form-control"
						placeholder="Enter Description"></s:textarea>
				</div>
				<span class="clearfix"> </span>
				<div class="col-md-6 form-group">

					<label for="textbox1">Associated Projects</label>
					<s:select id="projectCombo" name="projectIds" listKey="id" listValue="name" list="projectList" multiple="true" cssClass="multiselect" value="projectIds"></s:select>
				</div>
				<s:hidden name="action"></s:hidden>
				<s:hidden name="id"></s:hidden>
			</s:form>
		</div>
		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary"
				onclick="saveLearner();">Save changes</button>
		</div>
	</div>
</div>
