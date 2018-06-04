<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">
			<br>
			<div class="col-md-12">
			<h3 class="page-header">View Feedbacks</h3>
				<div class="panel panel-primary">
					<%-- input type="hidden" value="${ projectId }" id="projectId"/> --%>
					<div class="panel-body">
						<div class="well">
							<div class="table-responsive">
								<table id="feedbacks"
									class="table table-striped table-bordered table-hover">
									<thead>
										<tr>

											<th>Feedback Id</th>	
											<th>Feedback Name</th>
											<th>Start Date</th>
											<th>End Date</th>
											<th>Project</th>
											<th>Declare</th>

										</tr>
									</thead>
									<c:forEach items="${feedbacks}" var="v">
										<tr>
											<td style="background-color: white;">${v.feedbackId }</td>
											<td style="background-color: white;">${v.feedbackName }</td>
											<td style="background-color: white;">${v.startDate}</td>
											<td style="background-color: white;">${v.endDate}</td>
											<td style="background-color: white;">${v.project.projectName }</td>
											<td style="background-color: white;"><button class="btn btn-primary">Declare</button></td>	
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

		
		
		
		$('#feedbacks').DataTable();
	})
	
	
	$("button").click(function(event) {
        // this.append wouldn't work
        $(this).append(function(){
        	
        	var trid = $(this).closest('tr');
        	//alert(trid);
        	var feedbackId= trid.children('td:first').text();
        	console.log("my click worked "+feedbackId);
        	//var projectId=$("#projectId").val();
        	$.ajax({
				type :"post",
				url :"declarefeedback.html",
				data :{
					feedbackId: feedbackId,
				},
				datatype:"json",
				success:function(data){
					if(data=="failed")
						{
						BootstrapDialog.show({
			                type:BootstrapDialog.TYPE_DANGER,
			                title: 'Alert',
			                message: 'Sorry You Cant Declare Result',
			                
			            });     
					}
					else{
						
						window.location.reload ="employeesfeedback.html?feedbackId="+feedbackId;
					}
				}
				
			});
        	
        	
        	
        	
        });
    });
	
	
	
	
</script>