<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
$(function(){ 
	
	var id="${LoginUser}";
	var page="${page}";
		$("#gotowork").click(function(){
			alert("떠떠떠떠");
		    $.ajax({
			url:"gotowork.member",
			data: {
				m_id:id
			},
			type:"post",
			success:function(data){
				$("#commutestartinfo").empty();
				$("#commutestartinfo").append('id님의 출근시간은 ' +data.dto.c_start+ '입니다'+"<br>"+'id님의 출근상태는 '+ data.dto.cs_stat+'입니다.'); 
				$.ajax({
					url:"comsearchstartinfo.member",
					data:{
							m_id:id,
							pg:page		
					},
					type:"post",
					success:function(data){
						$('#commutesearchstarttableinfo').empty();
						$('#commutesearchstarttableinfo').append(data);
					}
				});
			}
			});   
		});

	
	var id="${LoginUser}";
		$("#getoffwork").click(function(){
			alert("떠떠떠떠");
		    $.ajax({
			url:"getoffwork.member",
			data: {
				m_id:id
			},
			type:"post",
			success:function(data){				
				$("#commuteendinfo").empty();
				$("#commuteendinfo").append(id+'님의 퇴근시간은 ' +data.dto.c_end+ '입니다'+"<br>"+
										id+'님의 퇴근상태는 '+ data.dto.ce_stat+'입니다.'); 
				$.ajax({
					url:"comsearchstartinfo.member",
					data:{
							m_id:id,
							pg:page		
					},
					type:"post",
					success:function(data){
						$('#commutesearchstarttableinfo').empty();
						$('#commutesearchstarttableinfo').append(data);
					}
				});
				
			}
			});   
		});
		
	});
</script>
<style type="text/css">
#gotowork {
	width: "100px";
}
</style>
</head>
<!-- 출근  -->
<div class="container">
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">${LoginUser}님의출근정보</h4>
				</div>
				<div class="modal-body" id="commutestartinfo"
					style="text-align: center; font-size: 20px; line-height: 200%">


					<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>

		</div>
	</div>

</div>

<!-- 퇴근 -->
<div class="container">
	<!-- Modal -->
	<div class="modal fade" id="myModal2" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">${LoginUser}님의퇴근정보</h4>
				</div>
				<div class="modal-body" id="commuteendinfo" style="text-align: center; font-size: 20px; line-height: 200%">
				<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>

		</div>
	</div>

</div>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<jsp:include page="/sidebar/sidebar2.jsp"></jsp:include>
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

				<div class="row">
					<div class="col-sm-12 col-xs-12">
						<div class="dashboard_graph">
							<div class="row x_title">
								<div class="col-md-6 col-xs-6">
									<h3>출/퇴근 관리</h3>
								</div>
							</div>
							<div class="clearfix">
								<div class="container">
									<div class="row">
										<div class="col-sm-1 col-xs-1"></div>
										<div class="col-sm-10 col-xs-10">
											<input type="button" id="gotowork" value="출근"
												class="btn btn-default" style="width: 100px"
												data-toggle="modal" data-target="#myModal"> <input
												type="button" id="getoffwork" value="퇴근"
												class="btn btn-default" style="width: 100px"
												data-toggle="modal" data-target="#myModal2">
											<div id="showdiv">
												<div class="panel panel-info">
													<div class="panel-heading">
														<h3 class="panel-title">출/퇴근 관리</h3>
													</div>
													<div class="panel-body">

														<div class="row">
															<div class="col-sm-1 col-xs-1" align="center">
																<div class="row"></div>
															</div>
															<div class="col-sm-10 col-xs-10" id="commutesearchstarttableinfo">
																<table class="table table-user-information">
																	<tbody style="text-align: center">
																		<tr>
																			<td>NO.</td>
																			<td>날짜</td>
																			<td>출근시간</td>
																			<td>퇴근시간</td>
																		</tr>
																		<c:set var="show"></c:set>
																		<c:forEach var="i" items="${list}">
																			<tr>
																				<td>${i.rownum}</td>
																				<td>${i.c_date}</td>
																				<td>${i.c_start}</td>
																				<td>${i.c_end}</td>
																			<tr>
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
					</div>

				</div>
				<br />

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



</body>
</html>