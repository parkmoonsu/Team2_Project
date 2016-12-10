 <!-- 
	@FileName : searchidsuccess.jsp
	@Project	: KosBus
	@Date	: 2016. 11.26
	@Author	: 강민수
	@Discription : 아이디 찾기 성공
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
	//alert("입력된 이메일로 ID가 전송되었습니다.");
	swal({
        title: "",
        text: "입력된 이메일로 ID가 전송되었습니다.",
        type: "info",
        closeOnConfirm: true,
        showLoaderOnConfirm: true,
      },
      function(){
      });
	location.href = "login.htm";
</script>
</body>
</html>