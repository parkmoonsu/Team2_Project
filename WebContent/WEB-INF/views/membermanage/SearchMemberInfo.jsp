<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
						<table class="table table-hover  projects"
										style="text-align: center;"
										>
										<thead>
											<tr>
												<th style="width: 70px">번호</th>
												<th style="width: 150px">ID</th>
												<th style="width: 150px">이름</th>
												<th style="width: 150px">이메일</th>
												<th style="width: 150px">직책</th>
										
												<th style="width: 100px"></th>
											</tr>
										</thead>
										
								<c:set value="${dto}" var="d" />
									<c:if test ="${d != '[]' }">
										<c:forEach var="i" items="${d}">
											<tr>
												<td>${i.r}</td>
												<td><a href="#" onClick="smodal('${i.m_id}');">${i.m_id}</a></td>
												<td><small>${i.m_name}</small></td>
												<td><a href="#" data-toggle="modal"
													data-target="#exampleModal"
													data-whatever="${i.m_name},${i.m_email}">${i.m_email}</a></td>
												<td><small>${i.j_name}</small></td>
											
												<td style="text-align: center">
													<div class="btn btn-danger btn-xs"
														onclick="deleteMember('${i.m_id}','${i.m_name}');">
														<i class="fa fa-trash-o"></i> 삭제
													</div>
												</td>
											</tr>
										</c:forEach>
										</c:if>
										<c:if test ="${d == '[]' }">
											<tr>
												<td colspan = '6' align = "center">검색회원이 없습니다..</td>
											</tr>
										</c:if>
										</tbody>
									</table>		
