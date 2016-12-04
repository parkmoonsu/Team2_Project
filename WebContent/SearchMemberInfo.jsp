<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
						<c:set value="${data.dto}" var="d" />
						${d }
						<%-- <table class="table table-hover  projects"
										style="text-align: center;"
										>
										<thead>
											<tr>
												<th style="width: 50px">번호</th>
												<th style="width: 100px">ID</th>
												<th style="width: 90px">이름</th>
												<th style="width: 200px">이메일</th>
												<th style="width: 80px">직책</th>
												<th style="width: 50px">연차</th>
												<th style="width: 100px"></th>
											</tr>
										</thead>
										<c:set value="${data.dto}" var="d" />
										
										<c:forEach var="i" items="${d}">
											<tr>
												<td>${i}</td>
												<td><a href="#" onClick="smodal('${i.m_id}');">${i.m_id}</a></td>
												<td><small>${i.m_name}</small></td>
												<td><a href="#" data-toggle="modal"
													data-target="#exampleModal"
													data-whatever="${i.m_name},${i.m_email}">${i.m_email}</a></td>
												<td><small>${i.j_name}</small></td>
												<td>${i.m_annual}일</td>
												<td style="text-align: center">
													<div class="btn btn-danger btn-xs"
														onclick="deleteMember('${i.m_id}','${i.m_name}');">
														<i class="fa fa-trash-o"></i> 삭제
													</div>
												</td>
											</tr>
										</c:forEach>
										</tbody>
									</table> --%>
									
					
									
</body>
</html>