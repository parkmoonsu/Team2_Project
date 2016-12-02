<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
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
			<div class="col-xs-12 col-md-3 left_col">
				
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
					<div class="col-xs-12 col-sm-12">
						<div class="dashboard_graph">
							<div class="row x_title">
								<div class="col-xs-6 col-md-6">
									<h3>개인정보</h3>
								</div>
							</div>
							<div class="clearfix">
								<div class="container">
									<div class="row">
										<div class="col-xs-2 col-sm-2"></div>
										<div class="col-xs-12 col-sm-8">
											<div class="panel panel-info">
												<div class="panel-heading">
													<h3 class="panel-title">회원 정보수정</h3>
												</div>
												<div class="panel-body">
													<div class="row">
														<div class="col-xs-2 col-sm-2" align="center">
															<div class="row">
																<!-- <a style = "display:none"><input type = "file" id = "photo"></a>
																<button class="btn btn-primary" style="margin-top:10px;margin-right: 10px" id = "photo_swipe">사진변경</button>
																 -->
															</div>
														</div>
														<div class="col-xs-12 col-sm-8">
															<form class="form-horizontal form-label-left"
																method="post" action="updateMember.htm"
																enctype="multipart/form-data">
																<table class="table table-user-information">
																	<tr>
																		<td>
																			<div class="form-group">
																				<span class="col-xs-3 col-sm-3">아이디</span>
																				<div class="col-xs-9 col-sm-9">
																					<input type="text" class="form-control" value = "${dto.m_id}" 
																					name = "m_id" readonly>
																				</div>
																			</div>
																		</td>

																	</tr>
																	<tr>
																		<td>
																			<div class="form-group">
																				<span class="col-xs-3 col-sm-3">비밀번호</span>
																				<div class="col-xs-9 col-sm-9">
																					<input type="password" id="m_pw" name="m_pw"
																						class="form-control">
																						
																					<input type = "hidden" id = "hidden" name = "hidden" value = "hidden">
																				</div>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<div class="form-group">
																				<span class="col-xs-3 col-sm-3">다시입력</span>
																				<div class="col-xs-9 col-sm-9">
																					<input type="password" id="m_pw2" name="m_pw2"
																						class="form-control">
																				</div>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<div class="form-group">
																				<span class="col-xs-3 col-sm-3">이름</span>
																				<div class="col-xs-9 col-sm-9">
																					<input id="m_name" class="form-control" type="text" value = "${dto.m_name}"
																						name="m_name">
																				</div>
																			</div>
																		</td>
																	</tr>	
																	<tr>
																		<td>
																			<div class="form-group">
																				<span class="col-xs-3 col-sm-3">연락처</span>
																				<div class="col-xs-9 col-sm-9">
																					<input id="m_phone" name="m_phone" value = "${dto.m_phone}"
																						class="form-control" type="text">
																				</div>
																			</div>
																		</td>
																	</tr>
												
																	<tr>
																		<td>
																			<div class="form-group">
																				<span class="col-xs-3 col-sm-3">사진</span>
																				<div class="col-xs-9 col-sm-9">
																					<input id="m_photo" class="control" type="file"
																						name="files[0]">
																				</div>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<div class="form-group">
																				<span class="col-xs-3 col-sm-3">주소</span>
																				<div class="col-xs-6 col-sm-6">
																					<input id="m_addr" class="form-control" type="text" value = "${dto.m_addr}"
																						name="m_addr"> 
																				</div>
																				<div class = "col-xs-3 col-sm-3">	
																					<input type="button"
																						value="주소검색" class="btn btn-default"
																						onclick="sample4_execDaumPostcode()">
																				
																				</div>
																			</div>
																		</td>
																	</tr>
																	<tr>
																		<td>
																			<div class="form-group">
																				<span class="col-xs-3 col-sm-3">상세주소</span>
																				<div class="col-xs-9 col-sm-9">
																					<input id="m_daddr" class="form-control" value = "${dto.m_daddr}"
																						type="text" name="m_daddr">
																				</div>
																			</div>
																		</td>
																	</tr>
																

																</table>

																<div style="float: right; margin: 30px;">
																	<input type="button" value="이전" class="btn btn-default"
																		id="prev" onclick="history.back(-1)"> <input
																		class="btn btn-primary" type="submit" value="수정완료" id = "update">
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
						</div>
					</div>

				</div>
				<br />

			</div>
		</div>
		<!-- /page content -->

		<!-- footer content -->
		<footer>
			<jsp:include page="/sidebar/footer.jsp"></jsp:include>
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
	
	<script type="text/javascript">
		$(function(){
			$("#update").click(function(){
				if($("#m_pw").val() == ""){
					$("#hidden").attr("value","real");
				}
				
				if(($("#m_pw").val() != $("#m_pw2").val())){
					alert("비밀번호가 일치 하지 않습니다.");
					$("#m_pw2").focus();
					return false;
				}else{
					return true;
				}
			});
		});
	</script>
</body>
</html>
