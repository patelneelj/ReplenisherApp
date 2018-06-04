 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Login</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userpages/bootstrap/css/bootstrap.min.css"> 
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userpages/dist/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userpages/dist/css/skin-blue.min.css">  
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper admin-login">
  <!-- Main Header -->
  <header class="main-header">   
    <a href="#" class="logo">     
      <span class="logo-mini"><img src="${pageContext.request.contextPath}/resources/userpages/dist/img/feedback.jpg" /></span>     
      <span class="logo-lg"><img src="${pageContext.request.contextPath}/resources/userpages/dist/img/walmart.png" style="height: 50px;" /></span>
    </a>
   
    <nav class="navbar navbar-static-top hidden-xs" role="navigation">  
    </nav>
  </header>  

  <!-- Content Wrapper-->
  <div class="content-wrapper">  
    <section class="row content-header">
      <div class="callout callout-info">
        <h3 class="text-center">Task Management App
</h3>
      </div>
    </section>
   
    <section class="login-wrapper">
	  <div class="row">
					<div class="col-lg-8">
						<img src="${pageContext.request.contextPath}/resources/userpages/dist/img/login_bg1.png" class="img-responsive" alt="login_bg">
					</div>
                    <div class="row col-lg-4">
                        <h3 class="page-header text-center">User Console Login</h3>
						<form action="j_spring_security_check" id="loginForm" method="post">
							  <div class="form-group input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
								<input class="form-control" type="text" name="j_username" placeholder="username"/>          
							  </div>
							  <div class="form-group input-group">
								<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
								<input class="form-control" type="password" name="j_password" placeholder="password"/>     
							  </div>
							  
							  <c:if test="${'fail' eq param.auth}">
		          					<div class="alert alert-danger" id ="message">
		                                Login failed!!. Invalid Username or Password.
		                            </div>
   								 </c:if>
							  
							  <div class="form-group">
								<button type="submit" class="btn btn-info btn-block">Login</button>
							  </div>
						</form>					
                    </div>
                    <!-- /.col-lg-12 -->
                </div>

    </section>
     </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->

</div>

<!-- REQUIRED JS SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/userpages/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/userpages/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/userpages/dist/js/app.min.js"></script>



</body>
</html>
