<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Add Task</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userpages/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userpages/bootstrap/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userpages/dist/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userpages/dist/css/skin-blue.min.css">    
    
    <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/dist/css/bootstrap-multiselect.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">
        <!-- Main Header -->
        <header class="main-header">
            <a href="home.html" class="logo">
                <span class="logo-mini"><img src="${pageContext.request.contextPath}/resources/userpages/dist/img/walmart.png" style="height: 50px;" /></span>    
				<span class="logo-lg"><img src="${pageContext.request.contextPath}/resources/userpages/dist/img/walmart.png"  style="height: 50px;" /></span>
            </a>

            <nav class="navbar navbar-static-top" role="navigation">
                <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
                    <span class="sr-only">Toggle navigation</span>
                </a>
                <a href="login.html" class="logout-btn pull-right" role="button">
                    <span> Logout</span>
                </a>
            </nav>
        </header>
        <aside class="main-sidebar">
            <section class="sidebar">
                <ul class="sidebar-menu">
                    <li><a href="userdashboard.html"><i class="fa fa-dashboard"></i> <span>Dashboard</span></a>
                    </li>
                    <li class="active"><a href="mytasklist.html"><i class="fa fa-credit-card"></i> <span>Open Task</span></a>
                    </li>
                    <li><a href="myclosetasklist.html"><i class="fa fa-file-text"></i> <span>Close Task</span></a>
                    </li>
                </ul>

            </section>
        </aside>

        <div class="content-wrapper inner-wrapper">
            <section class="content-header">
                <div class="callout callout-info">
                    <h4>Welcome User!!</h4>
                </div>
            </section>

            <section class="content">

                <div class="box box-primary">
                    <div style="background-color:#fff;">
                      
								<p style="color: #666;font-size:18px;margin: 20px 20px 10px;">Create Task for all Selected Employee!!</p>
						</div>
						<form:form action="submittask.html" modelAttribute="taskdto" method="post">
						<div class="col-md-12">
							 <div class="row">
							 	<div class="col-md-3"></div>
							 		<div class="col-md-5">
									<div class="form-group">
										<label>Task Name:</label>
										<form:input path="taskName" class="form-control" />
									</div>
									
									<div class="form-group">
										<label>Subject:</label>
										<form:select class="form-control" path="subject">
										<c:forEach items="${subjectlist }" var="s">
											<form:option value="${s.name }">${s.name }</form:option>
										</c:forEach>
											
										</form:select>
									</div>
									
									<div class="form-group">
										<label>Priority:</label>
										<form:select class="form-control" path="priority">
											<option>High</option>
											<option>Medium</option>
											<option>Low</option>
										</form:select>
									</div>
									
									<div class="form-group">
										<label>Assign Members:</label>
										<form:select path="userIds" class="form-control" id="addmember" multiple="multiple">
											<c:forEach items="${userlist }" var="u">
											<form:option value="${u.userId }">${u.firstName } ${u.lastName }</form:option>
										</c:forEach>
										</form:select>
									</div>
									<div class="form-group">
										<div class="checkbox">
	                                                <label>
	                                                    <form:checkbox path="recurring"  value="Yes"/>Repeat EveryDay
	                                                </label>
	                                    </div>
									</div>
									<div class="form-group">
										<button type="submit" class="btn btn-primary">Create Task</button>
									</div>
									
								
									
									</div>
							</div>
						</div>
						</form:form>
                    </div>
                </div>
			
			
            </section>
        </div>

        <!-- Main Footer -->
        <footer class="main-footer">
            <div class="pull-right hidden-xs">

            </div>
            <strong>Copyright &copy; 2018 <a href="#">SmartTask Management</a>.</strong> All rights reserved.
        </footer>
    </div>

    <!-- REQUIRED JS SCRIPTS -->
    <script src="${pageContext.request.contextPath}/resources/userpages/bootstrap/js/jquery-2.2.3.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/userpages/bootstrap/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/resources/userpages/dist/js/app.min.js"></script>
    
    <script
	src="${pageContext.request.contextPath}/resources/dist/js/bootstrap-multiselect.js"></script>
	
	
    
    <script type="text/javascript">

$(document).ready(function(){
	
	$('#addmember').multiselect({
		enableFiltering : true,
		enableCaseInsensitiveFiltering : true,
		maxHeight : 200
	});
	
	$(".customclick").on("click",function(){
		
		
	});
});

</script>

</body>

</html>