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
				<h1 class="page-header">Add Questions To Feedback</h1>

				<div class="panel panel-primary">

					<div class="panel-body">
						<form:form id="add-serv-form" method="post"
							modelAttribute="getQuestions" action="savequestions.html">
							
							<div class="form-group">

								<label>Select Feedback:</label>

								<form:select id="feedbackid" class="form-control" path="feedbackId">
									<c:forEach items="${inactiveFeedbackList}" var="c">
										<form:option value="${c.feedbackId }">${c.feedbackName }</form:option>
									</c:forEach>
								</form:select>
								<font color='red'>
									<div id="errfeedbackId"></div>
								</font>	
							</div>
							



							<div class="form-group">
								<label for="formSName">Question for Attendence:</label>
								<form:textarea path="attendence" id="attendence"
									class="form-control" rows="2"/>
								<font color='red'>
									<div id="errfeedbackName"></div>
								</font>	
							</div>

							<div class="form-group">
								<label for="formSName">Question for Productivity:</label>
								<form:textarea path="productivity" id="productivity"
									class="form-control" rows="2"/>
								<font color='red'>
									<div id="errproductivity"></div>
								</font>	
							</div>
							
							<div class="form-group">
								<label for="formSName">Question for Dependability:</label>
								<form:textarea path="dependability" id="dependability"
									class="form-control" rows="2"/>
								<font color='red'>
									<div id="errdependability"></div>
								</font>	
							</div>
							
							<div class="form-group">
								<label for="formSName">Question for Relations & Commitment:</label>
								<form:textarea path="relationAndComm" id="relationandcomm"
									class="form-control" rows="2"/>
								<font color='red'>
									<div id="errrelationandcomm"></div>
								</font>	
							</div>
							
							<div class="form-group">
								<label for="formSName">Question for Employee Rating:</label>
								<form:textarea path="rating" id="rating"
									class="form-control" rows="2"/>
								<font color='red'>
									<div id="errrating"></div>
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


		$("#submitbtn").click(function() {

			var attendence = $("#attendence").val();
			var productivity = $("#productivity").val();
			var dependability = $("#dependability").val();
			var randc = $("#relationandcomm").val();
			var rating = $("#rating").val();
			
			var err = 0;
a
			if (attendence == " " || attendence.length == 0) {
				$("#errattendence").text("Enter Question");
				err++;
			}
			if (productivity == " "|| productivity.length == 0) {
				$("#errproductivity").text("Enter Question");
				err++;
			}
			if (dependability == " "|| dependability.length == 0) {
				$("#errdependability").text("Enter Question");
				err++;
			}
			if (randc == " " || randc.length == 0) {
				$("#errrelationandcomm").text("Enter Question");
				err++;
			}
			if (rating == " " || rating.length == 0) {
				$("#errrating").text("Enter Question");
				err++;
			}

			if (err != 0) {
				return false;
			}

		});

		$("#attendence").focus(function() {
			$("#errattendence").text("");
		});
		$("#productivity").focus(function() {
			$("#errproductivity").text("");
		});
		$("#dependability").focus(function() {
			$("#errdependability").text("");
		});
		$("#relationAndComm").focus(function() {
			$("#errrelationandcomm").text("");
		});
		$("#rating").focus(function() {
			$("#errrating").text("");
		});

	});
</script>
