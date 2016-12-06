<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-hover projects" style="text-align: center">
	<thead>
		<tr>

			<th style="width: 70px; text-align: center">노선</th>
			<th style="width: 70px; text-align: center">변경신청기사</th>
			<th style="width: 70px; text-align: center">기존휴무요일</th>
			<th style="width: 70px; text-align: center">변경대상기사</th>
			<th style="width: 70px; text-align: center">변경희망요일</th>
			<th style="width: 70px; text-align: center">변경요청일</th>
			<th style="width: 70px; text-align: center">상태</th>
			<th style="width: 70px; text-align: center">상태일</th>
		</tr>
	</thead>
	<tbody>
		<c:set var="d" value="${list}" />
		<c:forEach items="${d}" var="i">
			<tr>

				<td>${i.r_num}</td>
				<td>${i.m_name}</td>
				<td>${i.o_date}</td>
				<td>${i.c_name}</td>
				<td>${i.c_date}</td>
				<td>${i.ro_reqdate}</td>
				<td>${i.ko_name}</td>
				<td>${i.ro_regdate}</td>
			</tr>
		</c:forEach>

	</tbody>
</table>
