
<!-- 
	@FileName : busenroll.jsp
	@Project	: KosBus
	@Date	: 2016. 11.25
	@Author	: 박문수
	@Discription : (관리자)버스 관리 페이지 View단
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
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>운영 관리</title>

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
	src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js">
</script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
th{
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
<script type="text/javascript">
	$(function(){
		$("#search").datepicker({
			changeMonth: true,
		    changeYear: true
		});
		$("#search").datepicker("option", "dateFormat", "yy-mm-dd");
		$("#search").datepicker( "option", "showAnim", "clip" );
	});
	
</script>

</head>

<body class="nav-md">

	<div class="container body">
		<div class="main_container">
			<div class="col-xs-12  col-md-3 left_col">

				<jsp:include page="/sidebar/sidebar.jsp"></jsp:include>
			</div>

			<!--상단 menu -->
			<div class="top_nav">
				<jsp:include page="/sidebar/menuHeader.jsp"></jsp:include>
			</div>
			<!-- page content -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								<small>휴무변경 이력확인</small>
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-xs-12">
							<div class="x_panel">
								<div class="x_content">
									<!-- start project list -->
								
									<div
										class="col-md-3 col-sm-5 col-xs-12 form-group top_search" style = "float:right;">
										<div class="input-group">
											<input type="text" class="form-control"
												placeholder="Search for..." id="search"> <span
												class="input-group-btn">
												<button class="btn btn-default" type="button" id="btnsearch">검색</button>
											</span>
										</div>
									</div>
									
									<div>
										<div class = "col-md-2" style = "float:right; margin-top:5px" >
											<input type = "radio" name = "check" checked>요청일
											&nbsp;&nbsp;&nbsp;
											<input type = "radio" name = "check">상태
										</div>
									</div>
									
									<table class="table table-hover projects"
										style="text-align: center">
										<thead>
											<tr>
												
												<th style="width: 70px;text-align: center">노선</th>
												<th style="width: 70px;text-align: center">변경신청기사</th>
												<th style="width: 70px;text-align: center">기존휴무요일</th>
												<th style="width: 70px;text-align: center">변경대상기사</th>
												<th style="width: 70px;text-align: center">변경희망요일</th>
												<th style="width: 70px;text-align: center">변경요청일</th>
												<th style="width: 70px;text-align: center">상태</th>
												<th style="width: 70px;text-align: center">상태일</th>
											</tr>
										</thead>
										<tbody>
											<c:set var = "d" value = "${list}"/>
											<c:forEach items = "${d}" var="i">
											<tr>
												
												<td>${i.r_num}</td>
												<td>${i.m_name}</td>
												<td>${i.o_date}</td>
												<td>${i.c_name}</td>
												<td>${i.c_date}</td>
												<td>${i.ro_reqdate}</td>
												<td>${i.ko_name}</td>
												<td>${i.ro_regdate}</td>
											</tr>
											</c:forEach>
											
										</tbody>
									</table>
			
									<!-- end project list -->
										<!-- 요기서부터 페이징처리 -->

									<c:set var = "Count" value = "${count}"/>
									<c:set var = "pgc" value = "${pgs}"/>
									<c:set var = "pagecount" value = "${pagecount}" />
									
									
									<div style="text-align: center">
										<ul class="pagination">
										<c:if test="${pgc > 1}">
											<li><a href="changehistory.admin?pg=${pgc-1}">Prev</a></li>
										</c:if>

										<c:forEach begin="1" end="${pagecount}" var="i" step = "5">
											<c:forEach begin = "${i}" end = "${i+4}" step = "1" var = "x">
												<c:if test="${x <= pagecount}">
													<c:choose>
														<c:when test="${pgc == x}">
															<li><a  class="active" href="#">${x}</a></li>
														</c:when>
														<c:when test="${pgc > i-1 && pgc < i+5 }">
															<li><a href="changehistory.admin?pg=${x}">${x}</a></li>
														</c:when>
														<c:when test ="${x == i+5}">
															<c:forEach begin = "${x}" end = "${x+4}" step = "1" var = "y">
																<li><a href="changehistory.admin?pg=${y}">${y}</a></li>
															</c:forEach>
														</c:when>
													</c:choose>
												</c:if>
												
											</c:forEach>
										</c:forEach>
											

										<%-- <c:forEach var="i" begin="1" end="${pagecount}" step="1">
											<li><a href="busenroll.admin?pg=${i}">${i}</a></li>
										</c:forEach> --%>
										
										<c:if test="${pgc < Count/10 }">

											<li><a href="changehistory.admin?pg=${pgc+1}">Next</a></li>
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
	</div>

	<!-- footer content -->
	<footer>
		<jsp:include page="/sidebar/footer.jsp"></jsp:include>
		<div class="clearfix"></div>
	</footer>
	<!-- /footer content -->
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
