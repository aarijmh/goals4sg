<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel">Game Resources</h4>
		</div>
		<div class="modal-body">

			<div class="col-md-12 form-group">
				<span class="label label-danger" id="grMessages"></span>
			</div>


			<s:form name="gameresource" theme="simple">
				<div class="col-md-6 form-group">
					<label for="textbox1">Name</label>
					<s:textfield name="name" cssClass="form-control"
						placeholder="Enter Name"></s:textfield>
				<label for="textbox1">Types</label>
				<s:select list="typesList" listKey="id" listValue="name" value="typesId" key="typesId" id="types" cssClass="form-control"></s:select>						
				</div>
				<div class="col-md-6 form-group">
					<label for="textbox1">Description</label>

					<s:textarea name="value" cssClass="form-control"
						placeholder="Enter Description"></s:textarea>
				</div>
				<span class="clearfix"> </span>


				<ul class="nav nav-tabs">
					<li class="active"><a href="#grRelations"
						data-toggle="tab">Relations</a></li>
					<li><a href="#grProperties" data-toggle="tab">Properties</a></li>
				</ul>


				<div class="tab-content">
					<div class="tab-pane active" id="grRelations">
					<br>
					
						<div class="col-md-6 form-group">
							<div class="btn-group">
								<button type="button" class="btn btn-default" onclick="addRowGR()">Add</button>
							</div>
						</div>
						<div class="col-md-6 form-group">
							<label for="textbox1">Filter:</label> <input type="text"
								id="grFilter">

						</div>

						<div class="col-md-12 form-group">
							<div id="tablecontentGR"></div>
						</div>
					</div>
					<div class="tab-pane" id="grProperties">
						<br>
						<div class="col-md-6 form-group">
							<div class="btn-group">
								<button type="button" class="btn btn-default" onclick="addPrRowGR()">Add</button>
							</div>
						</div>
						<div class="col-md-12 form-group">
							<div id="grPropertiesContent"></div>
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
				onclick="saveGR();">Save changes</button>
		</div>
	</div>
</div>
