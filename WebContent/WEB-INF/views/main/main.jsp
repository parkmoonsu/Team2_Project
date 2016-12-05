<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<script src="${pageContext.request.contextPath}/NewLoader/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/NewLoader/js/jquery.oLoader.min.js"></script>
<script  type="text/javascript">
$(function() {
	 $.oPageLoader();
});
</script>
<c:choose>
	<c:when test="${jobname == '기사'}">
		<script>
			location.href = "ChangeForm.htm";
		</script>
	</c:when>
	<c:otherwise>
		<script>
			location.href = "adminmain.admin";
		</script>
	
	</c:otherwise>
</c:choose>
