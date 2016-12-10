 <!-- 
	@FileName : enroll.jsp
	@Project	: KosBus
	@Date	: 2016. 11.22
	@Author	: 김수현
	@Discription : 버스 등록페이지
 -->
 
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="x_panel">
	<div class="x_content">
	<form action="reg.admin" id = "target">
		<table class="table table-hover projects">
		
										<thead>
											<tr>
												<th>차량번호</th>
												<th>차고지이름</th>
												<th>노선번호</th>
												<th>기사</th>
												
											</tr>
										</thead>
										
										<tbody id = "tbody">
											
											<tr>
												<td width = 300px>
													<input class="form-control" id="b_vehiclenum1" name = "b_vehiclenum" type="text" size = "3">
												</td>
												<td width = 300px>
													<select class="form-control" id="g_name1" name = "g_name">
														<option>선택</option>
													</select>
												</td>
												<td width = 300px>
													<select class="form-control" id="r_num1" name = "r_num">
														<option>선택</option>
													</select>
												</td>
												<td width =300px>
													<select class="form-control" id="mname1" name = "mname">
													
														<option>선택</option>
													</select>
												</td>
												
												
											</tr>
										</tbody>
									</table>
									
									
									<div class = "btn btn-success btn-xs" id = "reg" style = "float:right" onclick = "reg()">
									<i class="fa fa-check"></i> 등록
									</div>
									
									<div class="btn btn-default btn-xs" style="float: right" onclick = "plus()">
										<i class="fa fa-plus"></i> 추가
									</div>
									
			</form>
		
	</div>
</div>

