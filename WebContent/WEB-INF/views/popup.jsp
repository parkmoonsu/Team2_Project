<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#ok").click(function(){
			
		window.open("about:blank","_self").close();
			
		});
	});

</script>
</head>

<body>
	
	<h2>이메일 인증</h2>
	<hr>
	<br><br>
	
	<div class="form-group">
		<label for="m_name" class="control-label col-md-3 col-sm-3 col-xs-12">인증번호
		</label>
		<div class="col-md-3 col-sm-3 col-xs-12">
			<input id="m_name" class="form-control col-md-7 col-xs-12"
				type="text" name="m_name">
			<input type = "button" class = "btn btn-default" id = "ok" value = "완료">
		</div>
	</div>
</body>
</html>