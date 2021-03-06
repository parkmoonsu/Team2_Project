<!-- 
	@FileName : joinapprove.jsp
	@Project	: KosBus
	@Date	: 2016. 11.21
	@Author	: 박문수
	@Discription : (관리자)회원가입승인 페이지 View단
 -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>기사 관리</title>

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
<!-- jQuery -->
<script
		src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js">
</script>
<style type= "text/css">
table, th{
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

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-xs-3 col-md-3 left_col">
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
								<small>회원가입승인</small>
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-xs-12 col-md-12">
							<div class="x_panel">
								<div class="x_title">
									<nav class="navbar navbar-default">
										<div class="container-fluid">
											<ul class="nav navbar-nav">
												<li><a href="membermanage.admin">회원정보</a></li>
												<li><a href="joinapprove.admin"><strong>회원가입승인</strong></a></li>
												
											</ul>
										</div>
									</nav>
								</div>
								<div class="x_content">


									<!-- start project list -->
									 <div
										class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
										<div class="input-group">
											<!-- <input type="text" class="form-control"
												placeholder="Search for..." id="search"> <span
												class="input-group-btn">
												<button class="btn btn-default" type="button">Go!</button>
											</span> -->
										</div>
									</div>
									<table class="table table-hover projects">
										<thead>
											<tr>
												<th style="width:60px">번호</th>
												<th style="width:110px">ID</th>
												<th style="width:90px">이름</th>
												<th style="width:90px">직책</th>
												<th style="width:120px">승인요청일</th>
												<th style="width: 90px"></th>
											</tr>
										</thead>
										<tbody>
											<c:set value="${list}" var="d"/>
											<c:if test ="${d == '[]' }">
											<tr>
												<td colspan = '6' align = "center">가입신청 회원 없음</td>
											</tr>
											</c:if>
											<c:forEach var="i" items="${d}">
											<c:choose>
											<c:when test="${i != null}">
											
											<tr>
												<td>${i.r}</td>
												<td><a>${i.m_id}</a></td>
												<td><small>${i.m_name}</small></td>
												<td><small>${i.j_name}</small></td>
												<td><small>${i.m_regdate}</small></td>
												<td style = "text-align:center;"> <a href="approveMember.admin?m_id=${i.m_id}"
													class="btn btn-success btn-xs"><i class="fa fa-check"></i>
														승인 </a>
														
												</td>
											</tr>
											</c:when>
											</c:choose>
											</c:forEach>
										</tbody>
									</table>
									<!-- end project list -->
									
									<!-- 요기서부터 페이징처리 -->
									<c:set var = "mc" value = "${membercount}"/>
									<c:set var = "pgc" value = "${pgs}"/>
									<c:set var = "pagecount" value = "${pagecount}"/>

									<div style="text-align: center">
										<ul class="pagination">
											<c:if test="${pgc > 1}">
												<li><a href="joinapprove.admin?pg=${pgc-1}">Previous</a></li>
											</c:if>

											<c:forEach begin="1" end="${pagecount}" var="i" step = "5">
											<c:forEach begin = "${i}" end = "${i+4}" step = "1" var = "x">
												<c:if test="${x <= pagecount}">
													<c:choose>
														<c:when test="${pgc == x}">
															<li><a  class="active" href="#">${x}</a></li>
														</c:when>
														<c:when test="${pgc > i-1 && pgc < i+5 }">
															<li><a href="joinapprove.admin?pg=${x}">${x}</a></li>
														</c:when>
														<c:when test ="${x == i+5}">
															<c:forEach begin = "${x}" end = "${x+4}" step = "1" var = "y">
																<li><a href="joinapprove.admin?pg=${y}">${y}</a></li>
															</c:forEach>
														</c:when>
													</c:choose>
												</c:if>
												
											</c:forEach>
										</c:forEach>
											
											
											<%-- <c:forEach var="i" begin="1" end="${pagecount}" step="1">
												<li class="active"><a href="joinapprove.admin?pg=${i}">${i}</a></li>
											</c:forEach> --%>

											<c:if test="${pgc < mc/10 }">
												<li><a href="joinapprove.admin?pg=${pgc+1}">Next</a></li>
											</c:if>
										</ul>
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
		</div>
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
<script type="text/javascript">
$(function() {
	
		
});

</script>
</body> 	
</html>
