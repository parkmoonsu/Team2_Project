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

		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-filestyle.js"></script>


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
											<li><a href="#step-2"> <span class="step_no">1</span>
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
										
										<div id="step-2">
											<form id="register" class="form-horizontal form-label-left" method = "post" action = "join3.htm" enctype="multipart/form-data">

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
													<label for="j_code"
														class="control-label col-md-3 col-sm-3 col-xs-12">직책
														</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<select class = "form-control col-md-7 col-xs-12" name ="j_code" id = "j_code">
															<option value ="">선택</option>
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
<input  id="m_photo" onchange = "imagecheck(this)" name="files[0]" type="file" class="filestyle" data-buttonText="Open" data-input="false" data-iconName="glyphicon-plus" data-classButton="btn btn-primary">
									
													</div>
												</div>
												 <div class="form-group">
													<label for="m_photo"
														class="control-label col-md-3 col-sm-3 col-xs-12">사진
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
<input  id="m_photo" onchange = "imagecheck(this)" name="files[1]" type="file" class="filestyle" data-buttonText="Open" data-input="false" data-iconName="glyphicon-plus" data-classButton="btn btn-primary">

													</div>
												</div>
												<div class="form-group">
													<label for="m_resume"
														class="control-label col-md-3 col-sm-3 col-xs-12">이력서
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
<input  id="m_resume" onchange = "xlscheck(this)" name="files[2]" type="file" class="filestyle" data-buttonText="Open" data-input="false" data-iconName="glyphicon-plus" data-classButton="btn btn-primary">										
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
												
												
												<!-- <div class="form-group">
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
												
												</div> -->

												<div style="float: right; margin: 30px;">
													<input type="button" value="이전" class="btn btn-primary"
														id="prev" onclick="history.go(-1)"> 
													<input type="submit" value="다음" class="btn btn-success" 
														id="next">
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
		</div>
			<!-- /page content -->

			<!-- footer content -->
		<footer>
			<jsp:include page="/sidebar/footer.jsp"></jsp:include>
			<div class="clearfix"></div>
		</footer>
		<!-- /footer content -->
		</div>


	<!-- 다음 우편번호 -->

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							/* document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample4_roadAddress').value = fullRoadAddr;
							document.getElementById('sample4_jibunAddress').value = data.jibunAddress; */
							var str = data.zonecode + " " + fullRoadAddr + " "
									+ data.jibunAddress;
							document.getElementById('m_addr').value = str;

							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								//예상되는 도로명 주소에 조합형 주소를 추가한다.
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';

							} else {
								document.getElementById('guide').innerHTML = '';
							}
						}
					}).open();
		}
	</script>
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
		<script src="http://malsup.github.io/jquery.form.js"></script>
		<!-- jQuery Smart Wizard -->
		<script>
			function xlscheck(file){
				var filelen = file.value.length;
				if(file.value.substring(filelen-3,filelen)!="xls"){
					alert("확장자가 xls인 엑셀파일을 선택해 주세요.");
					file.value = "";
				}
			}
			 
			function imagecheck(file){
				
				var filelen = file.value.length;
				if(file.value.substring(filelen-3,filelen)!="png" && file.value.substring(filelen-3,filelen) != "jpg"){
										
					alert("JPG 또는 PNG인 이미지파일을 선택해 주세요,");
					file.value= "";
				}
			} 
			$(document).ready(function() {
				var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i; 	
				
				$("#emailbtn").click(function() {
					if(regExp.test($("#m_email").val().trim())){
						
						alert("인증번호 전송 완료");
						$.ajax({
							url : "popup.htm",
							type : "post",
							data:{m_email:$("#m_email").val().trim()}
						});
						
					}else{
						alert("Email 형식이 잘못 되었습니다.");
					}
					
				});	
				
				$("#echeckbtn").click(function(){
					$.ajax({
						url:"echeck.htm",
						type:"post",
						data:{m_echeck:$("#m_echeck").val().trim()},
						success:function(rd){
							console.log(rd.echeck);
							if($.trim(rd.echeck) == "y"){
								alert("인증 되었습니다.");
								$("#change").empty();
								$("#change").append("<input type = 'hidden' name = 'm_echeck' value = 'y'>");
								
								$.ajax({
									url:"updateapp.htm",
									type:"post"
								});
							}else{
								alert("인증번호를 잘못 입력하셨습니다.");
								$("#m_echeck").focus();
							}
							
							
						}
					});
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
		
				
				$("#next").click(function(){
					if($("#m_id").val() == ""){
						alert("ID를 입력하세요.");
						$("#m_id").focus();
				        return false;
					}else if($("#m_pw").val() == ""){
						alert("비밀번호를 입력하세요.");
						$("#m_pw").focus();
				        return false;
					}else if($("#m_pw2").val() == "" || ($("#m_pw").val() != $("#m_pw2").val())){
						alert("비밀번호가 일치 하지 않습니다.");
						$("#m_pw2").focus();
						return false;
					}else if($("#m_name").val() == ""){
						alert("이름을 입력하세요.");
						$("#m_name").focus();
						return false;
					}else if($("#m_email").val() == ""){
						alert("이메일을 입력하세요.");
						$("#m_email").focus();
						return false;
					}else if($("#m_nocheck").val() == "n"){
						alert("이메일을 통해 인증하세요.");
						$("#m_email").focus();
						return false;
					}else if($("#j_code").val() == ""){
						alert("직책을 선택하세요.");
						return false;
					}else if($("#m_birth").val() ==""){
						alert("생년월일을 입력하세요.");
						$("#m_birth").focus();
						return false;
					}else if($("#m_phone").val() ==""){
						alert("연락처를 입력하세요.");
						$("#m_phone").focus();
						return false;
					}else if($("#m_license").val() ==""){
						alert("운전면허증 사본을 첨부하세요.");
						$("#m_license").focus();
						return false;
					}else if($("#m_photo").val() ==""){
						alert("사진을 첨부하세요.");
						$("#m_photo").focus();
						return false;
					}else if($('#m_resume').val()==""){
						alert("이력서를 첨부하세요.");
						$('#m_resume').focus();
						return false;
					}else if($("#m_addr").val() ==""){
						alert("우편주소를 입력하세요.");
						$("#m_addr").focus();
						return false;
					}else if($("#m_daddr").val() ==""){
						alert("상세주소를 입력하세요.");
						$("#m_daddr").focus();
						return false;
					}else if($("#res_num").val() ==""){
						alert("이력사항을 선택하세요.");
						return false;
					}else if($("#rr_detail").val() ==""){
						alert("이력사항을 입력하세요.");
						$("#rr_detail").focus();
						return false;
					}else{
						return true;
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