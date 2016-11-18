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
<script type="text/javascript">
	$(function(){
		$("#photo_swipe").click(function(){
			$("#photo").click();
		});
	});
</script>
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
													<h3 class="panel-title">회원 정보수정</h3>
												</div>
												<div class="panel-body">
													<div class="row">
														<div class="col-sm-5" align="center">
															<div class="row">
																
																<!-- <a style = "display:none"><input type = "file" id = "photo"></a>
																<button class="btn btn-primary" style="margin-top:10px;margin-right: 10px" id = "photo_swipe">사진변경</button>
																 -->
																
															</div>
														</div>
														<div class="col-sm-7">
															<form class="form-horizontal form-label-left" method = "post" action = "join3.htm" enctype="multipart/form-data">

												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="m_id">아이디
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" id="m_id" name = "m_id"
															class="form-control col-md-7 col-xs-12">
													</div>
													<div class = "col-md-1 col-sm-1">
														<input type = "button" class = "btn btn-default" id = "checkid" value = "중복확인">
													</div>
													<div class = "col-md-2 col-sm-2" style="margin-top:7px">
														<span id = "check"></span>
													</div>
												</div>
												
							
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="m_pw">비밀번호
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="password" id="m_pw" name="m_pw"
															class="form-control col-md-7 col-xs-12">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="m_pw2">비밀번호 다시입력
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="password" id="m_pw2" name="m_pw2"
															class="form-control col-md-7 col-xs-12">
													</div>
												</div>
												
												<div class="form-group">
													<label for="m_name"
														class="control-label col-md-3 col-sm-3 col-xs-12">이름
														</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input id="m_name"
															class="form-control col-md-7 col-xs-12" type="text"
															name="m_name">
													</div>
												</div>
												<div class="form-group">
													<label for="m_email"
														class="control-label col-md-3 col-sm-3 col-xs-12">이메일
													</label>
													<div class="col-md-3 col-sm-6 col-xs-12">
														<input id="m_email"
															class="form-control col-md-7 col-xs-12" type="email"
															name="m_email">
													</div>
													<div class = "col-md-4 col-sm-4">
														<input type = "button" value = "인증번호전송" id = "emailbtn"
															class = "btn btn-default">
													</div>
												</div>
												<div class="form-group" id = "change">
													<label for="m_echeck"
														class="control-label col-md-3 col-sm-3 col-xs-12">인증번호
													</label>
													<input type = 'hidden' id = 'm_nocheck' value = 'n'>
													<div class="col-md-3 col-sm-6 col-xs-12">
														<input id="m_echeck"
															class="form-control col-md-7 col-xs-12" type="text"
															name="m_echeck">
													</div>
													<div class = "col-md-4 col-sm-4">
														<input type = "button" value = "인증" id = "echeckbtn"
															class = "btn btn-default">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12">성별</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<div id="m_gender" class="btn-group" data-toggle="buttons">
															<label class="btn btn-default"
																data-toggle-class="btn-primary"
																data-toggle-passive-class="btn-default"> <input
																type="radio" name="m_gender" value="male"> 
																남성 
															</label> <label class="btn btn-default"
																data-toggle-class="btn-primary"
																data-toggle-passive-class="btn-default"> <input
																type="radio" name="m_gender" value="female">
																여성
															</label>
															
														</div>
													</div>
												</div>
												<div class="form-group">
													<label for = "m_birth" 
														class="control-label col-md-3 col-sm-3 col-xs-12">생년월일
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input id="m_birth" name ="m_birth"
															class="form-control col-md-7 col-xs-12"
															 type="text">
													</div>
												</div>
												<div class="form-group">
													<label for = "m_phone" 
														class="control-label col-md-3 col-sm-3 col-xs-12">연락처
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input id="m_phone" name ="m_phone"
															class="form-control col-md-7 col-xs-12"
															 type="text">
													</div>
												</div>
												
												 <div class="form-group">
													<label for="m_license"
														class="control-label col-md-3 col-sm-3 col-xs-12">운전면허증
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input id="m_license"
															class="col-md-7 col-xs-12" type="file"
															name="files[0]">
													</div>
												</div>
												 <div class="form-group">
													<label for="m_photo"
														class="control-label col-md-3 col-sm-3 col-xs-12">사진
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input id="m_photo"
															class="col-md-7 col-xs-12" type="file"
															name="files[1]">
													</div>
												</div> 
												<div class="form-group">
													<label for="m_addr"
														class="control-label col-md-3 col-sm-3 col-xs-12">우편주소
													</label>
													<div class="col-md-3 col-sm-6 col-xs-12">
														<input id="m_addr"
															class="form-control col-md-7 col-xs-12" type="text"
															name="m_addr">
													</div>
													<div class = "col-md-4 col-sm-4">
														<input type = "button" value = "주소검색"
															class = "btn btn-default" onclick = "sample4_execDaumPostcode()">
													</div>
													<span id="guide" style="color: #999; display:none;" ></span>
												</div>
												<div class="form-group">
													<label for="m_daddr"
														class="control-label col-md-3 col-sm-3 col-xs-12">상세주소
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input id="m_daddr"
															class="form-control col-md-7 col-xs-12" type="text"
															name="m_daddr">
													</div>
												</div>
												
												<div class="form-group">
													<label for="res_num"
														class="control-label col-md-3 col-sm-3 col-xs-12">이력사항
													</label>
													<div class = "col md-3 col-sm-3">
													<select name = "res_num" id = "res_num" class = "form-control col-md-3 col-sm-3">
														<option value ="">선택</option>
														<option value = "100">마을버스</option>
														<option value = "200">시내버스</option>
														<option value = "300">시외버스</option>
														<option value = "400">고속버스</option>
													</select>
													</div>
													<div class="col-md-3 col-sm-3 col-xs-12">
														<input id="rr_detail"
															class="form-control col-md-7 col-xs-12" type="text"
															name="rr_detail">
													</div>
													<div class = "col-md-3 col-sm-3">
														<input type = "button" value ="+" id = "plusbtn" class = "btn btn-default">
													</div>
												</div>
												<div id = "plus">
												
												</div>

												<div style="float: right; margin: 30px;">
													<input type="button" value="이전" class="btn btn-primary"
														id="prev" onclick="history.go(-1)"> 
													<a href="#" class="btn btn-primary">수정완료</a> 
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
