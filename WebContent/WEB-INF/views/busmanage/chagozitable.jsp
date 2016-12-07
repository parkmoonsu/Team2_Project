<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table table-hover projects" id="bustable">
	<thead>
		<tr>
			<th>구분</th>
			<th>버스번호</th>
			<th>차량번호</th>
			<th>기사</th>
			<th>등록</th>
			<th>수리조회</th>

		</tr>
	</thead>
	<tbody>
		<c:set value="${sclist}" var="d" />

		<c:forEach var="i" items="${d}">
			<tr>
				<td>${i.r}</td>
				<td>${i.b_vehiclenum}</td>
				<td>${i.r_num}</td>
				<td>${i.m_name}</td>
				<td>${i.g_name}</td>
				<td>
					<div class="btn btn-success btn-xs" data-toggle="modal"
						data-target="#myModal" data-whatever="${i.m_name},${i.m_id}">
						<i class="fa fa-search"></i>&nbsp;조회
					</div>
				</td>

			</tr>
		</c:forEach>
	</tbody>
</table>