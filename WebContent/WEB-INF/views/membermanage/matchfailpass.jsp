<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		location.href = "membermanage.admin";
	</script>
</body>
</html>