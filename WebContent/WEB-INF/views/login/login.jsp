<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.my-box { border:1px solid; padding:10px; }

</style>
</head>
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>회원가입</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/build/css/custom.min.css"
	rel="stylesheet">




<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/bootstrap-3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link
	href="${pageContext.request.contextPath}/bootstrap-3.3.7/assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/bootstrap-3.3.7/assets/css/carousel/carousel.css"
	rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="${pageContext.request.contextPath}/bootstrap-3.3.7/assets/js/ie-emulation-modes-warning.js"></script>




</head>
<body>
	<header>
		<jsp:include page="/sidebar/header.jsp" />
	</header>


	<div class="container" style="margin-top: 20px;">
		<div class="main_container">

			<!-- page content -->
			<div role="main">
				<!-- class="right_col" 이거 뺌-->
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Form Wizards</h3>
						</div>

					</div>
					<div class="clearfix"></div>

					<div class="row">
						<div class="col-sm-2"></div>
							<div class="col-sm-8 col-xs-12">
								<div class="x_panel">
									<div class="x_title">
									<h2>
										로그인 <small>KosBus</small>
									</h2>

									<div class="clearfix"></div>
								</div>
					<div class="col-xs-12 col-sm-8 col-sm-offset-2 text">
					<div class="row">
						<div align="center">
						<img src="${pageContext.request.contextPath}/images/logo2.png" style="width:300px;height:200px;margin-top:20px">
						</div>
						<div class="form-top">
							<div class="form-top-center">

						<div class="form-bottom">
							<form role="form" action="${pageContext.request.contextPath}/login" method="post" name = "f"
								class="login-form" style="margin-bottom: 20px ">
								<div class="form-group">
									<label class="sr-only" for="form-username">Username</label> <input
										type="text" name="username" placeholder="ID.."
										class="form-username form-control" id="form-username">
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-password">Password</label> <input
										type="password" name="password" placeholder="Password..."
										class="form-password form-control" id="form-password">
								<br>
								<input type="submit" class="btn btn-primary btn-lg btn-block" value = "로그인">
								<br>
								<div class="col-xs-6 col-sm-6" align="center">
								<a href="search.htm" class="btn btn-primary btn-sm btn-block">아이디/비밀번호찾기</a>
								</div>
								<div class="col-xs-6 col-sm-6" align="center">
							<a href="join.htm" class="btn btn-primary btn-sm btn-block">회원가입</a>
								</div>
								</div>
							</form>
											<c:if test="${param.error != null}">
												<div>

													로그인 실패 <br>
													<script>
														alert("노답");
													</script>
													<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
      												이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
													</c:if>
												</div>
											</c:if>
											
											
											
											
										</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		</div>
		
</div>
						
					</div>
				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<jsp:include page="/sidebar/footer.jsp" />
			</footer>
			<!-- /footer content -->
		</div>
	




<!-- BEGIN # MODAL LOGIN -->
	<div class="modal fade" id="email-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	<div class="modal-dialog">
			<div class="modal-content">      
                <!-- Begin # DIV Form -->
                <div id="div-forms">
                <div class="modal-header" align="center">
					<h3>이메일 인증</h3>
					<hr>
				</div>
                    <!-- Begin # Login Form -->
                    <form id="login-form" action="" method="post">
		                <div class="modal-body">
				    		<div id="div-login-msg">
                                <div id="icon-login-msg" class="glyphicon glyphicon-chevron-right"></div>
                                <span id="text-login-msg">인증번호를 입력하세요.</span>
                            </div>
				    		<input id="login_username" name="username" class="form-control" type="text" placeholder="인증번호 입력" required>
        		    	</div>
        		    	<div class="modal-footer">
                            <div>
                                <a href="redirect:/join.htm"><button type="submit" class="btn btn-primary btn-lg btn-block">완료</button></a>
                            </div>
        		    	</div>
                    </form>
                    <!-- End # Login Form -->  
                </div>
                <!-- End # DIV Form --> 
			</div>
		</div>
	</div>
    <!-- END # MODAL LOGIN -->

		<!-- jQuery -->
		<script
			src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
		<!-- Bootstrap -->
		<script
			src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
		<!-- FastClick -->
		<script
			src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
		<!-- NProgress -->
		<script
			src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
		<!-- jQuery Smart Wizard -->
		<script
			src="${pageContext.request.contextPath}/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
		<!-- Custom Theme Scripts -->
		<script
			src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>
		<!-- ajax -->
		
		<!-- jQuery Smart Wizard -->
		
</body>
</html>