<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<table class="table table-hover projects" style="text-align: center">
										<thead>
											<tr>
												<th style="width: 50px">번호</th>
												<th style="width: 100px">차량번호</th>
												<th style="width: 110px">노선번호</th>
												<th style="width: 90px">기사</th>
												<th style="width: 180px">차고지 이름</th>
												<th style="width: 60px">상태</th>
												<th style="width: 100px; text-align: center;"><i
													class="fa fa-trash" style="margin-bottom: 2px"></i> <input
													type="checkbox" class="form" id = "checkall"></th>
											</tr>
										</thead>
										<tbody id>
											<c:set value="${list}" var="d" />

											<c:forEach var="i" items="${d}">

											<tr>
												<td>${i.r}</td>
												<td>${i.b_vehiclenum}</td>
												<td>${i.r_num}</td>
												<td>${i.m_name}</td>
												<td>${i.g_name}</td>
												<td>${i.s_name}</td>
												<td style = "text-align:center"> 
													<input type = "checkbox" id = "check${i.r}" value = "${i.b_vehiclenum}" name = "chklist">
                                         		</td>
											</tr>

											</c:forEach>
										</tbody>
									</table>
									
									<!-- end project list -->

									
