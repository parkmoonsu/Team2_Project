<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

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
