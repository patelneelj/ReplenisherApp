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
			<h1 class="page-header">Assign Managers</h1>
				
				<div class="panel panel-primary">

					<div class="panel-body">
						<form:form id="add-serv-form" method="post"
							modelAttribute="addManager" action="addmanager.html">

							<div class="form-group">
								<label for="formSName">Project Name:</label>
								<form:input type="text" path="projectName" id="projectName"
									class="form-control" value="${projectName}"/>
							</div>
							

							<div class="form-group">
								<label for="formSName">Role:</label>
								<form:input type="text" path="roleName" id="roleName"
									class="form-control" value="Manager"/>
							</div>
                            
													
							<div class="form-group">

								<label>Managers:</label>
									
									<form:select id="userIds" path="userIds" multiple="multiple">
										<c:forEach items="${managerList}" var="c">
										<form:option value="${c.userId }">${c.firstName } ${c.lastName }</form:option>
										</c:forEach>
									</form:select>
									<font color='red'>
									<div id="erruserIds"></div>
									</font>
							</div>

							<div class="form-group">

								<label for="formSCost">Start Date</label>
								<div class="input-group date" data-date-autoclose="true"
									data-provide="datepicker">
									<form:input type="text" path="startDate" id="startDate"
										class="form-control" />
									<span class="input-group-addon"><i
										class="fa fa-calendar"></i></span>
								</div>
								<font color='red'>
									<div id="errstartDate"></div>
								</font>
							</div>

							<div class="form-group">

								<label for="formSCost">End Date</label>
								<div class="input-group date" data-date-autoclose="true"
									data-provide="datepicker">
									<form:input type="text" path="endDate" id="endDate"
										class="form-control" />
									<span class="input-group-addon"><i
										class="fa fa-calendar"></i></span>
								</div>
								<font color='red'>
									<div id="errendDate"></div>
								</font>
							</div>

							<button type="submit" class="btn btn-primary" id="submitbtn">Submit</button>

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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/dist/css/bootstrap-multiselect.css">
<script src="${pageContext.request.contextPath}/resources/dist/js/bootstrap-datepicker.min.js"></script>
<script	src="${pageContext.request.contextPath}/resources/dist/js/metisMenu.js"></script>
<script	src="${pageContext.request.contextPath}/resources/dist/js/bootstrap-multiselect.js"></script>

<script>
	$(document).ready(function() {
		//Initialize Select2 Elements
 
		$("#projectName").attr("readonly",true);
		$("#roleName").attr("readonly",true);
		$('#userIds').multiselect({
			enableFiltering: true,
			enableCaseInsensitiveFiltering: true,
			maxHeight: 200
		});

		
		//Date picker
		$('.inline-datepicker').datepicker({
			todayHighlight : true
		});
		//iCheck for checkbox and radio inputs

		$("#submitbtn").click(function() {

			var startDate = $("#startDate").val();
			var endDate = $("#endDate").val();
			var userIds=$("#userIds").val();
			var err = 0;

			if(userIds==null){
				$("#erruserIds").text("Select Atleast one Employee");
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

			var start = Date.parse(startDate);
			var end = Date.parse(endDate);
			var d=new Date();
			var currentDateStr=(d.getMonth()+1)+"/"+d.getDate()+"/"+d.getFullYear();
			console.log(currentDateStr);
			var currentDate=Date.parse(currentDateStr);
			
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

			if (err != 0) {
				return false;
			}
 
		});
		
		
		$("#userIds").change(function() {
			$("#erruserIds").text("");
		});
		

		$("#startDate").focus(function() {
			$("#errstartDate").text("");
		});
		$("#endDate").focus(function() {
			$("#errendDate").text("");
		});

	});
</script>
