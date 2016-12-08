<!-- 
	@FileName : chagozi.jsp
	@Project	: KosBus
	@Date	: 2016. 11.26
	@Author	: 조한솔
	@Discription : (관리자)차고지별 버스 현황 View단
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<table class="table table-hover projects" id="bustable">
	<thead>
		<tr>
			<th style="width:90px">구분</th>
			<th style="width:145px">버스번호</th>
			<th style="width:150px">차량번호</th>
			<th style="width:130px">기사</th>
			<th style="width:180px">등록</th>
			<th style="width:160px">수리조회</th>

		</tr>
	</thead>
	<tbody id="tbody">
		<c:set value="${sclist}" var="d" />

		<c:forEach var="i" items="${d}">
			<tr>
				<td style="width:90px">${i.r}</td>
				<td style="width:145px">${i.r_num}</td>
				<td style="width:150px">${i.b_vehiclenum}</td>
				<td style="width:130px">${i.m_name}</td>
				<td style="width:180px">${i.g_name}</td>
				<td style="width:160px">
					<div class="btn btn-success btn-xs" style="color: white"
						data-toggle="modal" data-target="#myModal"
						onClick="smodal('${i.b_vehiclenum}')">
						<i class="fa fa-search"></i> &nbsp;조회
					</div>
				</td>

			</tr>
		</c:forEach>
	</tbody>
</table>