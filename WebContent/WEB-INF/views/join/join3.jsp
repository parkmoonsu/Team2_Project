<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.my-box {
	border: 1px solid;
	padding: 10px;
}

.form_wizard .stepContainer {
	display: block;
	position: relative;
	margin: 0;
	padding: 0;
	border: 0 solid #CCC;
	overflow-x: hidden;
}

.wizard_horizontal ul.wizard_steps {
	display: table;
	list-style: none;
	position: relative;
	width: 100%;
	margin: 0 0 20px;
}

.wizard_horizontal ul.wizard_steps li {
	display: table-cell;
	text-align: center;
}

.wizard_horizontal ul.wizard_steps li a, .wizard_horizontal ul.wizard_steps li:hover
	{
	display: block;
	position: relative;
	-moz-opacity: 1;
	filter: alpha(opacity = 100);
	opacity: 1;
	color: #666;
}

.wizard_horizontal ul.wizard_steps li a:before {
	content: "";
	position: absolute;
	height: 4px;
	background: #ccc;
	top: 20px;
	width: 100%;
	z-index: 4;
	left: 0;
}

.wizard_horizontal ul.wizard_steps li a.disabled .step_no {
	background: #ccc;
}

.wizard_horizontal ul.wizard_steps li a .step_no {
	width: 40px;
	height: 40px;
	line-height: 40px;
	border-radius: 100px;
	display: block;
	margin: 0 auto 5px;
	font-size: 16px;
	text-align: center;
	position: relative;
	z-index: 5;
}

.wizard_horizontal ul.wizard_steps li a.selected:before, .step_no {
	background: #34495E;
	color: #fff;
}

.wizard_horizontal ul.wizard_steps li a.done:before, .wizard_horizontal ul.wizard_steps li a.done .step_no
	{
	background: #1ABB9C;
	color: #fff;
}

.wizard_horizontal ul.wizard_steps li:first-child a:before {
	left: 50%;
}

.wizard_horizontal ul.wizard_steps li:last-child a:before {
	right: 50%;
	width: 50%;
	left: auto;
}

.wizard_verticle .stepContainer {
	width: 80%;
	float: left;
	padding: 0 10px;
}

.actionBar {
	width: 100%;
	border-top: 1px solid #ddd;
	padding: 10px 5px;
	text-align: right;
	margin-top: 10px;
}

.actionBar .buttonDisabled {
	cursor: not-allowed;
	pointer-events: none;
	opacity: .65;
	filter: alpha(opacity = 65);
	box-shadow: none;
}

.actionBar a {
	margin: 0 3px;
}

.wizard_verticle .wizard_content {
	width: 80%;
	float: left;
	padding-left: 20px;
}

.wizard_verticle ul.wizard_steps {
	display: table;
	list-style: none;
	position: relative;
	width: 20%;
	float: left;
	margin: 0 0 20px;
}

.wizard_verticle ul.wizard_steps li {
	display: list-item;
	text-align: center;
}

.wizard_verticle ul.wizard_steps li a {
	height: 80px;
}

.wizard_verticle ul.wizard_steps li a:first-child {
	margin-top: 20px;
}

.wizard_verticle ul.wizard_steps li a, .wizard_verticle ul.wizard_steps li:hover
	{
	display: block;
	position: relative;
	-moz-opacity: 1;
	filter: alpha(opacity = 100);
	opacity: 1;
	color: #666;
}

.wizard_verticle ul.wizard_steps li a:before {
	content: "";
	position: absolute;
	height: 100%;
	background: #ccc;
	top: 20px;
	width: 4px;
	z-index: 4;
	left: 49%;
}

.wizard_verticle ul.wizard_steps li a.disabled .step_no {
	background: #ccc;
}

.wizard_verticle ul.wizard_steps li a .step_no {
	width: 40px;
	height: 40px;
	line-height: 40px;
	border-radius: 100px;
	display: block;
	margin: 0 auto 5px;
	font-size: 16px;
	text-align: center;
	position: relative;
	z-index: 5;
}

.wizard_verticle ul.wizard_steps li a.selected:before, .step_no {
	background: #34495E;
	color: #fff;
}

.wizard_verticle ul.wizard_steps li a.done:before, .wizard_verticle ul.wizard_steps li a.done .step_no
	{
	background: #1ABB9C;
	color: #fff;
}

.wizard_verticle ul.wizard_steps li:first-child a:before {
	left: 49%;
}

.wizard_verticle ul.wizard_steps li:last-child a:before {
	left: 49%;
	left: auto;
	width: 0;
}

.form_wizard .loader {
	display: none;
}

.form_wizard .msgBox {
	display: none;
}
.wizard_steps{
	color: black;
}
.small {
	color: black;
}
.my-box{
	color: black;
}
</style>
</head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>KosBus로그인</title>

<!-- CSS -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/loginassets/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/loginassets/assets/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/loginassets/assets/css/form-elements.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/loginassets/assets/css/style.css">
<link rel="stylesheet" id="theme-switch"
	href="${pageContext.request.contextPath}/mainCss/css/style.css">


</head>
<body>
	<header role="banner" id="fh5co-header">
		<div class="container">
			<!-- <div class="row"> -->
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar"><i></i></a> <a class="navbar-brand"
						href="bus.htm">RoadOneBell</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="bus.htm" data-nav-section="home"><span>Home</span></a></li>
						<li><a href="login.htm" id="log"><span>로그인</span></a>&nbsp;&nbsp;</li>
						<li><a href="join.htm" id="gaip"><span>회원가입</span></a></li>
					</ul>
				</div>
			</nav>
		</div>
	</header>

	<div class="top-content">

		<div class="inner-bg" style="padding-top: 60px; padding-bottom: 60px">
			<div class="container">
				<div class="row">
				<hr>
					<div class="col-sm-1"></div>
					<div class="col-md-10 col-sm-10 col-xs-10 form-box">
						<div class="form-top" align="center" style="color: black">
								<div class="form-top-center">
						<div class="x_panel">
							<div class="x_title">
								<h2>
									회원가입 <small>KosBus</small>
								</h2>

								<div class="clearfix"></div>
							</div>
							<div class="x_content">


								<!-- Smart Wizard -->

								<div id="wizard" class="form_wizard wizard_horizontal">
									<ul class="wizard_steps">
										<li><a href="#step-3"> <span class="step_no">1</span>
												<span class="step_descr"> Step 1<br /> <small>
														약관동의</small>
											</span>
										</a></li>
										<li><a href="#step-3"> <span class="step_no">2</span>
												<span class="step_descr"> Step 2<br /> <small>
														정보작성</small>
											</span>
										</a></li>
										<li><a href="#step-3"> <span class="step_no">3</span>
												<span class="step_descr"> Step 3<br /> <small>
														가입완료</small>
											</span>
										</a></li>

									</ul>
									<!-- class='rounded' -->

									<div id="step-3"
										style="text-align: center; border-radius: 10px; border: 1px solid #ccc; height: 300px">
										<br>
										<p style="margin-top: 90px">
											<font size="4">가입이 완료되었습니다.<br> 관리자의 승인 후 이용해
												주세요
											</font>
										<div style="text-align: center; margin: 30px;">
											<input type="button" value="메인화면으로" class="btn btn-default"
												id="next">
										</div>

									</div>
									<!-- End SmartWizard Content -->
								</div>
								<!-- End SmartWizard Content -->
							</div>
						</div>
						</div>
						</div>
					</div>

				</div>
			</div>
			<br><br><hr>
                <footer>
				<jsp:include page="/sidebar/footer.jsp" />
			</footer>
		</div>
	</div>




	<!-- Javascript -->
	<script
		src="${pageContext.request.contextPath}/loginassets/assets/js/jquery-1.11.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/loginassets/assets/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/loginassets/assets/js/jquery.backstretch.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/loginassets/assets/js/scripts.js"></script>
	<script type="text/javascript">
        $(function() {
        	$("#next").click(function(){
				location.href = "bus.htm";
			});		
			
			$('#wizard').smartWizard();

					$('#wizard_verticle').smartWizard({
						transitionEffect : 'slide'
					});

		
		});
        </script>

</body>
</html> <%-- 
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.my-box { border:1px solid; padding:10px; }

bodoy{
margin-left: 0px;
}
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

<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>RoadOneBell로그인</title>

        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/css/form-elements.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/css/style.css">
        <link rel="stylesheet" id="theme-switch" href="${pageContext.request.contextPath}/mainCss/css/style.css">
        
<body>
<header role="banner" id="fh5co-header">
			<div class="container">
				<!-- <div class="row"> -->
			    <nav class="navbar navbar-default">
		        <div class="navbar-header">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
		         <a class="navbar-brand" href="bus.htm">RoadOneBell</a> 
		        </div>
		        <div id="navbar" class="navbar-collapse collapse">
		          <ul class="nav navbar-nav navbar-right">
		            <li class="active"><a href="bus.htm" data-nav-section="home"><span>Home</span></a></li> 
		            <li><a href="#" id="log"><span>로그인</span></a>&nbsp;&nbsp;</li>
		           	<li><a href="#" id="gaip"><span>회원가입</span></a></li>
		          </ul>
		        </div>
			    </nav>
		  </div>
	</header>


	<div class="container" style="margin-top: 20px;">
		<div class="main_container">

			<!-- page content -->
			<div role="main">
				<!-- class="right_col" 이거 뺌-->
					<div class="clearfix"></div>

					<div class="row">

						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
							<!-- 	<div class="x_title">
									
								</div> -->
								<div class="x_content">


									<!-- Smart Wizard -->
									
									<div id="wizard" class="form_wizard wizard_horizontal">
										<ul class="wizard_steps">
											<li><a href="#step-3"> <span class="step_no">1</span>
													<span class="step_descr"> Step 1<br /> <small>
															약관동의</small>
												</span>
											</a></li>
											<li><a href="#step-3"> <span class="step_no">2</span>
													<span class="step_descr"> Step 2<br /> <small>
															정보작성</small>
												</span>
											</a></li>
											<li><a href="#step-3"> <span class="step_no">3</span>
													<span class="step_descr"> Step 3<br /> <small>
															가입완료</small>
												</span>
											</a></li>

										</ul><!-- class='rounded' -->
										
										<div id="step-3" style="text-align: center; border-radius: 10px; border: 1px solid #ccc; height:300px" >
											<br>
											<p style="margin-top:90px">
											<font size="4" >가입이 완료되었습니다.<br>
											    관리자의 승인 후 이용해 주세요</font>
											<div style = "text-align:center; margin:30px;">
												<input type = "button" value = "메인화면으로" class = "btn btn-default" id = "next">
											</div>

										</div>
										<!-- End SmartWizard Content -->
									</div>
									<!-- End SmartWizard Content -->
								</div>
							</div>
						</div>
					</div>
			</div>
			<!-- /page content -->
		</div>
			<!-- footer content -->
			<footer>
				<jsp:include page="/sidebar/footer.jsp" />
			</footer>
			<!-- /footer content -->
		</div>	
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
		<script>
		
			$(document).ready(function() {
				$("#next").click(function(){
					location.href = "bus.htm";
				});		
				
				$('#wizard').smartWizard();

						$('#wizard_verticle').smartWizard({
							transitionEffect : 'slide'
						});

					});
		</script>
		<!-- /jQuery Smart Wizard -->
</body>
</html> --%>