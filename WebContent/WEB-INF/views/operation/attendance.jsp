<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<se:authentication property="name" var="LoginUser" />
<c:set var="page" value="${page}"></c:set>

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
<script type="text/javascript">
	$(function() {
		$("#rnum").click(function(){
		    var value = $("#rnum option:selected").val();
		    var text = $("#rnum option:selected").text();
		    
		});
	});
</script>
<style type="text/css">
.backslash {
	background: url('http://cdn.zetawiki.com/png/backslash.png');
	background-size: 100% 100%;
	text-align: left;
}

.backslash div {
	text-align: right;
}

table {
	border-collapse: collapse;
	border: 1px solid;
}

th, td {
	border: 1px solid;
	/* padding: 5px; */
	text-align: center;
}


</style>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-xs-12 col-md-3 left_col">
				<jsp:include page="/sidebar/sidebar.jsp"></jsp:include>
			</div>

			<!--상단 menu -->

			<div class="top_nav">
				<jsp:include page="/sidebar/menuHeader.jsp"></jsp:include>
			</div>
			<!-- page content -->
			<div class="right_col" role="main">
				<!-- top tiles -->
				<div class="row tile_count"></div>
				<!-- /top tiles -->

				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								<small>노선별 출결현황</small>
							</h3>
						</div>
						
					</div>
					<div class="clearfix"></div>
					<c:set var="d" value="${list}" />
					<div class="row">
						<div id="showdiv">


							<div class="row">
								<div class="col-sm-12 col-xs-12">
									<div class="col-md-12 col-xs-12">
												<div class="container" style="width:120px; text-align: right">
													<select id="rnum" class="form-control">	
													  <option value="">선택</option>										
													  <option value="9401">9401</option>
													  <option value="58-1">58-1</option>
													  <option value="720">720</option>
													 </select>
												</div><br> 
												 <%--<div class="container">
												  <h2>Dropdowns</h2>
												  <p>The .divider class is used to separate links inside the dropdown menu with a thin horizontal line:</p>
												  <div class="dropdown">
												    <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Tutorials
												    <span class="caret"></span></button>
												    <ul class="dropdown-menu">
												      <li><a href="routename.admin?r_num=${r_num}">9401</a></li>
												      <li><a href="#">CSS</a></li>
												      <li><a href="#">JavaScript</a></li>
												      <li class="divider"></li>
												      <li><a href="#">About Us</a></li>
												    </ul>
												  </div>
												</div> --%>
										<div class="x_panel">
						
											<div class="x_content" id="commutesearchstarttableinfo">
											
											
												<table style="table-layout:fixed; word-break:break-all; text-align: center
													class="table table-hover projects">
													<thead>
														<tr>
															<th class='backslash' style = "width:75px; height: 20px;"><div>일(日)&nbsp;</div>&nbsp;이름</th>
															
															
															<c:forEach var="i" begin="1" end="30" step="1">
																<th style = "width:35px; text-align: center" >${i}</th>
															</c:forEach>
														</tr>
													</thead>
													<tbody>
														<c:forEach var = "a" begin = "0" end = "${fn:length(d)-1}" step = "1">
														<tr>
															<td style = "height: 40px;">${d[a].m_name}</td>
													 		<c:forEach var="i" begin="0" end="29" step="1">
																<td style = "height: 40px;">${d[a].cs_stat[i]}</td>
															</c:forEach>
														</tr>
														</c:forEach>
													</tbody>
													
												</table>
												
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
		src="${pageContext.request.contextPath}/vendors/flot.orderbars/js/jquery.flot.orderBars.js">
	</script> <script
		src="${pageContext.request.contextPath}/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS --> <script
		src="${pageContext.request.contextPath}/vendors/DateJS/build/date.js"></script>
	<!-- JQVMap --> <script
		src="${pageContext.request.contextPath}/vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker --> <script
		src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts --> <script
		src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>
</body>
</html>