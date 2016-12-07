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
 .inner-bg{
  /*  background-color: #F9FFFF; */
   background-color: #2A3F54;
  /*  background-color: #dcdcdc; */

} 
/* 
.form-top{
   background-color: #EBFBFF;

} */
</style>
</head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>아이디 비밀번호 찾기</title>

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
		            <li class="active"><a href="bus.htm	" data-nav-section="home"><span>Home</span></a></li> 
		            <li><a href="login.htm" id="log"><span>로그인</span></a>&nbsp;&nbsp;</li>
		           	<li><a href="join.htm" id="gaip"><span>회원가입</span></a></li>
		          </ul>
		        </div>
			    </nav>
		  </div>
	</header>

	<div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                    <div class="form-top" align="center" style="color: #7f7f7f; background-color:#F9FFFF">
					<div class="form-top-center">
                        <ul class="nav nav-tabs">	
								<li class="active">
								<a data-toggle="tab" href="#findId">
								아이디 찾기 
								</a>						
								</li>

								 <li>
								 <a data-toggle="tab" href="#findPw">
								 비밀번호 찾기 </a>
								 </li>
								</ul>
								 <div class="tab-content" style="background-color: white">
								 
								 <div id="findId" class="tab-pane fade in active" style="background-color: white;"> 
									<div style="background-color: white"></div>
										<div class="my-box" style="margin:30px;">				
												<h2 class="StepTitle" align="center" style="color: #7f7f7f;">아이디 찾기</h2>
												<div class="form-group" style="padding : 30px ;">
													<div id="step-2">
														<form class="form-horizontal form-label-left"
															method="post" action="searchid.htm">
												
												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="m_name">이름
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" id="m_name" name = "m_name"
															class="form-control col-md-5 col-xs-12">
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="m_email">이메일
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" id="m_email" name = "m_email"
															class="form-control col-md-5 col-xs-12">
													</div>
													<div class = "col-md-1 col-sm-1 col-xs-12">
													<input type ="submit" class ="btn btn-default" id= "emailbtn1" value = "전송">
													</div>
												</div>
												</form>
													</div>															
													</div>
												</div>
											
											</div>

												<div id="findPw" class="tab-pane fade">
												<div class="my-box" style="margin:30px" >
												<h2 class="StepTitle" align="center" style="color: #7f7f7f;">비밀번호 찾기</h2>
												<div class="form-group" style="padding: 25px">
													<div id="step-2">
														<form class="form-horizontal form-label-left"
															method="post" action="searchpw.htm">

													<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="m_id">아이디
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" id="m_id" name = "m_id"
															class="form-control col-md-7 col-xs-12">
													</div>
												</div>

												<div class="form-group">
													<label class="control-label col-md-3 col-sm-3 col-xs-12"
														for="m_email">이메일
													</label>
													<div class="col-md-6 col-sm-6 col-xs-12">
														<input type="text" id="m_email" name = "m_email"
															class="form-control col-md-5 col-xs-12">
													</div>
													<div class = "col-md-1 col-sm-1 col-xs-12">
													<input type ="submit" class ="btn btn-default" id= "emailbtn2" value = "전송">
													</div>
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
                    
                   <hr>
                <footer style="color: white">
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
		});
        </script>

</body>
</html>