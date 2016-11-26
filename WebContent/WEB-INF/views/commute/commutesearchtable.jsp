<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-user-information">
	<tbody style="text-align: center">
		<tr>
			<td>NO.</td>
			<td>날짜</td>
			<td>출근시간</td>
			<td>퇴근시간</td>
		</tr>
		<c:set var="show"></c:set>
		<c:forEach var="i" items="${list}">
			<tr>
				<td>${i.rownum}</td>
				<td>${i.c_date}</td>
				<td>${i.c_start}</td>
				<td>${i.c_end}</td>
			<tr>
		</c:forEach>

	</tbody>
</table>