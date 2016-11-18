<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
					<div class="col-sm-12">
						<div class="dashboard_graph">
							<div class="row x_title">
								<div class="col-md-6">
									<h3>개인정보</h3>
								</div>
							</div>
							<div class="clearfix">
								<div class="container">
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-8">

											<div class="panel panel-info">
												<div class="panel-heading">
													<h3 class="panel-title">이력서</h3>
												</div>
												<div class="panel-body">
													<div class="row">
														<div class="col-sm-5" align="center">
															<div class="row">
																<div class="col-sm-12">
																	<img
																		src="${pageContext.request.contextPath}/images/bono.jpg"
																		style="width: 200px; height: 200px;">
																</div>
																
																<button class="btn btn-primary" style="margin-top:10px;margin-right: 10px">사진변경</button>
																<button class="btn btn-primary" style="margin-top: 10px" id="watch">이력보기</button>

															</div>
														</div>
														<div class="col-sm-7">
															<table class="table table-user-information">
																<tbody>
																	<tr>
																		<td>이름:</td>
																		<td>읍읍이</td>
																	</tr>
																	<tr>
																		<td>ID</td>
																		<td>刀천재Z1존도적風</td>
																	</tr>
																	<tr>
																		<td>주소</td>
																		<td>서울역</td>
																	</tr>
																	<tr>
																		<td>상세주소</td>
																		<td>3번출구 5번째 계단</td>
																	</tr>
																	<tr>
																		<td>등급</td>
																		<td>1급현역</td>
																	</tr>
																	<tr>
																		<td>면허증</td>
																		<td>2종보통</td>
																	</tr>
																	<tr>
																		<td>이력서</td>
																		<td><a>나 금메달 메고왔는데^^</a></td>
																	</tr>
																	<tr>
																		<td>E-Mail</td>
																		<td><a href="www.president.go.kr">www.president.go.kr</a>
																		</td>

																	</tr>
																	<tr>
																		<td>생년월일</td>
																		<td>500706</td>
																	</tr>
																	<tr>
																		<td>정기휴무</td>
																		<td>캘린더api...</td>
																	</tr>
																</tbody>
															</table>

															<a href="#" class="btn btn-primary">수정</a> <a href="#"
																class="btn btn-primary">??</a>
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
<!-- BEGIN # MODAL LOGIN -->
	<div class="modal fade" id="new-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	<div class="modal-dialog">
			<div class="modal-content">      
                <!-- Begin # DIV Form -->
                <div id="div-forms">
                <div class="modal-header" align="center">
					<h3>이력보기</h3>
				</div>
                    <!-- Begin # Login Form -->
                    <form id="login-form" action="" method="post">
		                <div class="modal-body">
		                	<table class="table">
		                	<thead>
		                		<tr>
		                			<th style="width: 20%">아력구분</th>
		                			<th style="width: 35%">근무기간</th>
		                			<th>근무회사</th>
		                		</tr>
		                	</thead>
		                	<tbody>
		                		<tr>
		                			<td style="width: 20%">학력</td>
		                			<td style="width: 35%">약 3년</td>
		                			<td>이화여대</td>
		                		</tr>
		                		<tr>
		                			<td style="width: 20%">대회수상</td>
		                			<td style="width: 35%">7년간 금메달 5번 수상</td>
		                			<td>국제대회 및 국내대회 를 휩쓴 유망주</td>
		                		</tr>		                	
		                	</tbody>
		                	
		                	</table>
				     	</div>
        		    	<div class="modal-footer">
                            <div>
                                <a href="redirect:/join.htm"><button type="submit" class="btn btn-primary btn-lg btn-block">완료</button></a>
                            </div>
        		    	</div>
                    </form>
                    <!-- End # Login Form -->  
                </div>
                <!-- End # DIV Form --> 
			</div>
		</div>
	</div>
	
	<script type="text/javascript">
	$(document).ready(function() {
		$('#watch').click(function(){
			$('#new-modal').modal();
		});
		
	});
	
	</script>


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
