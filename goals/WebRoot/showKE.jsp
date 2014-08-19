<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<br>
<br>

<div class="col-md-9">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h5 class="panel-title">Knowledge Editor</h5>
		</div>
		<div class="panel-body">
		
					<div id="cy"></div>

			<div class="cytoscape-navigator" style="width: 100px; height: 100px; ">
				<canvas></canvas>
				<div class="cytoscape-navigatorView"></div>
				<div class="cytoscape-navigatorOverlay"></div>
			</div>
		</div>
	</div>
</div>
<div class="col-md-3">
	<div class="panel panel-default">
		<div class="panel-heading">
			<h5 class="panel-title">Add/Edit Elements</h5>
		</div>
		<div class="panel-body">
			<a
				href="concept.action?action=showAddEdit&projectId=<s:property
								value="%{#session['projectId']}" />"
				data-toggle="modal" data-target="#myModal">Add/Edit Concepts</a> <br>
			<a
				href="pedagogicalresource.action?action=showAddEdit&projectId=<s:property
								value="%{#session['projectId']}" />"
				data-toggle="modal" data-target="#myModalPR">Add/Edit
				Pedagogical Resources</a> <br> <a
				href="gameresource.action?action=showAddEdit&projectId=<s:property
								value="%{#session['projectId']}" />"
				data-toggle="modal" data-target="#myModalGR">Add/Edit Game
				Resources</a> <br> <a
				href="concept.action?action=showAddEditRelation&projectId=<s:property
								value="%{#session['projectId']}" />"
				data-toggle="modal" data-target="#myModalCCR">Add/Edit Concept
				Relations</a> <br> <a
				href="pedagogicalresource.action?action=showAddEditRelation&projectId=<s:property
								value="%{#session['projectId']}" />"
				data-toggle="modal" data-target="#myModalPCR">Add/Edit PR -
				Concept Relations</a> <br> <a
				href="gameresource.action?action=showAddEditRelation&projectId=<s:property
								value="%{#session['projectId']}" />"
				data-toggle="modal" data-target="#myModalGPR">Add/Edit PR - GR
				Relations</a>
		</div>
	</div>
</div>

