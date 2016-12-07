<!-- 
	@FileName : busstatsearch.jsp
	@Project	: KosBus
	@Date	: 2016. 12 .07
	@Author	: 조한솔
	@Discription : (관리자)차고지별 버스 현황 View단
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table" style="text-align: center">
		                	<thead>
		                		<tr>
		                			<th style="width: 15%">차량번호</th>
		                			<th style="width: 20%">수리명</th>
		                			<th style="width: 20%">수리내용</th>
		                			<th style="width: 20%">수리비용</th>
		                			<th style="width:25%">수리날짜</th>
		                		</tr>
		                	</thead>
		                	<tbody>
		                		<c:forEach var="lists" items="${list}">
		                		<tr>
		                			<td style="width: 15%">${lists.b_vehiclenum}</td>
		                			<td style="width: 20%">${lists.rep_name}</td>
		                			<td style="width: 20%">${lists.rd_detail}</td>
		                			<td style="width: 20%">${lists.rd_cost}</td>
		                			<td style="width: 25%">${lists.rd_date}</td>
		                		</tr>
		                		</c:forEach>		                	
		                	</tbody>
		                	
		                	</table>