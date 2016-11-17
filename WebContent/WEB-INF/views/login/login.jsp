<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>KOSBUS 로그인</title>

<!-- CSS -->
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Roboto:400,100,300,500">
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/form-elements.css">
<link rel="stylesheet" href="assets/css/style.css">

<link href="bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="bootstrap-3.3.7/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">
    <script src="bootstrap-3.3.7/assets/js/ie-emulation-modes-warning.js"></script>
    <script src="http://www.w3schools.com/lib/w3data.js"></script>
  	<script src="bootstrap-3.3.7/assets/css/carousel/jssor.slider-21.1.6.mini.js" type="text/javascript"></script>
  	<script src="bootstrap-3.3.7/assets/css/carousel/docs.min.js" type="text/javascript"></script>
  	<script src="bootstrap-3.3.7/assets/css/carousel/bootstrap.min.js" type="text/javascript"></script>
	<script type="text/javascript" src="bootstrap-3.3.7/assets/css/carousel/ie10-viewport-bug-workaround.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
    <script src="bootstrap-3.3.7/assets/js/ie10-viewport-bug-workaround.js"></script>
    <script src="bootstrap-3.3.7/assets/js/vendor/holder.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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

	<!-- Top content -->
	<div class="top-content" style="margin-top:30px">
		<div class="inner-bg">
			<div class="container">
			<div class="col-sm-2"></div>
				<div class="col-sm-8">
								<div class="x_panel">
									<div class="x_title">
									<h2>
										로그인 <small>KosBus</small>
									</h2>

									<div class="clearfix"></div>
								</div>
					<div class="col-sm-8 col-sm-offset-2 text">
					<div class="row">
						<img src="${pageContext.request.contextPath}/images/logo2.png" style="width:300px;height:200px;margin-top:20px">
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
								<div class="col-sm-6" align="center">
								<a href="search.htm" class="btn btn-primary btn-sm btn-block">아이디/비밀번호찾기</a>
								</div>
								<div class="col-sm-6" align="center">
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

	<footer> 
		<div class ="container">
			<jsp:include page="/sidebar/footer.jsp" /> 
		</div>
	</footer>
	<!-- Javascript -->
	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/jquery-1.11.1.js"></script>

	<!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
</body>
</html>