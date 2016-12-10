 <!-- 
	@FileName : enrollupdate.jsp
	@Project	: KosBus
	@Date	: 2016. 11.23
	@Author	: 박문수
	@Discription : 버스 정보 수정 페이지
 -->
 
 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="x_panel">
	<div class="x_content" id="updateenroll">
	<form action = "update.admin" method = "post" id = "update">
		<table class="table table-hover projects">

			<thead>
				<tr>
					<th>차량번호</th>
					<th>차고지이름</th>
					<th>노선번호</th>
					<th>기사</th>

				</tr>
			</thead>

			<tbody id="tbody">

				<tr>
					<td width=300px><input class="form-control" id="b_vehiclenum_u"
						name="b_vehiclenum_u" type="text" value="${bdto.b_vehiclenum}"
						size="3">
						<input type = "hidden" name = "hidden" value = "${bdto.b_vehiclenum}">	
					</td>
					<td width=300px><select class="form-control" id="g_name_u"
						name="g_name_u">
							<option>선택</option>
							<option value="${bdto.g_num}" selected>${bdto.g_name}</option>
					</select></td>
					<td width=300px><select class="form-control" id="r_num_u"
						name="r_num_u">
							<option>선택</option>
							<option value="${bdto.r_num}" selected>${bdto.r_num}</option>
					</select></td>
					<td width=300px><select class="form-control" id="mname_u"
						name="mname_u">

							<option>선택</option>
							<option value="${bdto.m_id}" selected>${bdto.m_name}</option>
					</select></td>


				</tr>
			</tbody>
		</table>

		<div class="btn btn-default btn-xs" onclick = "update()"
			style="float: right">
			<i class="fa fa-retweet"></i> 수정
		</div>
	</form>
	</div>
</div>