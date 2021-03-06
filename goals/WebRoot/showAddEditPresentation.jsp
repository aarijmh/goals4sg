<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel">Presentations</h4>
		</div>
		<div class="modal-body">

			<div class="col-md-12 form-group">
				<span class="label label-danger" id="presentationMessages"></span>
			</div>


			<s:form name="presentation" theme="simple">
				<div class="col-md-6 form-group">
					<label for="textbox1">Name</label>
					<s:textfield name="name" cssClass="form-control"
						placeholder="Enter Name"></s:textfield>
				</div>
				<div class="col-md-6 form-group">
					<label for="textbox1">Description</label>

					<s:textarea name="description" cssClass="form-control"
						placeholder="Enter Description"></s:textarea>
				</div>
				<span class="clearfix"> </span>



				<div class="tab-content">
					<div class="tab-pane active" id="conceptRelations">
					<br>
					
						<div class="col-md-6 form-group">
							<div class="btn-group">
								<button type="button" class="btn btn-default" onclick="addRowPresentation()">Add</button>
							</div>
						</div>
						<div class="col-md-6 form-group">
							<label for="textbox1">Filter:</label> <input type="text"
								id="presentationFilter">

						</div>

						<div class="col-md-12 form-group">
							<div id="tablecontentPresentation"></div>
						</div>
					</div>
				</div>




				<s:hidden name="action"></s:hidden>
				<s:hidden name="id"></s:hidden>
			</s:form>


		</div>

		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary"
				onclick="savePresentation();">Save changes</button>
		</div>
	</div>
</div>
