<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
 
    <title>Tech Know Admin Template</title>
 
    <!-- Bootstrap Core CSS -->
    <link href="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
 
    <!-- MetisMenu CSS -->
    <link href="${pageContext.request.contextPath}/resources/bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">
 
    <!-- Custom CSS -->
    <link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">
 
    <!-- Custom Fonts -->
    <link href="${pageContext.request.contextPath}/resources/bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    
     <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/resources/bower_components/jquery/dist/jquery.min.js"></script>
 
    <!-- Bootstrap Core JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
 
    <!-- Metis Menu Plugin JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/bower_components/metisMenu/dist/metisMenu.min.js"></script>
 
    <!-- Custom Theme JavaScript -->
    <script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
 
 
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
 
</head>
<body>
 
   <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                   <!--  Start designing your Html body from here -->
                    		<div class="col-md-3"></div>

		<div class="col-md-6">
			<p class="lead">Create Project</p>
			<div class="panel panel-default">

				<div class="panel-body">
					<form:form id="add-serv-form" method="post"
						modelAttribute="projectAdd" action="hello.html">


						<div class="form-group">

							<label for="formSName">Name:</label>
							<form:input type="text" path="projectName" id="formSName"
								class="form-control" name="formSName" />

						</div>

						<div class="form-group">

							<label for="formSCost">Start Date</label>
							<div class="input-group date" data-date-autoclose="true"
								data-provide="datepicker">
								<form:input type="text" path="startdate" class="form-control" />
								<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
							</div>
						</div>

						<div class="form-group">

							<label for="formSCost">End Date</label>
							<div class="input-group date" data-date-autoclose="true"
								data-provide="datepicker">
								<form:input type="text" path="enddate" class="form-control" />
								<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
							</div>
						</div>

						<button type="submit" class="btn btn-primary" name="submit">Submit</button>

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
        <!-- /#page-wrapper -->
 <script>
		$(function() {
			//Initialize Select2 Elements

			//Date picker
			$('.inline-datepicker').datepicker({
				todayHighlight : true
			});
			//iCheck for checkbox and radio inputs

		});
	</script>  
   
</body>
</html>