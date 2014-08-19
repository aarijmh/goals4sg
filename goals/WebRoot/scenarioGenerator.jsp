<%@taglib uri="/struts-tags" prefix="s"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

	<br>
	<br>

	<div class="row" style="width:90%">
		<div class="col-md-3">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 class="panel-title">Learners</h5>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<label class="col-md-4 control-label" for="selectbasic">Learner</label>
						<div class="col-md-8">
							<s:select list="learnerList" listKey="id" listValue="name"
								cssClass="form-control" id="learnerList"></s:select>
						</div>
					</div>
					<br> <br>
					<div class="form-group" style="margin-top: 20px;">
						<label class="col-md-4 control-label" for="selectbasic">Presentations</label>
						<div class="col-md-8">
							<s:select list="presentationList" listKey="id" listValue="name"
								cssClass="form-control" id="presentationList"></s:select>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-md-6">

			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 class="panel-title">Pedagogical Objectives</h5>
				</div>
				<div class="panel-body">
					<div class="form-group">
						<div class="col-md-3">
							<button type="button" class="btn btn-default"
								onclick="doAddConceptSG()">Add</button>
						</div>
						<div class="col-md-9">
							<div id="scenarioTable"></div>
						</div>
					</div>
				</div>
			</div>
		</div>



		<div class="col-md-3">


			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 class="panel-title">Scenario Generator</h5>
				</div>
				<div class="panel-body">
					<button type="button" class="btn btn-default" onclick="generateScenario()">Generate</button>
					<button type="button" class="btn btn-default">Generate
						Game</button>
				</div>
				<br> <br>

			</div>
		</div>

	</div>

	<div class="row" style="width:90%">
		<div class="col-md-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h5 class="panel-title">Generated Scenario</h5>
				</div>
				<div class="panel-body" id="textScenario">
				
				</div>
			</div>
		</div>
	</div>
