 <!-- 
	@FileName : matchfailpass.jsp
	@Project	: KosBus
	@Date	: 2016. 12.04
	@Author	: 박문수
	@Discription : 비밀번호 불일치 페이지
 -->
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		//alert("비밀번호가 일치하지 않습니다.");
		swal({
                    title: "",
                    text: "비밀번호가 일치하지 않습니다.",
                    type: "info",
                    closeOnConfirm: true,
                    showLoaderOnConfirm: true,
                  },
                  function(){
                  });
		location.href = "ChangeForm.htm";
	</script>
</body>
</html>