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
				<td><font color="#1ABB9C">${i.m_name}</font></td>
				<td>${i.o_date}</td>
				<td><font color="#1ABB9C">${i.c_name}</font></td>
				<td>${i.c_date}</td>
				<td>${i.ro_reqdate}</td>
				<c:choose>
					<c:when test="${i.ko_name == '승인'}">
						<td><font color="green">${i.ko_name}</font></td>
					</c:when>
					<c:when test="${i.ko_name == '거절'}">
						<td><font color="red">${i.ko_name}</font></td>
					</c:when>
					<c:otherwise>
						<td><font color="orange">${i.ko_name}</font></td>
					</c:otherwise>
				</c:choose>
				<td>${i.ro_regdate}</td>
			</tr>
		</c:forEach>
		<c:if test="${d == '[]' }">
			<tr>
				<td colspan='8' align="center">검색한 내용이 없습니다.</td>
			</tr>
		</c:if>
	</tbody>
</table>
