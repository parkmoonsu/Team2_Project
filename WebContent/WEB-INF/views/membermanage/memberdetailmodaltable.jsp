<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="table">
	<caption>Optional table caption.</caption>
	<thead>
		<tr>
			<th>요청자</th>
			<th>기존휴무</th>
			<th>대상자</th>
			<th>변경휴무</th>
			<th>신청일</th>
			<th>승인일</th>
			<th>상태</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="list" items="${offrlist }">
		<tr>
			<th scope="row">${list.m_name }(${list.m_id })</th>
			<td>${list.o_date }</td>
			<td>${list.m_name1 }(${list.m_id1 })</td>
			<td>${list.o_date1 }</td>
			<td>${list.ro_reqdate }</td>
			<td>${list.ro_regdate }</td>
			<td>${list.ko_name }</td>
		</tr>
		</c:forEach>
	</tbody>
</table>