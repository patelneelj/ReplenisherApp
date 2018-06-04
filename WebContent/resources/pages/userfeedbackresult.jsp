<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<br>
			<div class="col-md-12">
			<h3 class="page-header">View Feedback Result</h3>
				<div class="panel panel-primary">
					<input type="hidden" value="${ projectId }" id="projectId"/>
					<div class="panel-body">
						<div class="well">
							<div class="table-responsive">
								<table id="userfeedbacks"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>

											<th>User Id</th>	
											<th>User Name</th>
											<th>Project</th>
											<th>View</th>

										</tr>
									</thead>
									<c:forEach items="${userList}" var="v">
										<tr>
											<td style="text-align:center;background-color: white;">${v.userId }</td>
											<td style="text-align:center;background-color: white;">${v.userName }</td>
											
											<td style="text-align:center;background-color: white;">${projectName }</td>
											<td style="text-align:center;background-color: white;"><button class="btn btn-primary">View Feedback</button></td>	
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


	</div>
</div>

<link
	href="${pageContext.request.contextPath}/resources/dist/css/material.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dist/css/dataTables.material.min.css" />

<script
	src="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap-dialog.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap-dialog.js"></script>



<script
	src="${pageContext.request.contextPath}/resources/dist/js/jquery.dataTables.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/dist/js/dataTables.material.min.js"></script>
<script>
	$(document).ready(function() {

		
		
		
		$('#userfeedbacks').DataTable();
	})
	
	
	$("button").click(function(event) {
        // this.append wouldn't work
        $(this).append(function(){
        	
        		
        	
        	
        });
    });
	
	
	
	
</script>