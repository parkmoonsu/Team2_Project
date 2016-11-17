<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.my-box { border:1px solid; padding:10px; }

</style>
</head>
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>회원가입</title>

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
										회원가입 <small>KosBus</small>
									</h2>

									<div class="clearfix"></div>
								</div>
								<div class="x_content">


									<!-- Smart Wizard -->
									
									<div id="wizard" class="form_wizard wizard_horizontal">
										<ul class="wizard_steps">
											<li><a href="#step-1"> <span class="step_no">1</span>
													<span class="step_descr"> Step 1<br /> <small>
															약관동의</small>
												</span>
									
											</a></li>
											<li><a href="#step-1"> <span class="step_no">2</span>
													<span class="step_descr"> Step 2<br /> <small>
															정보작성</small>
												</span>
											</a></li>
											<li><a href="#step-1"> <span class="step_no">3</span>
													<span class="step_descr"> Step 3<br /> <small>
															가입완료</small>
												</span>
											</a></li>

										</ul>
										<div id="step-1" style="text-align: center;" class="my-box">
											<h2 class="StepTitle">개인정보 이용약관</h2>
											<div class="form-group" style="padding: 25px">
												<div class="my-box" >
													<h5 style="font-weight:bold; text-align: left">제 1 조 (목적)</h5>
													 <p style="text-align: left">이 약관은 KOSBUS 주식회사 ("회사" 또는 “KOSBUS")가 제공하는 KOSBUS 및 KOSBUS 관련 제
													 반  서비스 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>
													 <div style = "text-align:right">
														<input type="checkbox" name="class[1]" value="agree1" id = "agree1" class="input_check">이용 약관에 동의 합니다<br>														
													 </div>					
												</div><br>
												<div class="my-box">
												<p style="text-align: left">
													정보통신망법 규정에 따라 네이버에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.<br>
													<h5 style="font-weight:bold; text-align: left">1. 수집하는 개인정보</h5>
													<p style="text-align: left">이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 네이버 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 네이버는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
													
													<div style = "text-align:right">
														<input type="checkbox" name="class[2]" value="agree2" id = "agree2" class="input_check">이용 약관에 동의 합니다<br>														
													 </div>
												</div>
											</div>
											<div style = "text-align:right">
												<input type="checkbox" name="agree" value="agree" id = "all-agree">전체 동의<br>
											</div>
										</div>
										<div style = "text-align:right; margin:30px;">
											<input type = "button" value = "다음" class = "btn btn-success" id = "next">
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
			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<jsp:include page="/sidebar/footer.jsp" />
			</footer>
			<!-- /footer content -->
		</div>	
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
		
			$(document).ready(function() {
						
						$("#next").click(function(){
							location.href = "join2.htm";
						});
				
				
						if ($("#all-agree").is(":checked")) {
							$("#next").attr('disabled', false);
						} else {
							$("#next").attr('disabled', true);
						}
						$("#agree1").click(
								function() {
									if ($("#agree1").is(":checked")
											&& $("#agree2").is(":checked")) {
										$("#all-agree").prop("checked", true);
										$("#next").attr('disabled', false);
									} else {
										$("#all-agree").prop("checked", false);
										$("#next").attr('disabled', true);
									}
								});
						$("#agree2").click(
								function() {
									if ($("#agree1").is(":checked")
											&& $("#agree2").is(":checked")) {
										$("#all-agree").prop("checked", true);
										$("#next").attr('disabled', false);
									} else {
										$("#all-agree").prop("checked", false);
										$("#next").attr('disabled', true);
									}
								});
						$('#all-agree').click(function() {
							if ($("#all-agree").is(":checked")) {
								$("#agree1").prop("checked", true);
								$("#agree2").prop("checked", true);
								$("#next").attr('disabled', false);

							} else {

								$("#agree1").prop("checked", false);
								$("#agree2").prop("checked", false);
								$("#next").attr('disabled', true);
							}
						});

						$('#wizard').smartWizard();

						$('#wizard_verticle').smartWizard({
							transitionEffect : 'slide'
						});

					});
		</script>
		<!-- /jQuery Smart Wizard -->
</body>
</html>