<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Dashboard</title>
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userpages/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userpages/dist/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userpages/dist/css/skin-blue.min.css">
  
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper dashboard-wrapper">
  <!-- Main Header -->
  <header class="main-header">  
    <a href="https://qa.pnbmetlife.com/" class="logo">     
      <span class="logo-mini"><img src="${pageContext.request.contextPath}/resources/userpages/dist/img/walmart.png" /></span>    
      <span class="logo-lg"><img src="${pageContext.request.contextPath}/resources/userpages/dist/img/walmart.png"  style="height: 50px;" /></span>
    </a>
   
    <nav class="navbar navbar-static-top hidden-xs" role="navigation">  
	 <a href="login.html" class="logout-btn pull-right" role="button">
        <span> Logout</span>
      </a>
    </nav>
  </header>  

  <!-- Content Wrapper-->
  <div class="content-wrapper">  
    <section class="row content-header">
      <div class="callout callout-info">
        <h3 class="text-left">Welcome User!!</h3>
      </div>
    </section>
   
    <section class="d-wrapper">
	  <div class="row">
			<div class="col-md-4 col-md-offset-2 col-sm-4 col-sm-offset-2">
			  <div class="thumbnail">
				<a href="createtask.html" target="_blank">
				  <img src="${pageContext.request.contextPath}/resources/userpages/dist/img/ctask.png" class="custimg" alt="managePay" style="width:100%;height:223px;" >
				  <div class="caption">
					<p class="text-center">Assign Task</p>
				  </div>
				</a>
			  </div>
			</div>
			<div class="col-md-4 col-sm-4">
			  <div class="thumbnail">
				<a href="mytasklist.html" target="_blank">
				  <img src="${pageContext.request.contextPath}/resources/userpages/dist/img/mytask.jpg" class="custimg" alt="log" style="width:100%;height:223px;">
				  <div class="caption">
					<p class="text-center">My Task</p>
				  </div>
				</a>
			  </div>
			</div>
        </div>
    </section>
     </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
   <footer class="main-footer">
    <div class="pull-right hidden-xs">
   &nbsp;
    </div>
    <strong>Copyright &copy; 2018 <a href="#">SmartTask Management</a>.</strong> All rights reserved.
  </footer> 
</div>

<!-- REQUIRED JS SCRIPTS -->
<script src="${pageContext.request.contextPath}/resources/userpages/bootstrap/js/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/userpages/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/userpages/dist/js/app.min.js"></script>

</body>
</html>
