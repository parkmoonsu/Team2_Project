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
</style>
</head>
		<meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>KosBus로그인</title>

        <!-- CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/css/form-elements.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/loginassets/assets/css/style.css">

</head>
<body>
	<div class="top-content">
        	
            <div class="inner-bg">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6 col-sm-offset-3 form-box">
                        	<div class="form-top">
                        		<div class="form-top-center" align="center" style="color: white">
                        			<h2>Log IN</h2>
                        		</div>
                            </div>
                            <div class="form-bottom">
			                   <form role="form"action="${pageContext.request.contextPath}/login"
								method="post" name="f" class="login-form" style="margin-bottom: 20px">
			                    	<div class="form-group">
			                    		<label class="sr-only" for="form-username">Username</label>
			                        	<input type="text" name="username" placeholder="Username..." class="form-username form-control" id="form-username">
			                        </div>
			                        <div class="form-group">
			                        	<label class="sr-only" for="form-password">Password</label>
			                        	<input type="password" name="password" placeholder="Password..." class="form-password form-control" id="form-password">
			                        </div>
			                        <a href="search.htm"class="btn btn-primary btn-sm btn-block">아이디/비밀번호찾기</a>
			                        <a href="join.htm"	class="btn btn-primary btn-sm btn-block">회원가입</a>
			                        <button type="submit" class="btn" style="padding:0px">LogIN</button>
			                        <button id="callback" class="btn"style="padding:0px">돌아가기</button>
			                    </form>
			                    <c:if test="${param.error != null}">
									<div>로그인 실패 <br>
											<script>
														alert("강민수는 바람둥이");
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
		});
        </script>

</body>
</html>