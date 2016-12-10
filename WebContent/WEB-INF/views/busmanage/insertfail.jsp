 <!-- 
	@FileName : insertfail.jsp
	@Project	: KosBus
	@Date	: 2016. 11.22
	@Author	: 박문수
	@Discription : 버스 등록 실패 페이지
 -->
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
</head>
<body>
	<script type="text/javascript">
		//swal("등록 실패 - 입력 값이 잘못되었습니다.");
		swal(
				{
					title : "등록 실패",
					text : "입력 값이 잘못되었습니다.",
					type : "warning",
					
					confirmButtonColor : "#DD6B55",
					confirmButtonText : "확인",
					closeOnConfirm : true
				}, function() {
				});
		location.href = "busreg.admin";
	</script>
</body>
</html>