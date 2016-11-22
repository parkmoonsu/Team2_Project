<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.my-box {
	border: 1px solid;
	padding: 10px;
}
</style>
</head>
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>아이디/비밀번호 찾기</title>

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

<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/build/css/custom.min.css"
	rel="stylesheet">




<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/bootstrap-3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link
	href="${pageContext.request.contextPath}/bootstrap-3.3.7/assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/bootstrap-3.3.7/assets/css/carousel/carousel.css"
	rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="${pageContext.request.contextPath}/bootstrap-3.3.7/assets/js/ie-emulation-modes-warning.js"></script>




</head>
<body>
	<header>
		<jsp:include page="/sidebar/header.jsp" />
	</header>


	<div class="container" style="margin-top: 20px;">
		<div class="main_container">

			<!-- page content -->
			<div role="main">
				<!-- class="right_col" 이거 뺌-->
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>Form Wizards</h3>
						</div>

					</div>
					<div class="clearfix"></div>

					<div class="row">

						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										아이디/비밀번호 바꾸기 <small>KosBus</small>
									</h2>

									<div class="clearfix"></div>
								</div>
								<div class="x_content">


									<!-- Smart Wizard -->

									<div id="wizard" class="form_wizard wizard_horizontal">
								<div id="step-1" style="text-align: center;" class="my-box">
										<div>
										<div class="my-box" style="margin:30px" >

												<h2 class="StepTitle">비밀번호 변경</h2>
												<div class="form-group" style="padding: 25px">
													<div id="step-2">
														<form class="form-horizontal form-label-left"
															method="post" action="join3.htm"
															enctype="multipart/form-data">
											
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
												<div style="float: right; margin: 30px;">
												<div class="col-xs-12">
													<a  class="btn btn-success" 
														id="okay" >확인</a>
														</div>
												</div>
												
															</form>
													</div>															
													</div>
											</div>
												</div>
											</div>
											<!-- End SmartWizard Content -->
										</div>
										<!-- End SmartWizard Content -->
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
					<jsp:include page="/sidebar/footer.jsp" />
				</footer>
				<!-- /footer content -->
			
			<!-- jQuery -->
			<script
				src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
			<!-- Bootstrap -->
			<script
				src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
			<!-- FastClick -->
			<script
				src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
			<!-- NProgress -->
			<script
				src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
			<!-- jQuery Smart Wizard -->
			<script
				src="${pageContext.request.contextPath}/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
			<!-- Custom Theme Scripts -->
			<script
				src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>
			<!-- ajax -->

			<!-- jQuery Smart Wizard -->
			<script>
				$(document).ready(
						function() {

							$("#okay").click(function() {
								alert("변경되었습니다 ^^");
								location.href ="bus.htm";
							});

						});
			</script>
			<!-- /jQuery Smart Wizard -->
</body>
</html>