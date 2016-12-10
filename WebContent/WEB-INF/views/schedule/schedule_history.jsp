<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<!--
 * @File Name: schedule_history.jsp
 * @Author: 길한종
 * @Data: 2016. 11. 26
 * @Desc: 일정관리(변경기록)
-->

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>버스 관리</title>

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

<!-- Editor -->
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
<style>
th {
	text-align: center;
}

ul.pagination li a.active {
	background-color: #1ABB9C;
	color: white;
}

ul.pagination li a {
	color: #73879C;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
}
</style>
</head>
<se:authentication property="name" var="LoginUser" />
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-xs-12  col-md-3 left_col">

				<jsp:include page="/sidebar/sidebar2.jsp"></jsp:include>
			</div>

			<!--상단 menu -->
			<div class="top_nav">
				<jsp:include page="/sidebar/menuHeader.jsp"></jsp:include>
			</div>
			<!-- page content -->
			<div class="right_col" role="main">

				<!--  top tiles
          <div class="row tile_count" style = "text-align: center">
          	<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
          		<span class="count_top"></span>
          	</div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-bus"></i> 마을버스</span>
              <div class="count">0</div>          
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-bus"></i> 시내버스</span>
              <div class="count">0</div>              
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-bus"></i> 시외버스</span>
              <div class="count">0</div>            
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-bus"></i> 전체(대)</span>
              <div class="count green">0</div>
            </div>  
          </div>
          top tiles -->

				<div class="">
					<div class="page-title">
						<div class="title_left"></div>
					</div>
					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-xs-12">
							<ul class="nav nav-tabs" style="border-bottom: 0px">
								<li role="presentation"><a href="schedule_reguloff.htm">정기휴무신청</a></li>
								<li role="presentation" class="active"><a
									href="schedule_history.htm?m_id=${LoginUser}">신청내역조회</a></li>
							</ul>
							<div class="x_panel">
								<div class="x_content">
									<!-- start project list -->
									<div
										class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
										<div class="input-group">
											<!-- <input type="text" class="form-control"
												placeholder="Search for..." id="search"> <span
												class="input-group-btn">
												<button class="btn btn-default" type="button" id="btnsearch">Go!</button>
											</span> -->
										</div>
									</div>
									<table class="table table-hover projects"
										style="text-align: center">
										<thead>
											<tr>
												<th>번호</th>
												<th>현재휴무일</th>
												<th>변경휴무일</th>
												<th>요청일</th>
												<th>승인일</th>
												<th>변경대상</th>
												<th>상태</th>

											</tr>
										</thead>
										<tbody>
											<c:set value="${list}" var="d" />

											<c:forEach var="i" items="${d}" varStatus="status">
												<tr>
													<td>${i.rown}</td>
													<td>${i.bd}</td>
													<td>${i.ad}</td>
													<td>${i.ro_reqdate}</td>
													<td>${i.ro_regdate}</td>
													<td>${i.an}</td>
													<c:if test="${i.ko_name=='신청중'}">
														<td><button class="btn btn-info btn-xs">${i.ko_name}</button></td>
													</c:if>
													<c:if test="${i.ko_name=='승인'}">
														<td><button class="btn btn-success btn-xs"
																style="width: 50px; border: 0">${i.ko_name}</button></td>
													</c:if>
													<c:if test="${i.ko_name=='거절'}">
														<td><button class="btn btn-danger btn-xs"
																style="width: 50px; border: 0">${i.ko_name}</button></td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- end project list -->

									<!-- 요기서부터 페이징처리 -->
									<c:set var="Count" value="${count}" />
									<c:set var="pgc" value="${pgs}" />
									<c:set var="pagecount" value="${pagecount}" />


									<div style="text-align: center">
										<ul class="pagination">
											<c:if test="${pgc > 1}">
												<li><a
													href="schedule_history.htm?m_id=${LoginUser}&pg=${pgc-1}">Prev</a></li>
											</c:if>

											<c:forEach begin="1" end="${pagecount}" var="i" step="5">
												<c:forEach begin="${i}" end="${i+4}" step="1" var="x">
													<c:if test="${x <= pagecount}">
														<c:choose>
															<c:when test="${pgc == x}">
																<li><a class="active" href="#">${x}</a></li>
															</c:when>
															<c:when test="${pgc > i-1 && pgc < i+5 }">
																<li><a
																	href="schedule_history.htm?m_id=${LoginUser}&pg=${x}">${x}</a></li>
															</c:when>
															<c:when test="${x == i+5}">
																<c:forEach begin="${x}" end="${x+4}" step="1" var="y">
																	<li><a
																		href="schedule_history.htm?m_id=${LoginUser}&pg=${y}">${y}</a></li>
																</c:forEach>
															</c:when>
														</c:choose>
													</c:if>

												</c:forEach>
											</c:forEach>

											<c:if test="${pgc < Count/10 }">

												<li><a
													href="schedule_history.htm?m_id=${LoginUser}&pg=${pgc+1}">Next</a></li>
											</c:if>
										</ul>
									</div>

								</div>



							</div>



						</div>
					</div>
				</div>
			</div>
		</div>



		<!-- footer content -->
		<footer>
			<jsp:include page = "/sidebar/footer.jsp"/>
			<div class="clearfix"></div>
		</footer>
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
	
</body>
</html>
