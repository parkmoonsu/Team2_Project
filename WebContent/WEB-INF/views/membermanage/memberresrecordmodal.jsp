 <!-- 
	@FileName : memberdetailmodal.jsp
	@Project	: KosBus
	@Date	: 2016. 12.01
	@Author	: 강민수
	@Discription : 회원이력보기
 -->
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table class="table" style="text-align: center">
		                	<thead>
		                		<tr>
		                			<th style="width: 15%">이력구분</th>
		                			<th style="width: 20%">근무시작일</th>
		                			<th style="width: 20%">근무종료일</th>
		                			<th style="width: 20%">근무회사</th>
		                			<th style="width:25%">근무기간</th>
		                		</tr>
		                	</thead>
		                	<tbody>
		                		<c:forEach var="lists" items="${reslist }">
		                		<tr>
		                			<td style="width: 15%">${lists.res_name }</td>
		                			<td style="width: 20%">${lists.res_start }</td>
		                			<td style="width: 20%">${lists.res_end }</td>
		                			<td style="width: 20%">${lists.res_com }</td>
		                			<td style="width: 25%">${lists.res_period }</td>
		                		</tr>
		                		</c:forEach>		                	
		                	</tbody>
		                	
		                	</table>