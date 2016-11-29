<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script
	src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>

<title>KOSBUS</title>




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
<!-- iCheck -->
<link
	href="${pageContext.request.contextPath}/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">
<!-- bootstrap-progressbar -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link
	href="${pageContext.request.contextPath}/vendors/jqvmap/dist/jqvmap.min.css"
	rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/build/css/custom.min.css"
	rel="stylesheet">


</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<c:choose>
					<c:when test="${jobname == '기사'}">
						<jsp:include page="/sidebar/sidebar2.jsp"></jsp:include>
					</c:when>
					<c:otherwise>
						<jsp:include page="/sidebar/sidebar.jsp"></jsp:include>
					</c:otherwise>
				</c:choose>

				<%-- <se:authorize access="hasRole('ROLE_USER')">
       			<jsp:include page="/sidebar/sidebar2.jsp"></jsp:include>
       		</se:authorize> --%>

			</div>

			<!--상단 menu -->

			<div class="top_nav">
				<jsp:include page="/sidebar/menuHeader.jsp"></jsp:include>
			</div>
			<!-- page content -->
			<div class="right_col" role="main">
				<div class="row">
					<!-- Moris -->
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>버스(대)</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false"><i
											class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Settings 1</a></li>
											<li><a href="#">Settings 2</a></li>
										</ul></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a>
									</li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<div id="graph_bar" style="width: 100%; height: 240px;"></div>
							</div>
						</div>
					</div>


					<!-- 도넛 -->
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="x_panel tile fixed_height_320 overflow_hidden">
							<div class="x_title">
								<h2>버스</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false"><i
											class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Settings 1</a></li>
											<li><a href="#">Settings 2</a></li>
										</ul></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a>
									</li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<table class="" style="width: 100%">
									<tr>
										<th style="width: 37%;">
											<p>Top 5</p>
										</th>
										<th>
											<div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
												<p class="">Device</p>
											</div>
											<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
												<p class="">Progress</p>
											</div>
										</th>
									</tr>
									<tr>
										<td>
											<canvas id="canvas1" height="140" width="140"
												style="margin: 15px 10px 10px 0"></canvas>
										</td>
										<td>
											<table class="tile_info">
												<tr>
													<td>
														<p>
															<i class="fa fa-square blue"></i>IOS
														</p>
													</td>
													<td>40%</td>
												</tr>
												<tr>
													<td>
														<p>
															<i class="fa fa-square green"></i>Android
														</p>
													</td>
													<td>10%</td>
												</tr>
												<tr>
													<td>
														<p>
															<i class="fa fa-square purple"></i>Blackberry
														</p>
													</td>
													<td>20%</td>
												</tr>
												<tr>
													<td>
														<p>
															<i class="fa fa-square aero"></i>Symbian
														</p>
													</td>
													<td>15%</td>
												</tr>
												<tr>
													<td>
														<p>
															<i class="fa fa-square red"></i>Others
														</p>
													</td>
													<td>30%</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>


					<div class="col-md-4 col-sm-4 col-xs-12">
								<div class="x_panel">
									<div class="x_title">
										<h2>날씨</h2>
										<ul class="nav navbar-right panel_toolbox">
											<li><a class="collapse-link"><i
													class="fa fa-chevron-up"></i></a></li>
											<li class="dropdown"><a href="#" class="dropdown-toggle"
												data-toggle="dropdown" role="button" aria-expanded="false"><i
													class="fa fa-wrench"></i></a>
												<ul class="dropdown-menu" role="menu">
													<li><a href="#">Settings 1</a></li>
													<li><a href="#">Settings 2</a></li>
												</ul></li>
											<li><a class="close-link"><i class="fa fa-close"></i></a>
											</li>
										</ul>
										<div class="clearfix"></div>
									</div>
									<div class="x_content">
										<div class="row">
											<div class="col-sm-12">
												<div class="temperature">
													<b>Monday</b>, 07:30 AM <span>F</span> <span><b>C</b></span>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="col-sm-4">
												<div class="weather-icon">
													<canvas height="84" width="84" id="partly-cloudy-day"></canvas>
												</div>
											</div>
											<div class="col-sm-8">
												<div class="weather-text">
													<h2>
														Texas <br> <i>Partly Cloudy Day</i>
													</h2>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="weather-text pull-right">
												<h3 class="degrees">23</h3>
											</div>
										</div>

										<div class="clearfix"></div>

										<div class="row weather-days">
											<div class="col-sm-2">
												<div class="daily-weather">
													<h2 class="day">월</h2>
													<h3 class="degrees">25</h3>
													<canvas id="clear-day" width="32" height="32"></canvas>
													<h5>
														15 <i>km/h</i>
													</h5>
												</div>
											</div>
											<div class="col-sm-2">
												<div class="daily-weather">
													<h2 class="day">화</h2>
													<h3 class="degrees">25</h3>
													<canvas height="32" width="32" id="rain"></canvas>
													<h5>
														12 <i>km/h</i>
													</h5>
												</div>
											</div>
											<div class="col-sm-2">
												<div class="daily-weather">
													<h2 class="day">수</h2>
													<h3 class="degrees">27</h3>
													<canvas height="32" width="32" id="snow"></canvas>
													<h5>
														14 <i>km/h</i>
													</h5>
												</div>
											</div>
											<div class="col-sm-2">
												<div class="daily-weather">
													<h2 class="day">목</h2>
													<h3 class="degrees">28</h3>
													<canvas height="32" width="32" id="sleet"></canvas>
													<h5>
														15 <i>km/h</i>
													</h5>
												</div>
											</div>
											<div class="col-sm-2">
												<div class="daily-weather">
													<h2 class="day">금</h2>
													<h3 class="degrees">28</h3>
													<canvas height="32" width="32" id="wind"></canvas>
													<h5>
														11 <i>km/h</i>
													</h5>
												</div>
											</div>
											<div class="col-sm-2">
												<div class="daily-weather">
													<h2 class="day">토</h2>
													<h3 class="degrees">26</h3>
													<canvas height="32" width="32" id="cloudy"></canvas>
													<h5>
														10 <i>km/h</i>
													</h5>
												</div>
											</div>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>

							</div>

				</div>


				<div class="row">
					<div class="col-md-8 col-sm-8 col-xs-12">
						<div class="row">
							<!-- start of weather widget -->
							
							
						</div>
					</div>
				</div>
				<!-- end of weather widget -->
				
				<!-- flot -->
				<div class="row">
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="dashboard_graph x_panel">
							<div class="row x_title">
								<div class="col-md-6">
									<h3>
										Network Activities <small>Graph title sub-title</small>
									</h3>
								</div>
								<div class="col-md-4"></div>
								<div class="col-md-2">
									<select>
										<option>노선1</option>
										<option>노선2</option>
									</select>
								</div>
							</div>
							<div class="x_content">
								<div class="demo-container" style="height: 250px">
									<div id="placeholder3xx3" class="demo-placeholder"
										style="width: 100%; height: 250px;"></div>
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
			<div class="pull-right">
				Gentelella - Bootstrap Admin Template by <a
					href="https://colorlib.com">Colorlib</a>
			</div>
			<div class="clearfix"></div>
		</footer>
		<!-- /footer content -->
	</div>



	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
	<!-- Chart.js -->
	<script
		src="${pageContext.request.contextPath}/vendors/Chart.js/dist/Chart.min.js"></script>
	<!-- gauge.js -->
	<script
		src="${pageContext.request.contextPath}/vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script
		src="${pageContext.request.contextPath}/vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.time.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script
		src="${pageContext.request.contextPath}/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script
		src="${pageContext.request.contextPath}/vendors/DateJS/build/date.js"></script>
	<!-- JQVMap -->
	<script
		src="${pageContext.request.contextPath}/vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script
		src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>


	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>
	<!-- morris.js -->
	<script
		src="${pageContext.request.contextPath}/vendors/raphael/raphael.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/morris.js/morris.min.js"></script>


	<!-- Skycons -->
	<script>
		$(document)
				.ready(
						function() {
							var icons = new Skycons({
								"color" : "#73879C"
							}), list = [ "clear-day", "clear-night",
									"partly-cloudy-day", "partly-cloudy-night",
									"cloudy", "rain", "sleet", "snow", "wind",
									"fog" ], i;

							for (i = list.length; i--;)
								icons.set(list[i], list[i]);

							icons.play();
						});
	</script>
	<!-- /Skycons -->
	<!-- moris -->
	<script>
		Morris.Bar({
			element : 'graph_bar',
			data : [ {
				device : '마을버스',
				geekbench : 600
			}, {
				device : '시내버스',
				geekbench : 459
			}, {
				device : '시외버스',
				geekbench : 541
			}, {
				device : '고속버스',
				geekbench : 400
			}, {
				device : '전체버스',
				geekbench : 2000
			} ],
			xkey : 'device',
			ykeys : [ 'geekbench' ],
			labels : [ '대' ],
			barRatio : 0.4,
			barColors : [ '#26B99A', '#34495E', '#ACADAC', '#3498DB' ],
			xLabelAngle : 35,
			hideHover : 'auto',
			resize : true
		});
	</script>
	<!-- /moris -->

	<!-- Flot -->
	<script>
		$(document).ready(
				function() {
					//random data
					var d1 = [ [ 0, 1 ], [ 1, 9 ], [ 2, 6 ], [ 3, 10 ],
							[ 4, 5 ], [ 5, 17 ], [ 6, 6 ], [ 7, 10 ], [ 8, 7 ],
							[ 9, 11 ], [ 10, 35 ], [ 11, 9 ], [ 12, 12 ],
							[ 13, 5 ], [ 14, 3 ], [ 15, 4 ], [ 16, 9 ] ];

					//flot options
					var options = {
						series : {
							curvedLines : {
								apply : true,
								active : true,
								monotonicFit : true
							}
						},
						colors : [ "#26B99A" ],
						grid : {
							borderWidth : {
								top : 0,
								right : 0,
								bottom : 1,
								left : 1
							},
							borderColor : {
								bottom : "#7F8790",
								left : "#7F8790"
							}
						}
					};
					var plot = $.plot($("#placeholder3xx3"), [ {
						label : "Registrations",
						data : d1,
						lines : {
							fillColor : "rgba(150, 202, 89, 0.12)"
						}, //#96CA59 rgba(150, 202, 89, 0.42)
						points : {
							fillColor : "#fff"
						}
					} ], options);
				});
	</script>
	<!-- /Flot -->
	<!-- Doughnut Chart -->
	<script>
		$(document).ready(
				function() {
					var options = {
						legend : false,
						responsive : false
					};

					new Chart(document.getElementById("canvas1"), {
						type : 'doughnut',
						tooltipFillColor : "rgba(51, 51, 51, 0.55)",
						data : {
							labels : [ "Symbian", "Blackberry", "Other",
									"Android", "IOS" ],
							datasets : [ {
								data : [ 15, 20, 30, 10, 30 ],
								backgroundColor : [ "#BDC3C7", "#9B59B6",
										"#E74C3C", "#26B99A", "#3498DB" ],
								hoverBackgroundColor : [ "#CFD4D8", "#B370CF",
										"#E95E4F", "#36CAAB", "#49A9EA" ]
							} ]
						},
						options : options
					});
				});
	</script>
	<!-- /Doughnut Chart -->
</body>
</html>
