<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="d" value="${mlist}" />
<c:set var="d2" value="${nlist}" />
<c:set var="d3" value="${slist}" />

<table id="table"
	style="table-layout: fixed; word-break: break-all; text-align: center class="table table-hoverprojects">
	<thead>
		<tr>
			<th class='backslash' style="width: 75px; height: 20px;"><div>일(日)&nbsp;</div>&nbsp;이름</th>


			<c:forEach var="i" begin="1" end="31" step="1">
				<th style="width: 35px; text-align: center">${i}</th>
			</c:forEach>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="a" begin="0" end="${fn:length(d)-1}" step="1">
			<tr>
				<td style="height: 40px;">${d[a].m_name}</td>
				<c:forEach var="i" begin="0" end="30" step="1">
					<td style="height: 40px;">${d3[a].cs_stat[i]}</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</tbody>

</table>