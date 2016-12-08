<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
  #fh5co-header #navbar li a:hover {
    color: #52d3aa !important;
  }
.my-box {
	border: 1px solid;
	padding: 10px;
} 
.form_wizard .stepContainer {
  display: block;
  position: relative;
  margin: 0;
  padding: 0;
  border: 0 solid #CCC;
  overflow-x: hidden; }

.wizard_horizontal ul.wizard_steps {
  display: table;
  list-style: none;
  position: relative;
  width: 100%;
  margin: 0 0 20px; }

.wizard_horizontal ul.wizard_steps li {
  display: table-cell;
  text-align: center; }

.wizard_horizontal ul.wizard_steps li a, .wizard_horizontal ul.wizard_steps li:hover {
  display: block;
  position: relative;
  -moz-opacity: 1;
  filter: alpha(opacity=100);
  opacity: 1;
  color: #666; }

.wizard_horizontal ul.wizard_steps li a:before {
  content: "";
  position: absolute;
  height: 4px;
  background: #ccc;
  top: 20px;
  width: 100%;
  z-index: 4;
  left: 0; }

.wizard_horizontal ul.wizard_steps li a.disabled .step_no {
  background: #ccc; }

.wizard_horizontal ul.wizard_steps li a .step_no {
  width: 40px;
  height: 40px;
  line-height: 40px;
  border-radius: 100px;
  display: block;
  margin: 0 auto 5px;
  font-size: 16px;
  text-align: center;
  position: relative;
  z-index: 5; }

.wizard_horizontal ul.wizard_steps li a.selected:before, .step_no {
  background: #34495E;
  color: #fff; }

.wizard_horizontal ul.wizard_steps li a.done:before, .wizard_horizontal ul.wizard_steps li a.done .step_no {
  background: #1ABB9C;
  color: #fff; }

.wizard_horizontal ul.wizard_steps li:first-child a:before {
  left: 50%; }

.wizard_horizontal ul.wizard_steps li:last-child a:before {
  right: 50%;
  width: 50%;
  left: auto; }

.wizard_verticle .stepContainer {
  width: 80%;
  float: left;
  padding: 0 10px; }

.form_wizard wizard_horizontal{
	color:balck;
}

.actionBar {
  width: 100%;
  border-top: 1px solid #ddd;
  padding: 10px 5px;
  text-align: right;
  margin-top: 10px; }

.actionBar .buttonDisabled {
  cursor: not-allowed;
  pointer-events: none;
  opacity: .65;
  filter: alpha(opacity=65);
  box-shadow: none; }

.actionBar a {
  margin: 0 3px; }

.wizard_verticle .wizard_content {
  width: 80%;
  float: left;
  padding-left: 20px; }

.wizard_verticle ul.wizard_steps {
  display: table;
  list-style: none;
  position: relative;
  width: 20%;
  float: left;
  margin: 0 0 20px; }

.wizard_verticle ul.wizard_steps li {
  display: list-item;
  text-align: center; }

.wizard_verticle ul.wizard_steps li a {
  height: 80px; }

.wizard_verticle ul.wizard_steps li a:first-child {
  margin-top: 20px; }

.wizard_verticle ul.wizard_steps li a, .wizard_verticle ul.wizard_steps li:hover {
  display: block;
  position: relative;
  -moz-opacity: 1;
  filter: alpha(opacity=100);
  opacity: 1;
  color: #666; }

.wizard_verticle ul.wizard_steps li a:before {
  content: "";
  position: absolute;
  height: 100%;
  background: #ccc;
  top: 20px;
  width: 4px;
  z-index: 4;
  left: 49%; }

.wizard_verticle ul.wizard_steps li a.disabled .step_no {
  background: #ccc; }
 .small{
 	color:black;
 }

.wizard_verticle ul.wizard_steps li a .step_no {
  width: 40px;
  height: 40px;
  line-height: 40px;
  border-radius: 100px;
  display: block;
  margin: 0 auto 5px;
  font-size: 16px;
  text-align: center;
  position: relative;
  z-index: 5; }
 

.wizard_verticle ul.wizard_steps li a.selected:before, .step_no {
  background: #34495E;
  color: #fff; }

.wizard_verticle ul.wizard_steps li a.done:before, .wizard_verticle ul.wizard_steps li a.done .step_no {
  background: #1ABB9C;
  color: #fff; }

.wizard_verticle ul.wizard_steps li:first-child a:before {
  left: 49%; }

.wizard_verticle ul.wizard_steps li:last-child a:before {
  left: 49%;
  left: auto;
  width: 0; }

.form_wizard .loader {
  display: none; }

.form_wizard .msgBox {
  display: none; }

label{
font-size:12px;
}
.form-group{
height: 35px;
}
 
</style>
</head>
		<script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap-filestyle.js"></script>
      

</head>
<style>
bodoy{
margin-left: 0px;
}
.wizard_steps{
	color: black;
}

.small{
	color: black;
}
.my-box{
	color: black;
}



</style>
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
		            <li><a href="login.htm" id="log"><span>로그인</span></a>&nbsp;&nbsp;</li>
		           	<li><a href="#" id="gaip"><span>회원가입</span></a></li>
		          </ul>
		        </div>
			    </nav>
		  </div>
	</header>


	<div class="top-content">
        	
            <div class="inner-bg" style="padding-top: 60px; padding-bottom: 60px">
                <div class="container">
                    <div class="row">
                    <hr>
                 <div class="col-sm-1"></div>
						<div class="col-md-10 col-sm-10 col-xs-10 form-box">
							<div class="x_panel">
							<div class="form-top" align="center" style="color: black">
								<div class="form-top-center">
							
								<div class="x_content">


									<!-- Smart Wizard -->
									
									<div id="wizard" class="form_wizard wizard_horizontal">
										<ul class="wizard_steps">
											<li ><a href="#step-2"> <span class="step_no">1</span>
													<span class="step_descr" style="color: black"> Step 1<br /> <small style="color: black">
															약관동의</small>
												</span>
											</a></li>
											<li ><a href="#step-2"> <span class="step_no">2</span>
													<span class="step_descr" style="color: black"> Step 2<br /> <small style="color: black">
															정보작성</small>
												</span>
											</a></li>
											<li><a href="#step-2"> <span class="step_no">3</span>
													<span class="step_descr" style="color: black"> Step 3<br /> <small style="color: black">
															가입완료</small>
												</span>
											</a></li>

										</ul>	
										
										<div id="step-2" style="text-align: center;" class="my-box">
											<form id="register" class="form-horizontal form-label-left" method = "post" action = "join3.htm" enctype="multipart/form-data">

												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="m_id">아이디
													</label>
													<div class="col-md-5 col-sm-5 col-xs-12">
														<input type="text" id="m_id" name = "m_id" 
															class="form-control col-md-7 col-xs-12">
													</div>
													<div class = "col-md-1 col-sm-1" align="left" style="padding:0px">
														<input type = "button" class = "btn btn-default" id = "checkid" value = "중복확인">
													</div>
													<div class = "col-md-3 col-sm-2" style="margin-top:7px">
														<span id = "check"></span>
													</div>
												</div>
												
							
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="m_pw">비밀번호
													</label>
													<div class="col-md-5 col-sm-5 col-xs-12">
														<input type="password" id="m_pw" name="m_pw"
															class="form-control col-md-7 col-xs-12">
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="m_pw2">비밀번호 다시입력
													</label>
													<div class="col-md-5 col-sm-5 col-xs-12">
														<input type="password" id="m_pw2" name="m_pw2"
															class="form-control col-md-7 col-xs-12">
													</div>
												</div>
												
												<div class="form-group">
													<label for="m_name"
														class="control-label col-md-3 col-sm-3 col-xs-12">이름
														</label>
													<div class="col-md-5 col-sm-5 col-xs-12">
														<input id="m_name"
															class="form-control col-md-7 col-xs-12" type="text"
															name="m_name">
													</div>
												</div>
												<div class="form-group">
													<label for="m_email"
														class="control-label col-md-3 col-sm-3 col-xs-12">이메일
													</label>
													<div class="col-md-5 col-sm-5 col-xs-12">
														<input id="m_email"
															class="form-control col-md-7 col-xs-12" type="email"
															name="m_email">
													</div>
													<div class = "col-md-3 col-sm-3" align="left" style="padding: 0px">
														<input type = "button" value = "인증번호전송" id = "emailbtn"
															class = "btn btn-default">
													</div>
												</div>
												<div class="form-group" id = "change">
													<label for="m_echeck"
														class="control-label col-md-3 col-sm-3 col-xs-12">인증번호
													</label>
													<input type = 'hidden' id = 'm_nocheck' value = 'n'>
													<div class="col-md-5 col-sm-5 col-xs-12" style="padding-left: 15px">
														<input id="m_echeck"
															class="form-control col-md-7 col-xs-12" type="text"
															name="m_echeck">
													</div>
													<div class = "col-md-3 col-sm-3" align="left" style="padding: 0px">
														<input type = "button" value = "인증" id = "echeckbtn"
															class = "btn btn-default">
													</div>
												</div>
												
												
												<div class="form-group">
													<label for="j_code"
														class="control-label col-md-3 col-sm-3 col-xs-12">직책
														</label>
													<div class="col-md-5 col-sm-5 col-xs-12">
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
													<div class="col-md-2 col-sm-2 col-xs-12">
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
														<div class="col-md-4 col-sm-4 col-xs-12"></div>
													</div>
												</div>
												<div class="form-group">
													<label for = "m_birth" 
														class="control-label col-md-3 col-sm-3 col-xs-12">생년월일
													</label>
													<div class="col-md-5 col-sm-5 col-xs-12">
														<input id="m_birth" name ="m_birth"
															class="form-control col-md-7 col-xs-12"
															 type="text">
													</div>
													<div  class="col-sm-4" >
													<input id="birth" type="hidden" value="0">
													</div>
												</div>
												<div class="form-group">
													<label for = "m_phone" 
														class="control-label col-md-3 col-sm-3 col-xs-12">연락처
													</label>
													<div class="col-md-5 col-sm-5 col-xs-12">
														<input id="m_phone" name ="m_phone"
															class="form-control col-md-7 col-xs-12"
															 type="text">
													</div>
													<div class="col-sm-4" id="phone"></div>
												</div>
												 <div class="form-group">
													<label for="m_license"
														class="control-label col-md-3 col-sm-3 col-xs-12">운전면허증
													</label>
													<div class="col-md-5 col-sm-5 col-xs-12">
<input  id="m_photo" onchange = "imagecheck(this)" name="files[0]" type="file" class="filestyle" data-buttonText="Open" data-input="false" data-iconName="glyphicon-plus" data-classButton="btn btn-primary">
									
													</div>
												</div>
												 <div class="form-group">
													<label for="m_photo"
														class="control-label col-md-3 col-sm-3 col-xs-12">사진
													</label>
													<div class="col-md-5 col-sm-5 col-xs-12">
<input  id="m_photo2" onchange = "imagecheck(this)" name="files[1]" type="file" class="filestyle" data-buttonText="Open" data-input="false" data-iconName="glyphicon-plus" data-classButton="btn btn-primary">

													</div>
												</div>
												<div class="form-group">
													<label for="m_resume"
														class="control-label col-md-3 col-sm-3 col-xs-12">이력서
													</label>
													<div class="col-md-5 col-sm-5 col-xs-12">
<input  id="m_resume" onchange = "xlscheck(this)" name="files[2]" type="file" class="filestyle" data-buttonText="Open" data-input="false" data-iconName="glyphicon-plus" data-classButton="btn btn-primary">										
													</div>
												</div>  
												<div class="form-group">
													<label for="m_addr"
														class="control-label col-md-3 col-sm-3 col-xs-12">우편주소
													</label>
													<div class="col-md-5 col-sm-5 col-xs-12" style="padding-left:15px">
														<input id="m_addr"
															class="form-control col-md-7 col-xs-12" type="text"
															name="m_addr" >
													</div>
													<div class = "col-md-3 col-sm-3" style="padding:0px" align="left">
														<input type = "button" value = "주소검색"
															class = "btn btn-default" onclick = "sample4_execDaumPostcode()">
													</div>
													<span id="guide" style="color: #999; display:none;" ></span>
												</div>
												<div class="form-group">
													<label for="m_daddr"
														class="control-label col-md-3 col-sm-3 col-xs-12">상세주소
													</label>
													<div class="col-md-5 col-sm-5 col-xs-12">
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
								<font style="letter-spacing:0.5px"></font>
							</div>
						</div>
                        
                    </div>
                </div><br><br><hr>
                <footer>
				<jsp:include page="/sidebar/footer.jsp" />
			</footer>
            </div>
            
        </div>


        <!-- Javascript -->
        <script src="${pageContext.request.contextPath}/loginassets/assets/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/loginassets/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/loginassets/assets/js/jquery.backstretch.min.js"></script>
        <script src="${pageContext.request.contextPath}/loginassets/assets/js/scripts.js"></script>
        <script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
        <script type="text/javascript">
        $(function() {
     
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

				
					var bir= /[12][0-9]{3}-[01][0-9]-[0-3][0-9]/;
				$("#m_birth").keyup(function() {
		
					$("#birth2").empty();
					
					if(bir.test($("#m_birth").val().trim())){
						$('#birth').after("<font color = 'blue' size='3px' id='birth2'>가능합니다</font>");
					}else{
						$('#birth').after("<font color = 'red' size='3px' id='birth2'>생년월일 예)1992-02-03</font>");
					}
					
				});	

					var bir2= /^\d{3}-\d{3,4}-\d{4}$/;
				$("#m_phone").keyup(function() {
					
					$("#phone2").empty();
					
					if(bir2.test($("#m_phone").val().trim())){
						
						$('#phone').after("<font color = 'blue' size='3px' id='phone2'>가능합니다</font>");
					}else{
						$('#phone').after("<font color = 'red' size='3px' id='phone2'>전화번호 예)010-0000-0000</font>");
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
								$('#check').append("<font color = 'red'  size='3px'>&nbsp;이미 있는 ID 입니다!</font>");
								$('#m_id').focus();
							}else if($.trim(rd.check)=="n" && $("#m_id").val().trim().length >= 8){
								$('#check').append("<font color = '#369F36'  size='3px'>사용 가능한 ID 입니다!</font>");
							}else{
								$('#check').append("<font color = 'red'  size='3px'>ID는 8자 이상입니다!</font>");
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
					}else if($("#m_pw2").val() == "" || $("#m_pw").val() != $("#m_pw2").val()){
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
					}else if($("#m_birth").val() =="" || !bir.test($("#m_birth").val().trim())){
						alert("생년월일을 형식에 맞게 입력해주세요.");
						$("#m_birth").focus();
						return false;
					}else if($("#m_phone").val() =="" || !bir2.test($("#m_phone").val().trim())){
						alert("연락처를 형식에맞게 입력해주세요.");
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
        
        </script>


</body>
</html>