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
				<h1 class="page-header">Create User</h1>

				<div class="panel panel-primary">

					<div class="panel-body">
						<form:form id="add-serv-form" method="post"
							modelAttribute="userInfo" action="saveuser.html">


							<div class="form-group">

								<label>Feedback Type:</label>

								<form:select id="roleid" class="form-control" path="roleId">

									<form:option value="2">Manager</form:option>
									<form:option value="3">Employee</form:option>
									<form:option value="4">Customer</form:option>

								</form:select>
								<font color='red'>
									<div id="errtype"></div>
								</font>
							</div>




							<div class="row">

								<div class="col-lg-6">
									<div class="form-group">
										<label for="formSName">First Name:</label>
										<form:input type="text" path="firstName" id="firstname"
											class="form-control" />
										<font color='red'>
											<div id="errfirstname"></div>
										</font>
									</div>
								</div>

								<div class="col-lg-6">
									<div class="form-group">
										<label for="formSName">Last Name:</label>
										<form:input type="text" path="lastName" id="lastname"
											class="form-control" />
										<font color='red'>
											<div id="errlastname"></div>
										</font>
									</div>
								</div>

							</div>

							


							<div class="form-group">
								<label for="formSName">Email ID:</label>
								<form:input type="email" path="emailId" id="emailid"
									class="form-control" />
								<font color='red'>
									<div id="erremailid"></div>
								</font>
							</div>

							<div class="row">
							<div class="col-lg-6">
							<div class="form-group">
								<label for="formSName">Username:</label>
								<form:input type="text" path="userName" id="username"
									class="form-control" />
								<font color='red'>
									<div id="errusername"></div>
								</font>
							</div>
							</div>

							<div class="col-lg-6">
							<div class="form-group">
								<label for="formSName">Password:</label>
								<form:input type="password" path="password" id="password"
									class="form-control" />
								<font color='red'>
									<div id="errpassword"></div>
								</font>
							</div>
							</div>
							</div>


							<div class="form-group">
								<label for="formSName">Contact No:</label>
								<form:input type="text" path="contactNo" id="contactno"
									class="form-control" />

								<font color='red'>
									<div id="errcontactno"></div>
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
	src="${pageContext.request.contextPath}/resources/dist/js/jquery.maskedinput.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/dist/js/bootstrap-datepicker.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/dist/js/metisMenu.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/dist/js/bootstrap-multiselect.js"></script>

<script>
	$(document)
			.ready(
					function() {
						//Initialize Select2 Elements

						$('#contactno').mask('999-999-9999');

						$("#submitbtn")
								.click(
										function() {

											var firstname = $("#firstname")
													.val();
											var lastname = $("#lastname").val();
											var emailid = $("#emailid").val();
											var username = $("#username").val();
											var password = $("#password").val();
											var contactno = $("#contactno")
													.val();

											var err = 0;

											if (firstname == " "
													|| firstname.length == 0) {
												$("#errfirstname").text(
														"Enter First Name");
												err++;
											}

											if (lastname == " "
													|| lastname.length == 0) {
												$("#errlastname").text(
														"Enter Last Name");
												err++;
											}

											if (emailid == " "
													|| emailid.length == 0) {
												$("#erremailid").text(
														"Enter Email Id");
												err++;
											}
											if (username == " "
													|| username.length == 0) {
												$("#errusername").text(
														"Enter User Name");
												err++;
											}

											if (password == " "
													|| password.length == 0) {
												$("#errpassword").text(
														"Enter Password");
												err++;
											}
											if (contactno == " "
													|| contactno.length == 0) {
												$("#errcontactno").text(
														"Enter Contact Number");
												err++;
											}

											if (err != 0) {
												return false;
											}

										});

						$("#firstname").focus(function() {
							$("#errfirstname").text("");
						});
						$("#lastname").focus(function() {
							$("#errlastname").text("");
						});
						$("#username").focus(function() {
							$("#errusername").text("");
						});
						$("#password").focus(function() {
							$("#errpassword").text("");
						});
						$("#emailid").focus(function() {
							$("#erremailid").text("");
						});
						$("#contactno").focus(function() {
							$("#errcontactno").text("");
						});

					});
</script>
