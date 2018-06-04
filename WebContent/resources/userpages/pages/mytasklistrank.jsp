<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>My Feedback</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userpages/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userpages/bootstrap/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userpages/dist/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/userpages/dist/css/skin-blue.min.css">    
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
                    <li ><a href="myclosetasklist.html"><i class="fa fa-file-text"></i> <span>Close Task</span></a>
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
                      <div class="col-md-12">
								<p style="color: #666;font-size:18px;margin: 20px 20px 10px;">Click on Button to close or comment Task</p>
						</div>
						
						 <div class="row">
							<div class="col-xs-12">
								<div class="table-responsive">
								 <table class="table table-bordered config-table">
                                        <tr>
                                             <th style="background-color: #aeb5b5;">Rank</th>
                                            <th style="background-color: #aeb5b5;">Task Name</th>
                                            <th style="background-color: #aeb5b5;">Subject</th>
                                            <th style="background-color: #aeb5b5;">Priority</th>
                                             <th style="background-color: #aeb5b5;">End Date</th>
                                            <th style="background-color: #aeb5b5;">status</th>
                                            <th style="background-color: #aeb5b5;">Created By</th>
											<td style="background-color: #aeb5b5;">Action</td>
                                        </tr>
                                        
                                        <c:forEach items="${tasklist }" var="t" varStatus="ti">
                                        <tr>
                                        	<th>${ti.index +1 }</th>
                                        	<th>${t.taskId.name }</th>
                                        	<td>${t.taskId.subject }</td>
                                        	<td>${t.taskId.priority }</td>
                                        	<td>${t.taskId.estimatedDate }</td>
                                        	<th>${t.taskId.status }</th>
                                        	<th>${t.taskId.createdBy.firstName }</th>
                                        	<td><button type="button" class="pull-left btn btn-primary btn-yes customclick" id="${t.taskId.id }">Comment/Close</button></td>
                                        </tr>
                                        </c:forEach>
                                        
                                                                                
                                    </table>								
							
								</div>
								</div>
								</div>
							<div class="row">
								<div class="col-md-4"></div>
								<div class="col-md-2">
									<div class="form-group">
										<a href="mytasklist.html">Go Back</a>
									</div>
								</div>
								
							</div>
                    </div>
                </div>
			<form id="viewtaskdetails" action="viewtaskdetails.html" method="post" >
                	
                	<input type="hidden" name="tid" id="taskid"/>
                </form>
			
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
    
    <script type="text/javascript">

$(document).ready(function(){
	$(".customclick").on("click",function(){
		 var tdid= $(this).attr("id");
		$("#taskid").val(tdid); 
		$("#viewtaskdetails").submit();
		
	});
});

</script>

</body>

</html>