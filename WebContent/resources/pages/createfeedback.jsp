<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>



<!-- Page Content -->
<div id="page-wrapper">
	<div class="container-fluid">
		<div class="row">

			<!--  Start designing your Html body from here -->
			<div class="col-lg-2"></div>

			<div class="col-lg-8">
				<h1 class="page-header">Create Feedback</h1>

				<div class="panel panel-primary">

					<div class="panel-body">
						<form:form id="add-serv-form" method="post"
							modelAttribute="createFeedback" action="storefeedback.html">

							<div class="form-group">
								<label for="formSName">Feedback Name:</label>
								<form:input type="text" path="feedbackName" id="feedbackName"
									class="form-control"/>
								<font color='red'>
									<div id="errfeedbackName"></div>
								</font>	
							</div>


							
							<div class="form-group">

								<label>Feedback Type:</label>

								<form:select id="type" class="form-control" path="type">
									
										<form:option value="ROLE_MANAGER">Manager</form:option>
										<form:option value="ROLE_EMPLOYEE">Employee</form:option>
										<form:option value="ROLE_CUSTOMER">Customer</form:option>
									
								</form:select>
								<font color='red'>
									<div id="errtype"></div>
								</font>	
							</div>



							<div class="form-group">

								<label>Project:</label>

								<form:select id="projectId" class="form-control" path="projectId">
									<c:forEach items="${projectList}" var="c">
										<form:option value="${c.projectId }">${c.projectName }</form:option>
									</c:forEach>
								</form:select>
								<font color='red'>
									<div id="errprojectId"></div>
								</font>	
							</div>
						

							<div class="form-group">

								<label for="formSCost">Start Date</label>
								<div class="input-group date" data-date-autoclose="true"
									data-provide="datepicker">
									<form:input type="text" path="startdate" id="startDate"
										class="form-control" />
									<span class="input-group-addon"><i
										class="fa fa-calendar"></i></span>
								</div>
								<font color='blue'>
									<div id="showstartdate"></div>
								</font>
								<font color='red'>
									<div id="errstartDate"></div>
								</font>
							</div>
							

							<div class="form-group">

								<label for="formSCost">End Date</label>
								<div class="input-group date" data-date-autoclose="true"
									data-provide="datepicker">
									<form:input type="text" path="enddate" id="endDate"
										class="form-control" />
									<span class="input-group-addon"><i
										class="fa fa-calendar"></i></span>
								</div>
								<font color='blue'>
									<div id="showenddate"></div>
								</font>
							
								<font color='red'>
									<div id="errendDate"></div>
								</font>
							</div>

							<button type="button" class="btn btn-primary" id="submitbtn">Submit</button>

						</form:form>
					</div>



				</div>
			</div>
		</div>
		<!--end of col-md-6-->

	</div>
	<!-- /.row -->
</div>
<!-- /.container-fluid -->
</div>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dist/css/bootstrap-multiselect.css">
<script
	src="${pageContext.request.contextPath}/resources/dist/js/bootstrap-datepicker.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/dist/js/metisMenu.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/dist/js/bootstrap-multiselect.js"></script>

<script>
	$(document).ready(function() {
		//Initialize Select2 Elements

		$('#userIds').multiselect({
			enableFiltering : true,
			enableCaseInsensitiveFiltering : true,
			maxHeight : 200
			
		});

		//Date picker
		$('.inline-datepicker').datepicker({
			todayHighlight : true,
	
		});
		//iCheck for checkbox and radio inputs

		$("#submitbtn").click(function() {

			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			var projectId = $("#projectId").val();
			var feedbackName = $("#feedbackName").val();
			var type = $("#type").val();
			
			console.log(startDate);
			console.log(endDate);
			
			
			var err = 0;

			if (feedbackName == " " || feedbackName.length == 0) {
				$("#errfeedbackName").text("Enter Feedback Name");
				err++;
			}
			if (projectId==null) {
				$("#errprojectId").text("Select Project");
				err++;
			}
			if (type==null) {
				$("#errtype").text("Select Type of feedback");
				err++;
			}
			if (startDate == " " || startDate.length == 0) {
				$("#errstartDate").text("Select Start Date");
				err++;
			}
			if (endDate == " " || endDate.length == 0) {
				$("#errendDate").text("Select End Date");
				err++;
			}
			
			if(start < currentDate)
			{
				$("#errstartDate").text("You have selected Incorrect date");
				err++;	
			}			
			
			if(end < currentDate){
				$("#errendDate").text("You have selected Incorrect date");
				err++;
			}
			
			if (start > end) {
				$("#errstartDate").text("Select Valid Dates");
				$("#errendDate").text("Select Valid Dates");
				err++;
			}


			var start = Date.parse(startDate);
			var end = Date.parse(endDate);
			var d=new Date();
			var currentDateStr=(d.getMonth()+1)+"/"+d.getDate()+"/"+d.getFullYear();
			console.log(currentDateStr);
			var currentDate=Date.parse(currentDateStr);
			
			
			
			 $.ajax({
				type :"post",
				url :"getprojectdates.html",
				data :{
					projectId: projectId,
					startDate: startDate,
					endDate: endDate
				},
				datatype:"json",
				success:function(data){
					if(data != "success")
						{
							err=err+1;	
							var dates=data.split("/");
							$("#showstartdate").text("project start date: "+dates[0]);
							$("#showenddate").text("project end date: "+dates[1]);
							$("#errendDate").text("You have selected Incorrect date");
							$("#errstartDate").text("You have selected Incorrect date");
						
							console.log("in there "+err);
						
						}
					else
						{
						if (err != 0) {
							return false;
						}
						else
							{
								$("#add-serv-form").submit();
							}
						}
					}
				
			});
        	 
			
			
			
			
			
			
			
			
			
			
			
			

		});

		$("#projectId").change(function() {
			$("#errprojectId").text("");
		});
		$("#type").change(function() {
			$("#errtype").text("");
		});
		$("#feedbackName").focus(function() {
			$("#errfeedbackName").text("");
		});
		$("#startDate").focus(function() {
			$("#errstartDate").text("");
		});
		$("#endDate").focus(function() {
			$("#errendDate").text("");
		});

	});
</script>
