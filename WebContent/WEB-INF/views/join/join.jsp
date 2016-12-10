 <!-- 
	@FileName : getovfwork.jsp
	@Project	: KosBus
	@Date	: 2016. 11.26
	@Author	: 강민수
	@Discription : 출퇴근 정보 페이지
 -->
 
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
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<style>
.my-box{
	color: black;
}
</style>


</head>
<body>


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
										회원가입 <small>Sessions</small>
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
											<li><a href="#step-2"> <span class="step_no">2</span>
													<span class="step_descr"> Step 2<br /> <small>
															정보작성</small>
												</span>
											</a></li>
											<li><a href="#step-2"> <span class="step_no">3</span>
													<span class="step_descr"> Step 3<br /> <small>
															가입완료</small>
												</span>
											</a></li>

										</ul>
										<div id="step-1" style="text-align: center;" class="my-box">
											<h2 class="StepTitle" >개인정보 이용약관</h2>
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


										<!-- <div id="step-2">
											<form class="form-horizontal form-label-left">
												<h2 class="StepTitle" style="text-align: center">Email
													인증</h2>
												<div class="container">
													<div class="row">
														<div class="form-group">
															<label class="control-label col-sm-3" for="first-name">Email</label>

															<div class="col-sm-6">
																<input type="text" id="email" class="form-control">
															</div>
															<div class="col-sm-3">
																<input type="button" id="emailbtn"
																	class="btn btn-default" value="인증">
															</div>
														</div>
													</div>
												</div>
											</form>
										</div> -->
										<div id="step-2">
											<form class="form-horizontal form-label-left">

												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="m_id">아이디
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" id="m_id" name = "m_id" required="required"
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
															required="required"
															class="form-control col-md-7 col-xs-12">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="m_pw2">비밀번호 다시입력
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="password" id="m_pw2" name="m_pw2"
															required="required"
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
														<input type = "button" value = "인증" id = "emailbtn"
															class = "btn btn-default">
													</div>
												</div>
												
												
												<div class="form-group">
													<label for="j_code"
														class="control-label col-md-3 col-sm-3 col-xs-12">직책
														</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<select class = "form-control col-md-7 col-xs-12" name ="j_code" id = "j_code">
															<option>선택</option>
															<option value = "01">최고관리자</option>
															<option value = "02">매니저</option>
															<option value = "03">기사</option>
															
														</select>
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
															name="m_license">
													</div>
												</div>
												<div class="form-group">
													<label for="m_photo"
														class="control-label col-md-3 col-sm-3 col-xs-12">사진
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input id="m_photo"
															class="col-md-7 col-xs-12" type="file"
															name="m_photo">
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
														<input type = "button" id = "addrbtn" value = "주소검색"
															class = "btn btn-default">
													</div>
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
														<option>선택</option>
														<option value = "01">마을버스</option>
														<option value = "02">시내버스</option>
														<option value = "03">시외버스</option>
														<option value = "04">고속버스</option>
													</select>
													</div>
													<div class="col-md-3 col-sm-3 col-xs-12">
														<input id="rr_detail"
															class="form-control col-md-7 col-xs-12" type="text"
															name="rr_detail">
													</div>
												</div>
											</form>
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
	</div>




<!-- BEGIN # MODAL LOGIN -->
	<div class="modal fade" id="email-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	<div class="modal-dialog">
			<div class="modal-content">      
                <!-- Begin # DIV Form -->
                <div id="div-forms">
                <div class="modal-header" align="center">
					<h3>이메일 인증</h3>
					<hr>
				</div>
                    <!-- Begin # Login Form -->
                    <form id="login-form" action="" method="post">
		                <div class="modal-body">
				    		<div id="div-login-msg">
                                <div id="icon-login-msg" class="glyphicon glyphicon-chevron-right"></div>
                                <span id="text-login-msg">인증번호를 입력하세요.</span>
                            </div>
				    		<input id="login_username" name="username" class="form-control" type="text" placeholder="인증번호 입력" required>
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
    <!-- END # MODAL LOGIN -->

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
				var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 	
				$("#emailbtn").click(function() {
					if(regExp.test($("#m_email").val().trim())){
						
						//alert("Email 전송 완료");
						swal({
                    title: "",
                    text: "Email 전송 완료",
                    type: "info",
                    closeOnConfirm: true,
                    showLoaderOnConfirm: true,
                  },
                  function(){
                  });
						$("#email-modal").modal();
						$.ajax({
							url : "popup.htm",
							type : "post",
							data:{m_email:$("#m_email").val().trim()}
						});
						
					}else{
						//alert("Email 형식이 잘못 되었습니다.");
						swal({
		                    title: "",
		                    text: "Email 형식이 잘못 되었습니다.",
		                    type: "info",
		                    closeOnConfirm: true,
		                    showLoaderOnConfirm: true,
		                  },
		                  function(){
		                  });
					}
					
				});	
				
				$("#checkid").click(function(){
					$.ajax({
						url:"checkid.htm",
						type:"post",
						data:{m_id:$("#m_id").val().trim()},
						success:function(rd){
							console.log($.trim(rd.check));
							$("#check").empty();
							if($.trim(rd.check)=="y"){
								$('#check').append("<font color = 'red'>이미 있는 ID 입니다!</font>");
								$('#m_id').focus();
							}else if($.trim(rd.check)=="n" && $("#m_id").val().trim().length >= 8){
								$('#check').append("<font color = '#369F36'>사용 가능한 ID 입니다!</font>");
							}else{
								$('#check').append("<font color = 'red'>ID는 8자 이상입니다!</font>");
							}
						}
						
					});
				});
				
				
				$('#wizard').smartWizard();

				$('#wizard_verticle').smartWizard({
					transitionEffect : 'slide'
				});

				$('.buttonNext').addClass('btn btn-success');
				$('.buttonPrevious').addClass('btn btn-primary');
				$('.buttonFinish').addClass('btn btn-default');
			});
		</script>
		<!-- /jQuery Smart Wizard -->
</body>
</html>



<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
	src="${pageContext.request.contextPath}/bootstrap-3.3.7/assets/js/ie-emulation-modes-warning.js">
</script>
<style>
bodoy{
margin-left: 0px;
}
</style>


</head>
<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>RoadOneBell로그인</title>

        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/css/form-elements.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/css/style.css">
        <link rel="stylesheet" id="theme-switch" href="${pageContext.request.contextPath}/mainCss/css/style.css">
        

<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>RoadOneBell로그인</title>

        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/css/form-elements.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/css/style.css">
        <link rel="stylesheet" id="theme-switch" href="${pageContext.request.contextPath}/mainCss/css/style.css">
        
<body>

						<header role="banner" id="fh5co-header">
			<div class="container">
				<!-- <div class="row"> -->
			    <nav class="navbar navbar-default">
		        <div class="navbar-header">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
		         <a class="navbar-brand" href="bus.htm">RoadOneBell</a> 
		        </div>
		        <div id="navbar" class="navbar-collapse collapse">
		          <ul class="nav navbar-nav navbar-right">
		            <li class="active"><a href="bus.htm" data-nav-section="home"><span>Home</span></a></li> 
		            <li><a href="#" id="log"><span>로그인</span></a>&nbsp;&nbsp;</li>
		           	<li><a href="#" id="gaip"><span>회원가입</span></a></li>
		          </ul>
		        </div>
			    </nav>
		  </div>
	</header>

	<div class="container" style="margin-top: 20px;">
		<div class="main_container">

			<!-- page content -->
			<div role="main">
				<!-- class="right_col" 이거 뺌-->
				<div class="">
					<div class="page-title">
<!-- 						<header role="banner" id="fh5co-header">
			<div class="container">
				<div class="row">
			    <nav class="navbar navbar-default">
		        <div class="navbar-header">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar"><i></i></a>
		         <a class="navbar-brand" href="bus.htm">RoadOneBell</a> 
		        </div>
		        <div id="navbar" class="navbar-collapse collapse">
		          <ul class="nav navbar-nav navbar-right">
		            <li class="active"><a href="bus.htm" data-nav-section="home"><span>Home</span></a></li> 
		            <li><a href="#" id="log"><span>로그인</span></a>&nbsp;&nbsp;</li>
		           	<li><a href="#" id="gaip"><span>회원가입</span></a></li>
		          </ul>
		        </div>
			    </nav>
		  </div>
	</header> -->
					</div>
					<div class="clearfix"></div>

					<div class="row">

						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										회원가입 <small>Sessions</small>
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
											<li><a href="#step-2"> <span class="step_no">2</span>
													<span class="step_descr"> Step 2<br /> <small>
															정보작성</small>
												</span>
											</a></li>
											<li><a href="#step-2"> <span class="step_no">3</span>
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


										<!-- <div id="step-2">
											<form class="form-horizontal form-label-left">
												<h2 class="StepTitle" style="text-align: center">Email
													인증</h2>
												<div class="container">
													<div class="row">
														<div class="form-group">
															<label class="control-label col-sm-3" for="first-name">Email</label>

															<div class="col-sm-6">
																<input type="text" id="email" class="form-control">
															</div>
															<div class="col-sm-3">
																<input type="button" id="emailbtn"
																	class="btn btn-default" value="인증">
															</div>
														</div>
													</div>
												</div>
											</form>
										</div> -->
										<div id="step-2">
											<form class="form-horizontal form-label-left">

												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="m_id">아이디
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" id="m_id" name = "m_id" required="required"
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
															required="required"
															class="form-control col-md-7 col-xs-12">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="m_pw2">비밀번호 다시입력
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="password" id="m_pw2" name="m_pw2"
															required="required"
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
														<input type = "button" value = "인증" id = "emailbtn"
															class = "btn btn-default">
													</div>
												</div>
												
												
												<div class="form-group">
													<label for="j_code"
														class="control-label col-md-3 col-sm-3 col-xs-12">직책
														</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<select class = "form-control col-md-7 col-xs-12" name ="j_code" id = "j_code">
															<option>선택</option>
															<option value = "01">최고관리자</option>
															<option value = "02">매니저</option>
															<option value = "03">기사</option>
															
														</select>
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
															name="m_license">
													</div>
												</div>
												<div class="form-group">
													<label for="m_photo"
														class="control-label col-md-3 col-sm-3 col-xs-12">사진
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input id="m_photo"
															class="col-md-7 col-xs-12" type="file"
															name="m_photo">
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
														<input type = "button" id = "addrbtn" value = "주소검색"
															class = "btn btn-default">
													</div>
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
														<option>선택</option>
														<option value = "01">마을버스</option>
														<option value = "02">시내버스</option>
														<option value = "03">시외버스</option>
														<option value = "04">고속버스</option>
													</select>
													</div>
													<div class="col-md-3 col-sm-3 col-xs-12">
														<input id="rr_detail"
															class="form-control col-md-7 col-xs-12" type="text"
															name="rr_detail">
													</div>
												</div>
											</form>
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
			<!-- /page content -->k

			<!-- footer content -->
			<footer>
				<jsp:include page="/sidebar/footer.jsp" />
			</footer>
			<!-- /footer content -->
		</div>
	</div>




<!-- BEGIN # MODAL LOGIN -->
	<div class="modal fade" id="email-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	<div class="modal-dialog">
			<div class="modal-content">      
                <!-- Begin # DIV Form -->
                <div id="div-forms">
                <div class="modal-header" align="center">
					<h3>이메일 인증</h3>
					<hr>
				</div>
                    <!-- Begin # Login Form -->
                    <form id="login-form" action="" method="post">
		                <div class="modal-body">
				    		<div id="div-login-msg">
                                <div id="icon-login-msg" class="glyphicon glyphicon-chevron-right"></div>
                                <span id="text-login-msg">인증번호를 입력하세요.</span>
                            </div>
				    		<input id="login_username" name="username" class="form-control" type="text" placeholder="인증번호 입력" required>
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
    <!-- END # MODAL LOGIN -->

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
				var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 	
				$("#emailbtn").click(function() {
					if(regExp.test($("#m_email").val().trim())){
						
						alert("Email 전송 완료");
						$("#email-modal").modal();
						$.ajax({
							url : "popup.htm",
							type : "post",
							data:{m_email:$("#m_email").val().trim()}
						});
						
					}else{
						alert("Email 형식이 잘못 되었습니다.");
					}
					
				});	
				
				$("#checkid").click(function(){
					$.ajax({
						url:"checkid.htm",
						type:"post",
						data:{m_id:$("#m_id").val().trim()},
						success:function(rd){
							console.log($.trim(rd.check));
							$("#check").empty();
							if($.trim(rd.check)=="y"){
								$('#check').append("<font color = 'red'>이미 있는 ID 입니다!</font>");
								$('#m_id').focus();
							}else if($.trim(rd.check)=="n" && $("#m_id").val().trim().length >= 8){
								$('#check').append("<font color = '#369F36'>사용 가능한 ID 입니다!</font>");
							}else{
								$('#check').append("<font color = 'red'>ID는 8자 이상입니다!</font>");
							}
						}
						
					});
				});
				
				
				$('#wizard').smartWizard();

				$('#wizard_verticle').smartWizard({
					transitionEffect : 'slide'
				});

				$('.buttonNext').addClass('btn btn-success');
				$('.buttonPrevious').addClass('btn btn-primary');
				$('.buttonFinish').addClass('btn btn-default');
			});
		</script>
		<!-- /jQuery Smart Wizard -->
</body>
</html> --%>