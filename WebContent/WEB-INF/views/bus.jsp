<!--
 * @File Name: bus.jsp
 * @Author: 조한솔
 * @Data: 2016. 11. 29
 * @Desc: 메인페이지2
-->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>


<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>RoadOneBell</title>

<script
	src="${pageContext.request.contextPath}/NewLoader/js/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/NewLoader/js/jquery.oLoader.min.js"></script>
<!-- Animate.css -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mainCss/css/animate.css">
<!-- Icomoon Icon Fonts-->
<!-- Simple Line Icons -->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mainCss/css/icomoon.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mainCss/css/simple-line-icons.css">
<!-- Bootstrap  -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mainCss/css/bootstrap.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/mainCss/css/style.css">

<!-- Styleswitcher ( This style is for demo purposes only, you may delete this anytime. ) -->
<link rel="stylesheet" id="theme-switch"
	href="${pageContext.request.contextPath}/mainCss/css/style.css">
<!-- End demo purposes only -->


<style>
/* For demo purpose only */

/* For Demo Purposes Only ( You can delete this anytime :-) */
#colour-variations {
	padding: 10px;
	-webkit-transition: 0.5s;
	-o-transition: 0.5s;
	transition: 0.5s;
	width: 140px;
	position: fixed;
	left: 0;
	top: 100px;
	z-index: 999999;
	background: #fff;
	/*border-radius: 4px;*/
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
	-webkit-box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
	-moz-box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
	-ms-box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
	box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
}

#colour-variations.sleep {
	margin-left: -140px;
}

#colour-variations h3 {
	text-align: center;;
	font-size: 11px;
	letter-spacing: 2px;
	text-transform: uppercase;
	color: #777;
	margin: 0 0 10px 0;
	padding: 0;;
}

#colour-variations ul, #colour-variations ul li {
	padding: 0;
	margin: 0;
}

#colour-variations li {
	list-style: none;
	display: block;
	margin-bottom: 5px !important;
	float: left;
	width: 100%;
}

#colour-variations li a {
	width: 100%;
	position: relative;
	display: block;
	overflow: hidden;
	-webkit-border-radius: 4px;
	-moz-border-radius: 4px;
	-ms-border-radius: 4px;
	border-radius: 4px;
	-webkit-transition: 0.4s;
	-o-transition: 0.4s;
	transition: 0.4s;
}

#colour-variations li a:hover {
	opacity: .9;
}

#colour-variations li a>span {
	width: 33.33%;
	height: 20px;
	float: left;
	display: -moz-inline-stack;
	display: inline-block;
	zoom: 1;
	*display: inline;
}

.option-toggle {
	position: absolute;
	right: 0;
	top: 0;
	margin-top: 5px;
	margin-right: -30px;
	width: 30px;
	height: 30px;
	background: #f64662;
	text-align: center;
	border-top-right-radius: 4px;
	border-bottom-right-radius: 4px;
	color: #fff;
	cursor: pointer;
	-webkit-box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
	-moz-box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
	-ms-box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
	box-shadow: 0 0 9px 0 rgba(0, 0, 0, .1);
}

.option-toggle i {
	top: 2px;
	position: relative;
}

.option-toggle:hover, .option-toggle:focus, .option-toggle:active {
	color: #fff;
	text-decoration: none;
	outline: none;
}

#loading {
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px;
	position: fixed;
	display: block;
	opacity: 0.7;
	background-color: #fff;
	z-index: 99;
	text-align: center;
}
</style>
<!-- End demo purposes only -->


<!-- Modernizr JS -->
<script
	src="${pageContext.request.contextPath}/mainCss/js/modernizr-2.6.2.min.js"></script>


</head>
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
		            <li class="active"><a href="#" data-nav-section="home"><span>Home</span></a></li>
		            <li><a href="#" data-nav-section="work"><span>Work</span></a></li> 
		            <li><a href="#" id="log"><span>로그인</span></a></li>
		           	<li><a href="#" id="gaip"><span>회원가입</span></a></li>
		          </ul>
		        </div>
			    </nav>
		  </div>

	</header>
	<section id="fh5co-home" data-section="home"
		data-stellar-backgmacubround-ratio="0.5"
		style="background-image: url(images/newbackground.jpg);">

		<div class="gradient"></div>
		<div class="container">
			<div class="text-wrap">
				<div class="text-inner">
					<div class="row">
						<div class="col-md-9 col-md-offset-2" style="padding-top: 15px">
							<h1 class="to-animate">새로운 통합 버스 관리 시스템,</h1>
							<h1 class="to-animate">RoadOneBell 입니다.</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="slant"></div>
	</section>

	<section id="fh5co-intro" data-section="work">
		<div class="container">
			<div class="row row-bottom-padded-lg">
				<div class="fh5co-block to-animate"
					style="background-image: url(images/img_7.jpg);">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<img src="${pageContext.request.contextPath}/images/chart.JPG"
							width="200px" height="100px">
						<h2>Chart</h2>
						<p>노선별, 정류장별, 탑승객을 시간대별로 차트를 통해 확인 할 수 있습니다.</p>

					</div>
				</div>
				<div class="fh5co-block to-animate"
					style="background-image: url(images/img_8.jpg);">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<img src="${pageContext.request.contextPath}/images/map.PNG"
							width="200px" height="100px">
						<h2>Map</h2>
						<p>실시간 버스 위치와 노선, 정류장을 지도로 관리할 수 있습니다.</p>

					</div>
				</div>
				<div class="fh5co-block to-animate"
					style="background-image: url(images/img_10.jpg);">
					<div class="overlay-darker"></div>
					<div class="overlay"></div>
					<div class="fh5co-text">
						<img src="${pageContext.request.contextPath}/images/cal.PNG"
							width="200px" height="100px">
						<h2>Calendar</h2>
						<p>캘린더를 이용하여 휴무 및 일정을 쉽고 편하게 관리할 수 있습니다.</p>

					</div>
				</div>
			</div>

		</div>
	</section>

	<footer>
		<jsp:include page="/sidebar/footer.jsp" />
	</footer>




	<!-- jQuery -->

	<!-- jQuery Easing -->
	<script
		src="${pageContext.request.contextPath}/mainCss/js/jquery.easing.1.3.js"></script>
	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/mainCss/js/bootstrap.min.js"></script>
	<!-- Waypoints -->
	<script
		src="${pageContext.request.contextPath}/mainCss/js/jquery.waypoints.min.js"></script>
	<!-- Stellar Parallax -->
	<script
		src="${pageContext.request.contextPath}/mainCss/js/jquery.stellar.min.js"></script>
	<!-- Counter -->
	<script
		src="${pageContext.request.contextPath}/mainCss/js/jquery.countTo.js"></script>
	<!-- Magnific Popup -->
	<script
		src="${pageContext.request.contextPath}/mainCss/js/jquery.magnific-popup.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/mainCss/js/magnific-popup-options.js"></script>


	<!-- Main JS (Do not remove) -->
	<script src="${pageContext.request.contextPath}/mainCss/js/main.js"></script>
	<script type="text/javascript">

$(function() {

	
	$("#log").click(function() {
		location.href="login.htm"
	});
	
	$("#gaip").click(function() {
		location.href="join.htm"
	});
	
	
});

</script>

</body>
</html>

