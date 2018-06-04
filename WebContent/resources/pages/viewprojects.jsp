<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<br>
			<div class="col-md-12">
			<h3 class="page-header">View Projects</h3>
				<div class="panel panel-primary">
					
					<div class="panel-body">
						<div class="well">
							<div class="table-responsive">
								<table id="projects"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>

											<th>Project Name</th>
											<th>Start Date</th>
											<th>End Date</th>
											<th>Manager Count</th>
											<th>Employee Count</th>

										</tr>
									</thead>
									<c:forEach items="${projects}" var="v">
										<tr>

											<td style="background-color: white;">${v.projectName }</td>
											<td style="background-color: white;">${v.startDate}</td>
											<td style="background-color: white;">${v.endDate}</td>
											<td style="background-color: white;">${v.managerCount }</td>
											<td style="background-color: white;">${v.empCount }</td>

										</tr>
									</c:forEach>


								</table>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>
		<!-- /.row -->
		<div id="myModal" class="modal fade" role="dialog">
			<div class="modal-dialog">

				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Select Action</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col-xs-2"></div>
							<div class="col-lg-3">
						
								<img style="text-align: center; width:120px" src="${pageContext.request.contextPath}/resources/images/boss.png">
								<br><br>
								<button type="button" style="text-align: center; width:100%;" class="btn btn-default" id="addmanager">Add
									Manager  </button>
							</div>
							
							<div class="col-xs-2"></div>
							<div class="col-xs-3">
							<img style="text-align: center; width:120px; height:134px;" src="${pageContext.request.contextPath}/resources/images/emp.png"><br><br>
								<button type="button" class="btn btn-default" id="addemployee">Add
									Employee  </button>
							</div>
						</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /.mymodal -->
	</div>
</div>

<link
	href="${pageContext.request.contextPath}/resources/dist/css/material.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dist/css/dataTables.material.min.css" />

<script
	src="${pageContext.request.contextPath}/resources/dist/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/dist/js/dataTables.material.min.js"></script>

<script>
	$(document).ready(function() {
		var name;

		$(".table-striped").on("click", 'tr', function() {
			// Find the row
			name = $(this).children('td:first').text();
			console.log(name);
			$('#myModal').modal('show');

		});

		$("#addmanager").click(function() {
			console.log("add manager");
			window.location.href ="assignmanager.html?name="+name;	
		});
		
		$("#addemployee").click(function(){
			window.location.href ="assignemployee.html?name="+name;	
			
		})

		$('#projects').DataTable();
	})
</script>