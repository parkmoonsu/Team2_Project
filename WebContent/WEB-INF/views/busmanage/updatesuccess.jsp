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
		swal({
	        title: "",
	        text: "수정 완료",
	        type: "info",
	        closeOnConfirm: true,
	        showLoaderOnConfirm: true,
	      },
	      function(){
	      })
		location.href = "busenroll.admin";
	</script>
</body>
</html>