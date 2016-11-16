<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
            <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
            <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
        <![endif]-->

<!-- Favicon and touch icons -->
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
</head>

<body>
	<header>
	 <jsp:include page="/sidebar/header.jsp" /> 
	 </header>

	<!-- Top content -->
	<div class="top-content" style="margin-top:30px">
		<div class="inner-bg">
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2 text">
						<img src="${pageContext.request.contextPath}/images/logo2.png" style="width:300px;height:200px">
					</div>
				</div>
				<div class="row" style="margin: 0px;">
					<div class="col-sm-6 col-sm-offset-3 form-box">
						<div class="form-top">
							<div class="form-top-center">

						<div class="form-bottom">
							<form role="form" action="login2.htm" method="post"
								class="login-form">
								<div class="form-group">
									<label class="sr-only" for="form-username">Username</label> <input
										type="text" name="form-username" placeholder="ID.."
										class="form-username form-control" id="form-username">
								</div>
								<div class="form-group">
									<label class="sr-only" for="form-password">Password</label> <input
										type="password" name="form-password" placeholder="Password..."
										class="form-password form-control" id="form-password">
								<br>
								<button type="submit" class="btn btn-primary btn-lg btn-block">로그인</button>
								<br>
								<div class="col-sm-6" align="center">
									<button class="btn btn-primary">아이디/비밀번호찾기</button>
								</div>
								<div class="col-sm-6" align="center">
									<button class="btn btn-primary">회원가입</button>
								</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
</div>
	</div>

	<footer> <jsp:include page="/sidebar/footer.jsp" /> </footer>
	<!-- Javascript -->
	<script src="assets/js/jquery-1.11.1.min.js"></script>
	<script src="assets/js/jquery.backstretch.min.js"></script>
	<script src="assets/js/jquery-1.11.1.js"></script>

	<!--[if lt IE 10]>
            <script src="assets/js/placeholder.js"></script>
        <![endif]-->
</body>
</html>