
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
            
            var key_attr = $('#password').attr('type');
            
            if(key_attr != 'text') {
                
                $('.checkbox').addClass('show');
                $('#password').attr('type', 'text');
                
            } else {
                
                $('.checkbox').removeClass('show');
                $('#password').attr('type', 'password');
                
            }
            
        }
</script>
<style type="text/css">
.my-box {
	border: 1px solid;
	padding: 10px;
}

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
	color: #52d3aa !important;
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
	href="${pageContext.request.contextPath}/mainCss/css/style5.css">
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
	<div class="inner-bg" style="padding-top: 60px; padding-bottom: 0">

		<div class="container">
			<hr>
			<div class="row" style="padding-top: 30px;">
				<div
					class="col-xs-12 col-md-4 col-md-offset-4 col-sm-6 col-sm-offset-3">
					<h1 id="h1">Login your account</h1>
					<form role="form" action="${pageContext.request.contextPath}/login"
						method="post" id="login-form" autocomplete="off" name="f">
						<div class="form-group">
							<label for="text" class="sr-only">UserId</label> <input
								type="text" name="username" id="username" class="form-control"
								placeholder="Userid" style="font-size: 12px">
						</div>
						<div class="form-group">
							<label for="key" class="sr-only">Password</label> <input
								type="password" name="password" id="password"
								class="form-control" placeholder="Password" style="font-size: 12px">
						</div>
						<div class="checkbox" style="text-align: left">
							<span class="character-checkbox" onclick="showPassword()"></span>
							<span class="label">Show password</span>
						</div>
						<input type="submit" id="btn-login"
							class="btn btn-custom btn-lg btn-block" value="Log In">
					</form>
					<div class="col-sm-6">
						<a href="search.htm" class="forget" style="color: #1F50B5">아이디/비밀번호
							찾기</a>
					</div>
					<div class="col-sm-6">
						<a href="join.htm" class="forget" style="color: #1F50B5">회원가입</a>
					</div>

					<hr />
				</div>
				<!-- /.col-xs-12 -->
			</div>
			<!-- /.row -->
		</div>
		<!-- /.container -->
		<br>
		<div class="row"></div>
		<hr>
		<footer>
			<jsp:include page="/sidebar/footer.jsp" />
		</footer>

	</div>

	<c:if test="${param.error != null}">
		<div>
			로그인 실패 <br>
			<script>
									alert("극혐");
								</script>
			<c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
					                이유 : <c:out
					value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
			</c:if>
		</div>
	</c:if>
	<br>
</body>
</html>