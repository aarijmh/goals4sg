<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<h4 class="modal-title" id="myModalLabel">Concept - Concept Relations</h4>
		</div>
		<div class="modal-body">

			<div class="col-md-12 form-group">
				<span class="label label-danger" id="conceptMessages"></span>
			</div>


						<div class="col-md-12 form-group">
							<div id="tablecontentCCR"></div>
						</div>
				<s:hidden name="action"></s:hidden>
				<s:hidden name="relationId"></s:hidden>


		</div>

		<div class="modal-footer">
			<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			<button type="button" class="btn btn-primary"
				onclick="saveConceptCCR();">Save changes</button>
		</div>
	</div>
</div>
