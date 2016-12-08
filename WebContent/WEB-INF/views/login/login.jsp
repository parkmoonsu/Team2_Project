
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Javascript -->
<script
	src="${pageContext.request.contextPath}/loginassets/assets/js/jquery-1.11.1.min.js"></script>
<script
	src="${pageContext.request.contextPath}/loginassets/assets/bootstrap/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/loginassets/assets/js/jquery.backstretch.min.js"></script>
<script
	src="${pageContext.request.contextPath}/loginassets/assets/js/scripts.js"></script>
<script type="text/javascript">
        $(function() {

			$("#log").click(function() {
				location.href="login.htm"
			});
			
			$("#gaip").click(function() {
				location.href="join.htm"
			});
		});
        function showPassword() {
            
            var key_attr = $('#key').attr('type');
            
            if(key_attr != 'text') {
                
                $('.checkbox').addClass('show');
                $('#key').attr('type', 'text');
                
            } else {
                
                $('.checkbox').removeClass('show');
                $('#key').attr('type', 'password');
                
            }
            
        }
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
/* #login:hover {
	background-color: #86E57F;
	border-color: 2px solid #4CAF50;
	color: white;
} */

#uesrname, #password {
	background-color: white;
}

placeholder {
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/loginassets/assets/bootstrap/css/bootstrap.min.css">
<%-- <link rel="stylesheet"
	href="${pageContext.request.contextPath}/loginassets/assets/font-awesome/css/font-awesome.min.css"> --%>
 <link rel="stylesheet"
	href="${pageContext.request.contextPath}/loginassets/assets/css/form-elements.css"> 
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/loginassets/assets/css/style.css">
<link rel="stylesheet" id="theme-switch"
	href="${pageContext.request.contextPath}/mainCss/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/login-form/css/style.css">
	
</head>
<body>
	<%-- <img src="${pageContext.request.contextPath}/images/background2.jpg" > --%>
	<header role="banner" id="fh5co-header">
		<div class="container">
			<!-- <div class="row"> -->
			<nav class="navbar navbar-default">
				<div class="navbar-header">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar"><i></i></a> <a class="navbar-brand"
						href="bus.htm">RoadOneBell</a>
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
		<div class="inner-bg" style="padding-top: 60px; padding-bottom: 60px">

    <div class="container">
         <hr>
        <div class="row" style="padding-top: 60px;">
    	    <div class="col-xs-12 col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">        	    
                <h1 id="h1">Log in your account</h1>
                <form role="form" action="${pageContext.request.contextPath}/login" method="post" id="login-form" autocomplete="off" name = "f">
                    <div class="form-group">
                        <label for="text" class="sr-only">Userid</label>
                        <input type="text" name="username" id="username" class="form-control" placeholder="Userid">
                    </div>
                    <div class="form-group">
                        <label for="key" class="sr-only">Password</label>
                        <input type="password" name="password" id="password" class="form-control" placeholder="Password">
                    </div>
                    <div class="checkbox" style="text-align: left ">
                        <span class="character-checkbox" onclick="showPassword()"></span>
                        <span class="label">Show password</span>
                    </div>
                    <input type="submit" id="btn-login" class="btn btn-custom btn-lg btn-block" value="Log In">
                </form>
                <div class="col-sm-6">
                <a href="search.htm" class="forget">아이디/비밀번호 찾기</a>
                </div><div class="col-sm-6">
                <a href="join.htm"class="forget">회원가입</a>
				</div>
						
                <hr/>            	   
    		</div> <!-- /.col-xs-12 -->
    	</div> <!-- /.row -->
    </div> <!-- /.container -->
<br>
<div class="row"></div><hr>
  <footer>
<jsp:include page="/sidebar/footer.jsp" />
</footer>

</div>
<!-- <div class="modal fade forget-modal" tabindex="-1" role="dialog" aria-labelledby="myForgetModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">
					<span aria-hidden="true">×</span>
					<span class="sr-only">Close</span>
				</button>
				<h4 class="modal-title">Recovery password</h4>
			</div>
			<div class="modal-body">
				<p>Type your email account</p>
				<input type="email" name="recovery-email" id="recovery-email" class="form-control" autocomplete="off">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
				<button type="button" class="btn btn-custom">Recovery</button>
			</div>
		</div> /.modal-content
	</div> /.modal-dialog
</div> /.modal -->



<%-- 
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
						<form role="form"
							action="${pageContext.request.contextPath}/login" method="post"
							name="f" class="login-form" style="margin-bottom: 20px">

							<!-- new -->
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon1"> <i
									class="fa fa-user"></i>
								</span> <input type="text" name="username" id="form-username"
									class="form-control f-input" placeholder="Username"
									style="background-color: #e2e2e2;">
							</div>
							<br>
							<div class="input-group">
								<span class="input-group-addon" id="sizing-addon1"> <i
									class="fa fa-lock"></i>
								</span> <input type="password" name="password" id="form-password"
									class="form-control f-input" placeholder="Password"
									style="background-color: #e2e2e2;">
							</div>
							<br>



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
							
							<input class="btn btn-success btn btn-block" id="login"
								style="background-color: #6EE5A3; border: 0" type="submit"
								value="LogIn"> <br>
							<div class="col-sm-6 col-xs-12" style="padding-right: 5px">
								<a href="search.htm" class="btn btn-primary btn-sm btn-block"
									style="height: 30px; background-color: #64AAFF; border: 0">아이디/비밀번호찾기</a>
							</div>

							<div class="col-sm-6 col-xs-12" style="padding-left: 3px">
								<a href="join.htm" class="btn btn-primary btn-sm btn-block"
									style="height: 30px; background-color: #64AAFF; border: 0">회원가입</a>
							</div>

						</form>--%>
						<c:if test="${param.error != null}">
							<div>
								로그인 실패 <br>
								<script>
									alert("극혐");
								</script>
								<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
					                이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
								</c:if>
							</div>
						</c:if>
						<!--</div>
				</div>
			</div>
		</div>
	</div> -->
	<br>








</body>
</html>