	<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Javascript -->
      <script src="${pageContext.request.contextPath}/loginassets/assets/js/jquery-1.11.1.min.js"></script>
        <script src="${pageContext.request.contextPath}/loginassets/assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/loginassets/assets/js/jquery.backstretch.min.js"></script>
        <script src="${pageContext.request.contextPath}/loginassets/assets/js/scripts.js"></script>
         <script type="text/javascript">
        $(function() {

			$("#log").click(function() {
				location.href="login.htm"
			});
			
			$("#gaip").click(function() {
				location.href="join.htm"
			});
		});
        </script>
<style type="text/css">
.my-box {
	border: 1px solid;
	padding: 10px;
}

/* body { 
    background: url(images/background2.jpg) no-repeat center center fixed; 
 
    -webkit-background-size: cover;
 
    -moz-background-size: cover;
 
    -o-background-size: cover;
 
    background-size: cover;
 
} */
/*  .inner-bg{
    background-image:url(images/background2.jpg);
    background-repeat:no-repeat;
    background-size: 100%;
}  */
/* .inner-bg{
background-image: url("http://s7.postimg.org/6q2osq2t7/filter_1.jpg");
    background-size: cover;
    background-position: center center;
    background-attachment: fixed;
    height: 100%;
    transition: background-image .55s;
} */
    
 #login:hover {
    background-color: #86E57F;
    border-color: 2px solid #4CAF50;
    color: white;
} 
#uesrname, #password{
	background-color: white; 
}
placeholder{
	size: 12px
}

.form-bottom {
    line-height: 1.8;
}
/*  .btn {
    background-color: #4CAF50;
    color: white;
}  */
  #fh5co-header #navbar li a:hover {
    color: #fc9700 !important;
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
<%--         <link rel="stylesheet" href="${pageContext.request.contextPath}/login-form/css/style.css">
 --%>
</head>
<body>
<%-- <img src="${pageContext.request.contextPath}/images/background2.jpg" > --%>
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
		           	<li><a href="join.htm" id="gaip"><span>회원가입</span></a></li>
		          </ul>
		        </div>
			    </nav>
		  </div>
	</header>


        	
            <div class="inner-bg">
               <div class="container">
   
                   <div class="wrapper">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-center" align="center" style="color: white">
                        			<h2>Login</h2>
                        		</div>
                            </div>
                            <div class="form-bottom"> 
                            <!-- <form class='login-form'>
  <div class="flex-row">
    <label class="lf--label" for="username">
      <svg x="0px" y="0px" width="12px" height="13px">
        <path fill="#B1B7C4" d="M8.9,7.2C9,6.9,9,6.7,9,6.5v-4C9,1.1,7.9,0,6.5,0h-1C4.1,0,3,1.1,3,2.5v4c0,0.2,0,0.4,0.1,0.7 C1.3,7.8,0,9.5,0,11.5V13h12v-1.5C12,9.5,10.7,7.8,8.9,7.2z M4,2.5C4,1.7,4.7,1,5.5,1h1C7.3,1,8,1.7,8,2.5v4c0,0.2,0,0.4-0.1,0.6 l0.1,0L7.9,7.3C7.6,7.8,7.1,8.2,6.5,8.2h-1c-0.6,0-1.1-0.4-1.4-0.9L4.1,7.1l0.1,0C4,6.9,4,6.7,4,6.5V2.5z M11,12H1v-0.5 c0-1.6,1-2.9,2.4-3.4c0.5,0.7,1.2,1.1,2.1,1.1h1c0.8,0,1.6-0.4,2.1-1.1C10,8.5,11,9.9,11,11.5V12z"/>
      </svg>
    </label>
    <input id="username" class='lf--input' placeholder='Username' type='text'>
  </div>
  <div class="flex-row">
    <label class="lf--label" for="password">
      <svg x="0px" y="0px" width="15px" height="5px">
        <g>
          <path fill="#B1B7C4" d="M6,2L6,2c0-1.1-1-2-2.1-2H2.1C1,0,0,0.9,0,2.1v0.8C0,4.1,1,5,2.1,5h1.7C5,5,6,4.1,6,2.9V3h5v1h1V3h1v2h1V3h1 V2H6z M5.1,2.9c0,0.7-0.6,1.2-1.3,1.2H2.1c-0.7,0-1.3-0.6-1.3-1.2V2.1c0-0.7,0.6-1.2,1.3-1.2h1.7c0.7,0,1.3,0.6,1.3,1.2V2.9z"/>
        </g>
      </svg>
    </label>
    <input id="password" class='lf--input' placeholder='Password' type='password'>
  </div>
  <input class='lf--submit' type='submit' value='LOGIN'>
</form>
<a class='lf--forgot' href='#'>Forgot password?</a> -->
			                   <form role="form"action="${pageContext.request.contextPath}/login"
								method="post" name="f" class="login-form" style="margin-bottom: 20px">
								
								<!-- new -->
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon1"> <i
									class="fa fa-user"></i>
								</span> <input type="text" name="username" id="form-username"
									class="form-control f-input" placeholder="Username" style="background-color: #e2e2e2;">
							</div>
							<br>
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon1"> <i
									class="fa fa-lock"></i>
								</span> <input type="password" name="password" id="form-password"
									class="form-control f-input" placeholder="Password" style="background-color: #e2e2e2;">
							</div><br>
							


							<!--  <div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
			                        	<input type="text" name="username" placeholder="Username..." class="form-username form-control" id="form-username">
			                        </div>
			                        
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" name="password" placeholder="Password..." class="form-password form-control" id="form-password">
			                        </div> 
 -->
			                        <!-- <button class="btn btn-block" type="submit" style="height:40px; padding-bottom: 15px">LogIN</button> -->
			                        <input class="btn btn-success btn btn-block" id="login" style="background-color: #6EE5A3; border:0" type="submit"  value="LogIn">
			                        <br>
									<div class="col-sm-6 col-xs-12" style=":padding-right:5px">
			                        <a href="search.htm"class="btn btn-primary btn-sm btn-block" style="height:30px; background-color:#64AAFF; border:0">아이디/비밀번호찾기</a>
			                        </div>
			                        
			                        <div class="col-sm-6 col-xs-12" style="padding-left: 3px">
			                        <a href="join.htm"	class="btn btn-primary btn-sm btn-block" style="height:30px; background-color: #64AAFF	; border:0">회원가입</a>
			                        </div>
			                        
			                      </form> --%>
			                    <c:if test="${param.error != null}">
									<div>로그인 실패 <br>
											<script>
														alert("극혐");
													</script>
															<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
      												이유 : <c:out
																	value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
															</c:if>
														</div>
													</c:if>
		                     </div>
                        </div>
                    </div>
                </div>
            </div> <br>
            
            
                    <footer>
				<jsp:include page="/sidebar/footer.jsp" />
			</footer>
           
   


        

</body>
</html>