<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
 
.wizard_steps{
	color: black;
}

.step_descr{
color: black;
}


.small{
	color: #7f7f7f;
}

.my-box{
	color: black;
}
p, h5{
text-align: left;
}

    #fh5co-header #navbar li a:hover {
    color: #fc9700 !important;
  }
</style>
</head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>RoadOneBell 로그인</title>

        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/css/form-elements.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/css/style.css">
        <link rel="stylesheet" id="theme-switch" href="${pageContext.request.contextPath}/mainCss/css/style.css">
      

</head>
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
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                    <hr>
                    <div class="col-sm-1"></div>
								
                        <div class="col-md-10 col-sm-10 col-xs-10 form-box">
							<div class="x_panel">
								<div class="x_title">
								<div class="form-top" align="center" style="color: black">
								<div class="form-top-center">
								
									<h2 style="color: black">
										RoadOneBell&nbsp;<small style="color: black">회원가입</small>
									</h2>
								</div>
								
									<div class="clearfix"></div>
									<!-- Smart Wizard -->
									
									<div id="wizard" class="form_wizard wizard_horizontal">
										<ul class="wizard_steps">
											<li><a href="#step-1"> <span class="step_no">1</span>
													<span class="step_descr" style="color: #7f7f7f"> Step 1<br /> <small style="color: #7f7f7f">
															약관동의</small>
												</span>
									
											</a></li>
											<li><a href="#step-1"> <span class="step_no">2</span>
													<span class="step_descr"  style="color: #7f7f7f"> Step 2<br /> <small style="color: #7f7f7f">
															정보작성</small>
												</span>
											</a></li>
											<li><a href="#step-1"> <span class="step_no">3</span>
													<span class="step_descr"  style="color: #7f7f7f"> Step 3<br /> <small style="color: #7f7f7f">
															가입완료</small>
												</span>
											</a></li>

										</ul>
										<div id="step-1" style="text-align: center;" class="my-box">
											<h2 class="StepTitle"  style="color: #7f7f7f">개인정보 이용약관</h2>
											<div class="form-group" style="padding: 25px">
												<div class="my-box" style="height: 150px;overflow: scroll; overflow-x: hidden;">
													<h5 style="font-weight:bold;">제 1 조 (목적)</h5>
													 <p>이 약관은 KOSBUS 주식회사 ("회사" 또는 “KOSBUS")가 제공하는 KOSBUS 및 KOSBUS 관련 제
													 반  서비스 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>													 
													<h5 style="font-weight:bold;">제 2 조 (정의)</h5>
													<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
													①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 KOSBUS 및 KOSBUS 관련 제반 서비스를 의미합니다.
													②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
													③"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미합니다.
													④"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
													⑤"유료서비스"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함) 및 제반 서비스를 의미합니다.
													⑥"포인트"라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.
													⑦"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.</p>
													<br><h5 style="font-weight:bold;">제 3 조 (약관의 게시와 개정)</h5>
													<p>①"회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.
													②"회사"는 "약관의규제에관한법률", "정보통신망이용촉진및정보보호등에관한법률(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
													③"회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 30일 전부터 적용일자 전일까지 공지합니다. 다만, 회원에게 불리한 약관의 개정의 경우에는 공지 외에 일정기간 서비스내 전자우편, 전자쪽지, 로그인시 동의창 등의 전자적 수단을 통해 따로 명확히 통지하도록 합니다.
													④회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
													⑤회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 이용계약을 해지할 수 있습니다.</p>
													<br><h5 style="font-weight:bold;">제 4 조 (약관의 해석)</h5>
													<p>①"회사"는 "유료서비스" 및 개별 서비스에 대해서는 별도의 이용약관 및 정책(이하 "유료서비스약관 등")을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "유료서비스약관 등"이 우선하여 적용됩니다.
													②이 약관에서 정하지 아니한 사항이나 해석에 대해서는 "유료서비스약관 등" 및 관계법령 또는 상관례에 따릅니다.</p>
													<br><h5 style="font-weight:bold;">제 5 조 (이용계약 체결)</h5>
													<p>①이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 "회사"가 이러한 신청에 대하여 승낙함으로써 체결됩니다.
													②"회사"는 "가입신청자"의 신청에 대하여 "서비스" 이용을 승낙함을 원칙으로 합니다. 다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
													1.가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 단 "회사"의 회원 재가입 승낙을 얻은 경우에는 예외로 함.
													2.실명이 아니거나 타인의 명의를 이용한 경우
													3.허위의 정보를 기재하거나, "회사"가 제시하는 내용을 기재하지 않은 경우
													4.14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우
													5.이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
													③제1항에 따른 신청에 있어 "회사"는 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.
													④"회사"는 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
													⑤제2항과 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 가입신청자에게 알리도록 합니다.
													⑥이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.
													⑦"회사"는 "회원"에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.
													⑧"회사"는 "회원"에 대하여 "영화및비디오물의진흥에관한법률" 및 "청소년보호법"등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.</p>
													<br><h5 style="font-weight:bold;">제 6 조 (회원정보의 변경)</h5>
													<p>①"회원"은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 주민등록번호, 아이디 등은 수정이 불가능합니다.
													②"회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "회사"에 대하여 그 변경사항을 알려야 합니다.
													③제2항의 변경사항을 "회사"에 알리지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.</p>
													<br><h5 style="font-weight:bold;">제 7 조 (개인정보보호 의무)</h5>
													<p>"회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 "회사"의 개인정보처리방침이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의 개인정보처리방침이 적용되지 않습니다.</p>
													<br><h5 style="font-weight:bold;">제 8 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)</h5>
													<p>①"회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.
													②"회사"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 "회사" 및 "회사"의 운영자로 오인한 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있습니다.
													③"회원"은 "아이디" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다.
													④제3항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.</p>
													<br><h5 style="font-weight:bold;">제 9 조 ("회원"에 대한 통지)</h5>
													<p>①"회사"가 "회원"에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 서비스 내 전자우편주소, 전자쪽지 등으로 할 수 있습니다.
													②"회사"는 "회원" 전체에 대한 통지의 경우 7일 이상 "회사"의 게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.</p>
													<br><h5 style="font-weight:bold;">제 10 조 ("회사"의 의무)</h5>
													<p>①"회사"는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.
													②"회사"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보처리방침을 공시하고 준수합니다.
													③"회사"는 서비스이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. "회원"이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다.
													</p>																							 
													 				
												</div>
												<div style = "text-align:right">
														<input type="checkbox" name="class[1]" value="agree1" id = "agree1" class="input_check">이용 약관에 동의 합니다<br>														
												</div><br>
												<div class="my-box" style="height: 150px;overflow: scroll; overflow-x: hidden;">
												<p>
													정보통신망법 규정에 따라 KOSBUS에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p><br>
													<h5 style="font-weight:bold;">1. 수집하는 개인정보</h5>
													<p>
													이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 KOSBUS 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, KOSBUS는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
													회원가입 시점에 KOSBUS가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
													- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 가입인증 휴대폰번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대폰번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
													- 단체아이디로 회원 가입 시에 단체아이디, 단체이름, 법인명(단체명), 대표자명, 대표 전화번호, 사업장소재지, 관리자 아이디, 관리자 휴대폰번호를 필수항목으로 수집합니다.
													서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
													KOSBUS 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
													서비스 이용 과정에서 IP 주소, 쿠키, 방문일시·불량 이용 기록 등의 서비스 이용 기록, 기기정보가 생성되어 수집될 수 있습니다.
													구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 정보통신서비스 제공자가 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못하도록 안전하게 변환한 후에 수집하는 경우를 의미합니다.
													<br><h5 style="font-weight:bold; text-align: left">2. 수집한 개인정보의 이용</h5>
													KOSBUS는 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
													- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
													- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
													- 법령 및 KOSBUS 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
													- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
													- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
													- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
													- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
													<br><h5 style="font-weight:bold; text-align: left">3. 개인정보의 파기</h5>
													<p>회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
													단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
													이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우는 아래와 같습니다.
													부정가입 및 징계기록 등의 부정이용기록은 부정 가입 및 이용 방지를 위하여 수집 시점으로부터 6개월간 보관하고 파기하고 있습니다. 부정이용기록 내 개인정보는 가입인증 휴대폰 번호(만 14세 미만 회원의 경우 법정대리인 DI)가 있습니다.
													결제도용, 불법할인대출(일명 '카드깡') 등 관련 법령 및 이용약관을 위반하는 KOSBUS페이의 부정거래기록(아이디, 이름, 휴대폰번호, 배송지 주소, IP주소, 쿠키, 기기정보)은 부정거래 방지 및 다른 선량한 이용자의 보호, 안전한 거래 환경 보장을 위하여 수집 시점으로부터 3년간 보관하고 파기합니다.
													전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. KOSBUS는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
													- 전자상거래 등에서 소비자 보호에 관한 법률 
													계약 또는 청약철회 등에 관한 기록: 5년 보관 
													대금결제 및 재화 등의 공급에 관한 기록: 5년 보관 
													소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
													- 전자금융거래법 
													전자금융에 관한 기록: 5년 보관
													- 통신비밀보호법 
													로그인 기록: 3개월													
												</div>
												<div style = "text-align:right">
														<input type="checkbox" name="class[2]" value="agree2" id = "agree2" class="input_check">이용 약관에 동의 합니다<br>														
												</div><br>
											<div class="my-box" style="height: 150px; overflow: scroll; overflow-x: hidden;">
												<p>
													위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 KOSBUS 위치기반 서비스를 이용할 수 있습니다.	</p>
													<h5 style="font-weight:bold; text-align: left">제 1 조 (목적)</h5>
													<p>이 약관은 KOSBUS 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
													<h5 style="font-weight:bold; text-align: left">제 2 조 (약관 외 준칙)</h5>
													<p>이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.
													<h5 style="font-weight:bold; text-align: left">제 3 조 (서비스 내용 및 요금)</h5>
													<p>①회사는 직접 위치정보를 수집하거나 위치정보사업자인 이동통신사로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
													1.Geo Tagging 서비스: 게시글 등록 시점의 개인위치정보주체의 위치정보를 게시글과 함께 저장합니다.
													2.위치정보를 활용한 검색결과 제공 서비스: 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과 및 주변결과(맛집, 주변업체, 교통수단 등)를 제시합니다.
													3.위치정보를 활용한 친구찾기 및 친구맺기: 현재 위치를 활용하여 친구를 찾아주거나 친구를 추천하여 줍니다.
													4.연락처 교환하기: 위치정보를 활용하여 친구와 연락처를 교환할 수 있습니다.
													5.현재 위치를 활용한 광고정보 제공 서비스: 광고정보 제공 요청 시 개인위치정보주체의 현 위치를 이용하여 광고소재를 제시합니다.
													6. 이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
													7. 위치정보 공유: 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 안심귀가 등을 목적으로 지인 또는 개인위치정보주체가 지정한 제3자에게 공유합니다.
													8. 길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의 경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스 등 다양한 운전 및 생활 편의 서비스를 제공합니다.
													②제1항 위치기반서비스의 이용요금은 무료입니다.
													<h5 style="font-weight:bold; text-align: left">제 4 조 (개인위치정보주체의 권리)</h5>
													<p>①개인위치정보주체는 개인위치정보 수집 범위 및 이용약관의 내용 중 일부 또는 개인위치정보의 이용ㆍ제공 목적, 제공받는 자의 범위 및 위치기반서비스의 일부에 대하여 동의를 유보할 수 있습니다.
													②개인위치정보주체는 개인위치정보의 수집ㆍ이용ㆍ제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다.
													③개인위치정보주체는 언제든지 개인위치정보의 수집ㆍ이용ㆍ제공의 일시적인 중지를 요구할 수 있습니다. 이 경우 회사는 요구를 거절하지 아니하며, 이를 위한 기술적 수단을 갖추고 있습니다.
													④개인위치정보주체는 회사에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 이유 없이 요구를 거절하지 아니합니다.
													1.개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료
													2.개인위치정보주체의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용
													⑤회사는 개인위치정보주체가 동의의 전부 또는 일부를 철회한 경우에는 지체 없이 수집된 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 파기합니다. 단, 동의의 일부를 철회하는 경우에는 철회하는 부분의 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료에 한합니다.
													⑥개인위치정보주체는 제1항 내지 제4항 의 권리행사를 위하여 이 약관 제13조의 연락처를 이용하여 회사에 요구할 수 있습니다.
													<h5 style="font-weight:bold; text-align: left">제 5 조 (법정대리인의 권리)</h5>
													<p>①회사는 만14세 미만 아동으로부터 개인위치정보를 수집ㆍ이용 또는 제공하고자 하는 경우에는 만14세 미만 아동과 그 법정대리인의 동의를 받아야 합니다.
													②법정대리인은 만14세 미만 아동의 개인위치정보를 수집ㆍ이용ㆍ제공에 동의하는 경우 동의유보권, 동의철회권 및 일시중지권, 열람ㆍ고지요구권을 행사할 수 있습니다.
													상호: KOSBUS 주식회사
													주소: 경기도 성남시 분당구 불정로 6 KOSBUS 그린팩토리 (463-867)
													전화번호: 1588-3820
													이메일 주소: kosbushs@kosbus.com
													<h5 style="font-weight:bold; text-align: left">부칙</h5>
													<h5 style="font-weight:bold; text-align: left">제1조 시행일</h5>
													<p>2015년 6월 2일부터 시행되던 종전의 약관은 본 약관으로 대체하며, 본 약관은 2015년 11월 26일부터 적용됩니다.
													<h5 style="font-weight:bold; text-align: left">제2조 위치정보관리 책임자 정보</h5>
													<p>회사는 다음과 같이 위치정보 관리책임자를 지정하여 이용자들이 서비스 이용과정에서 발생한 민원사항 처리를 비롯하여 개인위치정보 주체의 권리 보호를 위해 힘쓰고 있습니다.<br>
													위치정보 관리책임자 : (개인)정보보호 담당 부서 임원(개인정보 보호책임자 겸직)<br>
													전화번호 : 1588-3820<br>
													이메일 주소 : privacy@kosbus.com<br>
																									
																									
												</div><div style = "text-align:right">
														<input type="checkbox" name="class[3]" value="agree3" id = "agree3" class="input_check">이용 약관에 동의 합니다<br>														
													 </div>	<br>
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
									</div>
									<!-- End SmartWizard Content -->
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
        <script type="text/javascript">
        $(function() {
			$("#callback").click(function() {
				location.href="bus.htm";
			});
			
			$("#log").click(function() {
				location.href="login.htm"
			});
			
			$("#gaip").click(function() {
				location.href="join.htm"
			});
			
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
								&& $("#agree2").is(":checked")
								&& $("#agree3").is(":checked")){
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
								&& $("#agree2").is(":checked")
								&& $("#agree3").is(":checked")){
							$("#all-agree").prop("checked", true);
							$("#next").attr('disabled', false);
						} else {
							$("#all-agree").prop("checked", false);
							$("#next").attr('disabled', true);
						}
					});
			$("#agree3").click(
					function() {
						if ($("#agree1").is(":checked")
								&& $("#agree2").is(":checked")
								&& $("#agree3").is(":checked")){
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
					$("#agree3").prop("checked", true);
					$("#next").attr('disabled', false);

				} else {

					$("#agree1").prop("checked", false);
					$("#agree2").prop("checked", false);
					$("#agree3").prop("checked", false);
					$("#next").attr('disabled', true);
				}
			});

			$('#wizard').smartWizard();

			$('#wizard_verticle').smartWizard({
				transitionEffect : 'slide'
			});
		});
        </script>

</body>
</html> 
<%-- 
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
													<label for="m_resume"
														class="control-label col-md-3 col-sm-3 col-xs-12">이력서
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input id="m_resume"
															class="col-md-7 col-xs-12" type="file"
															name="files[2]" onchange="xlscheck(this)">
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
				<jsp:include page="/sidebar/footer.jsp" />
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
				
			/* 	if($("#m_id").val() != "" && $("#m_pw").val() != "" && $("#m_pw2").val() != ""
						&& $("#m_name").val() != "" && $("#m_email").val() != "" &&
						$("#j_code").val() != "" && $("#m_gender").is(":selected") &&
						$("#m_phone").val() != "" && $("#m_license").val() != "" &&
						$("#m_photo").val() != "" && $("#m_addr").val() != "" &&
						$("#m_daddr").val() != "" && $("#res_num").val() != "" &&
						$("#rr_detail").val() != ""){
					$("#next").attr('disabled', false);
				}else{
					$("#next").attr('disabled', true);
				} */
				
				$("#rr_detail").keyup(function(){
					if($("#rr_detail") != ""){
						$("#next").attr('disabled', false);
					}else{
						$("#next").attr('disabled', true);
					}
				})
				
				/* var i = 2;
				$("#plusbtn").click(function(){
					var plus = "<div class='form-group'>";
					plus += "<label for='res_num' class='control-label col-md-3 col-sm-3 col-xs-12'>이력사항" + i++ + "</label>";
					plus += "<div class = 'col md-3 col-sm-3'>";
					plus += "<select name = 'res_num' class = 'form-control col-md-3 col-sm-3'>";
					plus += "<option>선택</option>";
					plus += "<option value = '01'>마을버스</option>";
					plus += "<option value = '02'>시내버스</option>";
					plus += "<option value = '03'>시외버스</option>";
					plus += "<option value = '04'>고속버스</option>";
					plus += "</select></div>";
					plus += "<div class='col-md-3 col-sm-3 col-xs-12'>";
					plus += "<input class='form-control col-md-7 col-xs-12' type='text' name='rr_detail'>";
					plus += "</div></div>";
					$("#plus").append(plus);
					
					if(i>4){
						 $("#plusbtn").unbind("click");
					}
				}); */
				
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
</html> --%>




<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.my-box { border:1px solid; padding:10px; }
p{
 text-align: left;
}
h5{
 text-align: left;
}
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



<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="${pageContext.request.contextPath}/bootstrap-3.3.7/assets/js/ie-emulation-modes-warning.js"></script>




</head>
<style>
bodoy{
margin-left: 0px;
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
		            <li><a href="#" id="log"><span>로그인</span></a>&nbsp;&nbsp;</li>
		           	<li><a href="#" id="gaip"><span>회원가입</span></a></li>
		          </ul>
		        </div>
			    </nav>
		  </div>
	</header>

            <div class="inner-bg">
                <div class="container">
   
                   <div class="wrapper">

			<!-- page content -->
			<div role="main">
				<!-- class="right_col" 이거 뺌-->
				<div class="">
					
					<div class="clearfix"></div>

					<div class="row">

						<div class="col-md-12 col-sm-12 col-xs-12">
								
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
												<div class="my-box" style="height: 150px;overflow: scroll; overflow-x: hidden;">
													<h5 style="font-weight:bold;">제 1 조 (목적)</h5>
													 <p>이 약관은 KOSBUS 주식회사 ("회사" 또는 “KOSBUS")가 제공하는 KOSBUS 및 KOSBUS 관련 제
													 반  서비스 이용과 관련하여 회사와 회원과의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.</p>													 
													<h5 style="font-weight:bold;">제 2 조 (정의)</h5>
													<p>이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
													①"서비스"라 함은 구현되는 단말기(PC, TV, 휴대형단말기 등의 각종 유무선 장치를 포함)와 상관없이 "회원"이 이용할 수 있는 KOSBUS 및 KOSBUS 관련 제반 서비스를 의미합니다.
													②"회원"이라 함은 회사의 "서비스"에 접속하여 이 약관에 따라 "회사"와 이용계약을 체결하고 "회사"가 제공하는 "서비스"를 이용하는 고객을 말합니다.
													③"아이디(ID)"라 함은 "회원"의 식별과 "서비스" 이용을 위하여 "회원"이 정하고 "회사"가 승인하는 문자와 숫자의 조합을 의미합니다.
													④"비밀번호"라 함은 "회원"이 부여 받은 "아이디와 일치되는 "회원"임을 확인하고 비밀보호를 위해 "회원" 자신이 정한 문자 또는 숫자의 조합을 의미합니다.
													⑤"유료서비스"라 함은 "회사"가 유료로 제공하는 각종 온라인디지털콘텐츠(각종 정보콘텐츠, VOD, 아이템 기타 유료콘텐츠를 포함) 및 제반 서비스를 의미합니다.
													⑥"포인트"라 함은 서비스의 효율적 이용을 위해 회사가 임의로 책정 또는 지급, 조정할 수 있는 재산적 가치가 없는 "서비스" 상의 가상 데이터를 의미합니다.
													⑦"게시물"이라 함은 "회원"이 "서비스"를 이용함에 있어 "서비스상"에 게시한 부호ㆍ문자ㆍ음성ㆍ음향ㆍ화상ㆍ동영상 등의 정보 형태의 글, 사진, 동영상 및 각종 파일과 링크 등을 의미합니다.</p>
													<br><h5 style="font-weight:bold;">제 3 조 (약관의 게시와 개정)</h5>
													<p>①"회사"는 이 약관의 내용을 "회원"이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다.
													②"회사"는 "약관의규제에관한법률", "정보통신망이용촉진및정보보호등에관한법률(이하 "정보통신망법")" 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다.
													③"회사"가 약관을 개정할 경우에는 적용일자 및 개정사유를 명시하여 현행약관과 함께 제1항의 방식에 따라 그 개정약관의 적용일자 30일 전부터 적용일자 전일까지 공지합니다. 다만, 회원에게 불리한 약관의 개정의 경우에는 공지 외에 일정기간 서비스내 전자우편, 전자쪽지, 로그인시 동의창 등의 전자적 수단을 통해 따로 명확히 통지하도록 합니다.
													④회사가 전항에 따라 개정약관을 공지 또는 통지하면서 회원에게 30일 기간 내에 의사표시를 하지 않으면 의사표시가 표명된 것으로 본다는 뜻을 명확하게 공지 또는 통지하였음에도 회원이 명시적으로 거부의 의사표시를 하지 아니한 경우 회원이 개정약관에 동의한 것으로 봅니다.
													⑤회원이 개정약관의 적용에 동의하지 않는 경우 회사는 개정 약관의 내용을 적용할 수 없으며, 이 경우 회원은 이용계약을 해지할 수 있습니다. 다만, 기존 약관을 적용할 수 없는 특별한 사정이 있는 경우에는 회사는 이용계약을 해지할 수 있습니다.</p>
													<br><h5 style="font-weight:bold;">제 4 조 (약관의 해석)</h5>
													<p>①"회사"는 "유료서비스" 및 개별 서비스에 대해서는 별도의 이용약관 및 정책(이하 "유료서비스약관 등")을 둘 수 있으며, 해당 내용이 이 약관과 상충할 경우에는 "유료서비스약관 등"이 우선하여 적용됩니다.
													②이 약관에서 정하지 아니한 사항이나 해석에 대해서는 "유료서비스약관 등" 및 관계법령 또는 상관례에 따릅니다.</p>
													<br><h5 style="font-weight:bold;">제 5 조 (이용계약 체결)</h5>
													<p>①이용계약은 "회원"이 되고자 하는 자(이하 "가입신청자")가 약관의 내용에 대하여 동의를 한 다음 회원가입신청을 하고 "회사"가 이러한 신청에 대하여 승낙함으로써 체결됩니다.
													②"회사"는 "가입신청자"의 신청에 대하여 "서비스" 이용을 승낙함을 원칙으로 합니다. 다만, "회사"는 다음 각 호에 해당하는 신청에 대하여는 승낙을 하지 않거나 사후에 이용계약을 해지할 수 있습니다.
													1.가입신청자가 이 약관에 의하여 이전에 회원자격을 상실한 적이 있는 경우, 단 "회사"의 회원 재가입 승낙을 얻은 경우에는 예외로 함.
													2.실명이 아니거나 타인의 명의를 이용한 경우
													3.허위의 정보를 기재하거나, "회사"가 제시하는 내용을 기재하지 않은 경우
													4.14세 미만 아동이 법정대리인(부모 등)의 동의를 얻지 아니한 경우
													5.이용자의 귀책사유로 인하여 승인이 불가능하거나 기타 규정한 제반 사항을 위반하며 신청하는 경우
													③제1항에 따른 신청에 있어 "회사"는 "회원"의 종류에 따라 전문기관을 통한 실명확인 및 본인인증을 요청할 수 있습니다.
													④"회사"는 서비스관련설비의 여유가 없거나, 기술상 또는 업무상 문제가 있는 경우에는 승낙을 유보할 수 있습니다.
													⑤제2항과 제4항에 따라 회원가입신청의 승낙을 하지 아니하거나 유보한 경우, "회사"는 원칙적으로 이를 가입신청자에게 알리도록 합니다.
													⑥이용계약의 성립 시기는 "회사"가 가입완료를 신청절차 상에서 표시한 시점으로 합니다.
													⑦"회사"는 "회원"에 대해 회사정책에 따라 등급별로 구분하여 이용시간, 이용횟수, 서비스 메뉴 등을 세분하여 이용에 차등을 둘 수 있습니다.
													⑧"회사"는 "회원"에 대하여 "영화및비디오물의진흥에관한법률" 및 "청소년보호법"등에 따른 등급 및 연령 준수를 위해 이용제한이나 등급별 제한을 할 수 있습니다.</p>
													<br><h5 style="font-weight:bold;">제 6 조 (회원정보의 변경)</h5>
													<p>①"회원"은 개인정보관리화면을 통하여 언제든지 본인의 개인정보를 열람하고 수정할 수 있습니다. 다만, 서비스 관리를 위해 필요한 실명, 주민등록번호, 아이디 등은 수정이 불가능합니다.
													②"회원"은 회원가입신청 시 기재한 사항이 변경되었을 경우 온라인으로 수정을 하거나 전자우편 기타 방법으로 "회사"에 대하여 그 변경사항을 알려야 합니다.
													③제2항의 변경사항을 "회사"에 알리지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.</p>
													<br><h5 style="font-weight:bold;">제 7 조 (개인정보보호 의무)</h5>
													<p>"회사"는 "정보통신망법" 등 관계 법령이 정하는 바에 따라 "회원"의 개인정보를 보호하기 위해 노력합니다. 개인정보의 보호 및 사용에 대해서는 관련법 및 "회사"의 개인정보처리방침이 적용됩니다. 다만, "회사"의 공식 사이트 이외의 링크된 사이트에서는 "회사"의 개인정보처리방침이 적용되지 않습니다.</p>
													<br><h5 style="font-weight:bold;">제 8 조 ("회원"의 "아이디" 및 "비밀번호"의 관리에 대한 의무)</h5>
													<p>①"회원"의 "아이디"와 "비밀번호"에 관한 관리책임은 "회원"에게 있으며, 이를 제3자가 이용하도록 하여서는 안 됩니다.
													②"회사"는 "회원"의 "아이디"가 개인정보 유출 우려가 있거나, 반사회적 또는 미풍양속에 어긋나거나 "회사" 및 "회사"의 운영자로 오인한 우려가 있는 경우, 해당 "아이디"의 이용을 제한할 수 있습니다.
													③"회원"은 "아이디" 및 "비밀번호"가 도용되거나 제3자가 사용하고 있음을 인지한 경우에는 이를 즉시 "회사"에 통지하고 "회사"의 안내에 따라야 합니다.
													④제3항의 경우에 해당 "회원"이 "회사"에 그 사실을 통지하지 않거나, 통지한 경우에도 "회사"의 안내에 따르지 않아 발생한 불이익에 대하여 "회사"는 책임지지 않습니다.</p>
													<br><h5 style="font-weight:bold;">제 9 조 ("회원"에 대한 통지)</h5>
													<p>①"회사"가 "회원"에 대한 통지를 하는 경우 이 약관에 별도 규정이 없는 한 서비스 내 전자우편주소, 전자쪽지 등으로 할 수 있습니다.
													②"회사"는 "회원" 전체에 대한 통지의 경우 7일 이상 "회사"의 게시판에 게시함으로써 제1항의 통지에 갈음할 수 있습니다.</p>
													<br><h5 style="font-weight:bold;">제 10 조 ("회사"의 의무)</h5>
													<p>①"회사"는 관련법과 이 약관이 금지하거나 미풍양속에 반하는 행위를 하지 않으며, 계속적이고 안정적으로 "서비스"를 제공하기 위하여 최선을 다하여 노력합니다.
													②"회사"는 "회원"이 안전하게 "서비스"를 이용할 수 있도록 개인정보(신용정보 포함)보호를 위해 보안시스템을 갖추어야 하며 개인정보처리방침을 공시하고 준수합니다.
													③"회사"는 서비스이용과 관련하여 "회원"으로부터 제기된 의견이나 불만이 정당하다고 인정할 경우에는 이를 처리하여야 합니다. "회원"이 제기한 의견이나 불만사항에 대해서는 게시판을 활용하거나 전자우편 등을 통하여 "회원"에게 처리과정 및 결과를 전달합니다.
													</p>																							 
													 				
												</div>
												<div style = "text-align:right">
														<input type="checkbox" name="class[1]" value="agree1" id = "agree1" class="input_check">이용 약관에 동의 합니다<br>														
												</div><br>
												<div class="my-box" style="height: 150px;overflow: scroll; overflow-x: hidden;">
												<p>
													정보통신망법 규정에 따라 KOSBUS에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간을 안내 드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.</p><br>
													<h5 style="font-weight:bold;">1. 수집하는 개인정보</h5>
													<p>
													이용자는 회원가입을 하지 않아도 정보 검색, 뉴스 보기 등 대부분의 KOSBUS 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 메일, 캘린더, 카페, 블로그 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, KOSBUS는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다.
													회원가입 시점에 KOSBUS가 이용자로부터 수집하는 개인정보는 아래와 같습니다.
													- 회원 가입 시에 ‘아이디, 비밀번호, 이름, 생년월일, 성별, 가입인증 휴대폰번호’를 필수항목으로 수집합니다. 만약 이용자가 입력하는 생년월일이 만14세 미만 아동일 경우에는 법정대리인 정보(법정대리인의 이름, 생년월일, 성별, 중복가입확인정보(DI), 휴대폰번호)를 추가로 수집합니다. 그리고 선택항목으로 이메일 주소를 수집합니다.
													- 단체아이디로 회원 가입 시에 단체아이디, 단체이름, 법인명(단체명), 대표자명, 대표 전화번호, 사업장소재지, 관리자 아이디, 관리자 휴대폰번호를 필수항목으로 수집합니다.
													서비스 이용 과정에서 이용자로부터 수집하는 개인정보는 아래와 같습니다.
													KOSBUS 내의 개별 서비스 이용, 이벤트 응모 및 경품 신청 과정에서 해당 서비스의 이용자에 한해 추가 개인정보 수집이 발생할 수 있습니다. 추가로 개인정보를 수집할 경우에는 해당 개인정보 수집 시점에서 이용자에게 ‘수집하는 개인정보 항목, 개인정보의 수집 및 이용목적, 개인정보의 보관기간’에 대해 안내 드리고 동의를 받습니다.
													서비스 이용 과정에서 IP 주소, 쿠키, 방문일시·불량 이용 기록 등의 서비스 이용 기록, 기기정보가 생성되어 수집될 수 있습니다.
													구체적으로 1) 서비스 이용 과정에서 이용자에 관한 정보를 정보통신서비스 제공자가 자동화된 방법으로 생성하여 이를 저장(수집)하거나, 2) 이용자 기기의 고유한 정보를 원래의 값을 확인하지 못하도록 안전하게 변환한 후에 수집하는 경우를 의미합니다.
													<br><h5 style="font-weight:bold; text-align: left">2. 수집한 개인정보의 이용</h5>
													KOSBUS는 회원관리, 서비스 개발・제공 및 향상, 안전한 인터넷 이용환경 구축 등 아래의 목적으로만 개인정보를 이용합니다.
													- 회원 가입 의사의 확인, 연령 확인 및 법정대리인 동의 진행, 이용자 및 법정대리인의 본인 확인, 이용자 식별, 회원탈퇴 의사의 확인 등 회원관리를 위하여 개인정보를 이용합니다.
													- 콘텐츠 등 기존 서비스 제공(광고 포함)에 더하여, 인구통계학적 분석, 서비스 방문 및 이용기록의 분석, 개인정보 및 관심에 기반한 이용자간 관계의 형성, 지인 및 관심사 등에 기반한 맞춤형 서비스 제공 등 신규 서비스 요소의 발굴 및 기존 서비스 개선 등을 위하여 개인정보를 이용합니다.
													- 법령 및 KOSBUS 이용약관을 위반하는 회원에 대한 이용 제한 조치, 부정 이용 행위를 포함하여 서비스의 원활한 운영에 지장을 주는 행위에 대한 방지 및 제재, 계정도용 및 부정거래 방지, 약관 개정 등의 고지사항 전달, 분쟁조정을 위한 기록 보존, 민원처리 등 이용자 보호 및 서비스 운영을 위하여 개인정보를 이용합니다.
													- 유료 서비스 제공에 따르는 본인인증, 구매 및 요금 결제, 상품 및 서비스의 배송을 위하여 개인정보를 이용합니다.
													- 이벤트 정보 및 참여기회 제공, 광고성 정보 제공 등 마케팅 및 프로모션 목적으로 개인정보를 이용합니다.
													- 서비스 이용기록과 접속 빈도 분석, 서비스 이용에 대한 통계, 서비스 분석 및 통계에 따른 맞춤 서비스 제공 및 광고 게재 등에 개인정보를 이용합니다.
													- 보안, 프라이버시, 안전 측면에서 이용자가 안심하고 이용할 수 있는 서비스 이용환경 구축을 위해 개인정보를 이용합니다.
													<br><h5 style="font-weight:bold; text-align: left">3. 개인정보의 파기</h5>
													<p>회사는 원칙적으로 이용자의 개인정보를 회원 탈퇴 시 지체없이 파기하고 있습니다.
													단, 이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우, 또는 법령에서 일정 기간 정보보관 의무를 부과하는 경우에는 해당 기간 동안 개인정보를 안전하게 보관합니다.
													이용자에게 개인정보 보관기간에 대해 별도의 동의를 얻은 경우는 아래와 같습니다.
													부정가입 및 징계기록 등의 부정이용기록은 부정 가입 및 이용 방지를 위하여 수집 시점으로부터 6개월간 보관하고 파기하고 있습니다. 부정이용기록 내 개인정보는 가입인증 휴대폰 번호(만 14세 미만 회원의 경우 법정대리인 DI)가 있습니다.
													결제도용, 불법할인대출(일명 '카드깡') 등 관련 법령 및 이용약관을 위반하는 KOSBUS페이의 부정거래기록(아이디, 이름, 휴대폰번호, 배송지 주소, IP주소, 쿠키, 기기정보)은 부정거래 방지 및 다른 선량한 이용자의 보호, 안전한 거래 환경 보장을 위하여 수집 시점으로부터 3년간 보관하고 파기합니다.
													전자상거래 등에서의 소비자 보호에 관한 법률, 전자금융거래법, 통신비밀보호법 등 법령에서 일정기간 정보의 보관을 규정하는 경우는 아래와 같습니다. KOSBUS는 이 기간 동안 법령의 규정에 따라 개인정보를 보관하며, 본 정보를 다른 목적으로는 절대 이용하지 않습니다.
													- 전자상거래 등에서 소비자 보호에 관한 법률 
													계약 또는 청약철회 등에 관한 기록: 5년 보관 
													대금결제 및 재화 등의 공급에 관한 기록: 5년 보관 
													소비자의 불만 또는 분쟁처리에 관한 기록: 3년 보관
													- 전자금융거래법 
													전자금융에 관한 기록: 5년 보관
													- 통신비밀보호법 
													로그인 기록: 3개월													
												</div>
												<div style = "text-align:right">
														<input type="checkbox" name="class[2]" value="agree2" id = "agree2" class="input_check">이용 약관에 동의 합니다<br>														
												</div><br>
											<div class="my-box" style="height: 150px; overflow: scroll; overflow-x: hidden;">
												<p>
													위치정보 이용약관에 동의하시면, 위치를 활용한 광고 정보 수신 등을 포함하는 KOSBUS 위치기반 서비스를 이용할 수 있습니다.	</p>
													<h5 style="font-weight:bold; text-align: left">제 1 조 (목적)</h5>
													<p>이 약관은 KOSBUS 주식회사 (이하 “회사”)가 제공하는 위치정보사업 또는 위치기반서비스사업과 관련하여 회사와 개인위치정보주체와의 권리, 의무 및 책임사항, 기타 필요한 사항을 규정함을 목적으로 합니다.
													<h5 style="font-weight:bold; text-align: left">제 2 조 (약관 외 준칙)</h5>
													<p>이 약관에 명시되지 않은 사항은 위치정보의 보호 및 이용 등에 관한 법률, 정보통신망 이용촉진 및 정보보호 등에 관한 법률, 전기통신기본법, 전기통신사업법 등 관계법령과 회사의 이용약관 및 개인정보처리방침, 회사가 별도로 정한 지침 등에 의합니다.
													<h5 style="font-weight:bold; text-align: left">제 3 조 (서비스 내용 및 요금)</h5>
													<p>①회사는 직접 위치정보를 수집하거나 위치정보사업자인 이동통신사로부터 위치정보를 전달받아 아래와 같은 위치기반서비스를 제공합니다.
													1.Geo Tagging 서비스: 게시글 등록 시점의 개인위치정보주체의 위치정보를 게시글과 함께 저장합니다.
													2.위치정보를 활용한 검색결과 제공 서비스: 정보 검색을 요청하거나 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 제공 시 본 위치정보를 이용한 검색결과 및 주변결과(맛집, 주변업체, 교통수단 등)를 제시합니다.
													3.위치정보를 활용한 친구찾기 및 친구맺기: 현재 위치를 활용하여 친구를 찾아주거나 친구를 추천하여 줍니다.
													4.연락처 교환하기: 위치정보를 활용하여 친구와 연락처를 교환할 수 있습니다.
													5.현재 위치를 활용한 광고정보 제공 서비스: 광고정보 제공 요청 시 개인위치정보주체의 현 위치를 이용하여 광고소재를 제시합니다.
													6. 이용자 보호 및 부정 이용 방지: 개인위치정보주체 또는 이동성 있는 기기의 위치를 이용하여 권한없는 자의 비정상적인 서비스 이용 시도 등을 차단합니다.
													7. 위치정보 공유: 개인위치정보주체 또는 이동성 있는 기기의 위치정보를 안심귀가 등을 목적으로 지인 또는 개인위치정보주체가 지정한 제3자에게 공유합니다.
													8. 길 안내 등 생활편의 서비스 제공: 교통정보와 길 안내 등 최적의 경로를 지도로 제공하며, 주변 시설물 찾기, 뉴스/날씨 등 생활정보, 긴급구조 서비스 등 다양한 운전 및 생활 편의 서비스를 제공합니다.
													②제1항 위치기반서비스의 이용요금은 무료입니다.
													<h5 style="font-weight:bold; text-align: left">제 4 조 (개인위치정보주체의 권리)</h5>
													<p>①개인위치정보주체는 개인위치정보 수집 범위 및 이용약관의 내용 중 일부 또는 개인위치정보의 이용ㆍ제공 목적, 제공받는 자의 범위 및 위치기반서비스의 일부에 대하여 동의를 유보할 수 있습니다.
													②개인위치정보주체는 개인위치정보의 수집ㆍ이용ㆍ제공에 대한 동의의 전부 또는 일부를 철회할 수 있습니다.
													③개인위치정보주체는 언제든지 개인위치정보의 수집ㆍ이용ㆍ제공의 일시적인 중지를 요구할 수 있습니다. 이 경우 회사는 요구를 거절하지 아니하며, 이를 위한 기술적 수단을 갖추고 있습니다.
													④개인위치정보주체는 회사에 대하여 아래 자료의 열람 또는 고지를 요구할 수 있고, 당해 자료에 오류가 있는 경우에는 그 정정을 요구할 수 있습니다. 이 경우 회사는 정당한 이유 없이 요구를 거절하지 아니합니다.
													1.개인위치정보주체에 대한 위치정보 수집ㆍ이용ㆍ제공사실 확인자료
													2.개인위치정보주체의 개인위치정보가 위치정보의 보호 및 이용 등에 관한 법률 또는 다른 법령의 규정에 의하여 제3자에게 제공된 이유 및 내용
													⑤회사는 개인위치정보주체가 동의의 전부 또는 일부를 철회한 경우에는 지체 없이 수집된 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료를 파기합니다. 단, 동의의 일부를 철회하는 경우에는 철회하는 부분의 개인위치정보 및 위치정보 수집ㆍ이용ㆍ제공사실 확인자료에 한합니다.
													⑥개인위치정보주체는 제1항 내지 제4항 의 권리행사를 위하여 이 약관 제13조의 연락처를 이용하여 회사에 요구할 수 있습니다.
													<h5 style="font-weight:bold; text-align: left">제 5 조 (법정대리인의 권리)</h5>
													<p>①회사는 만14세 미만 아동으로부터 개인위치정보를 수집ㆍ이용 또는 제공하고자 하는 경우에는 만14세 미만 아동과 그 법정대리인의 동의를 받아야 합니다.
													②법정대리인은 만14세 미만 아동의 개인위치정보를 수집ㆍ이용ㆍ제공에 동의하는 경우 동의유보권, 동의철회권 및 일시중지권, 열람ㆍ고지요구권을 행사할 수 있습니다.
													상호: KOSBUS 주식회사
													주소: 경기도 성남시 분당구 불정로 6 KOSBUS 그린팩토리 (463-867)
													전화번호: 1588-3820
													이메일 주소: kosbushs@kosbus.com
													<h5 style="font-weight:bold; text-align: left">부칙</h5>
													<h5 style="font-weight:bold; text-align: left">제1조 시행일</h5>
													<p>2015년 6월 2일부터 시행되던 종전의 약관은 본 약관으로 대체하며, 본 약관은 2015년 11월 26일부터 적용됩니다.
													<h5 style="font-weight:bold; text-align: left">제2조 위치정보관리 책임자 정보</h5>
													<p>회사는 다음과 같이 위치정보 관리책임자를 지정하여 이용자들이 서비스 이용과정에서 발생한 민원사항 처리를 비롯하여 개인위치정보 주체의 권리 보호를 위해 힘쓰고 있습니다.<br>
													위치정보 관리책임자 : (개인)정보보호 담당 부서 임원(개인정보 보호책임자 겸직)<br>
													전화번호 : 1588-3820<br>
													이메일 주소 : privacy@kosbus.com<br>
																									
																									
												</div><div style = "text-align:right">
														<input type="checkbox" name="class[3]" value="agree3" id = "agree3" class="input_check">이용 약관에 동의 합니다<br>														
													 </div>	<br>
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
											&& $("#agree2").is(":checked")
											&& $("#agree3").is(":checked")){
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
											&& $("#agree2").is(":checked")
											&& $("#agree3").is(":checked")){
										$("#all-agree").prop("checked", true);
										$("#next").attr('disabled', false);
									} else {
										$("#all-agree").prop("checked", false);
										$("#next").attr('disabled', true);
									}
								});
						$("#agree3").click(
								function() {
									if ($("#agree1").is(":checked")
											&& $("#agree2").is(":checked")
											&& $("#agree3").is(":checked")){
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
								$("#agree3").prop("checked", true);
								$("#next").attr('disabled', false);

							} else {

								$("#agree1").prop("checked", false);
								$("#agree2").prop("checked", false);
								$("#agree3").prop("checked", false);
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
</html> --%>