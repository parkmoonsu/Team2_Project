 <!-- 
	@FileName : Okay.jsp
	@Project	: KosBus
	@Date	: 2016. 12.04
	@Author	: 박문수
	@Discription : 수정완료 페이지
 -->
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<title>Insert title here</title>
</head>
<body>
<se:authentication property="name" var="LoginUser" /> 
<script type="text/javascript">
	//alert("수정 완료");
		swal({
        title: "",
        text: "수정 완료",
        type: "info",
        closeOnConfirm: true,
        showLoaderOnConfirm: true,
      },
      function(){
      });
	location.href = "joinapprove.member?m_id=${LoginUser}";
</script>
</body>
</html>