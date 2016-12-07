<!-- 
	@FileName : commutesearchtable.jsp
	@Project	: KosBus
	@Date	: 2016. 11. 19
	@Author	: 조한솔
	@Discription : (회원-기사)출/퇴근 목록 View단
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table style="text-align: center" class="table table-user-information">
	<thead style="font-weight: bold;">
		<tr>
			<td>NO.</td>
			<td>날짜</td>
			<td>출근시간</td>
			<td>출근상태</td>
			<td>퇴근시간</td>
			<td>퇴근상태</td>
		</tr>
		</thead>
		<tbody>
		<c:forEach var="i" items="${list}">
			<tr>
				<td>${i.rownum}</td>
				<td>${i.c_date}</td>
				<td>${i.c_start}</td>
				<td>${i.cs_stat}</td>
				<td>${i.c_end}</td>
				<td>${i.ce_stat}</td>
			<tr>
		</c:forEach>
	</tbody>
</table>