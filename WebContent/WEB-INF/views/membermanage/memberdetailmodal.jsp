<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal-dialog modal-lg" role="document">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
			<h4 class="modal-title" id="exampleModalLabel1"></h4>
		</div>
		<div class="modal-body">


			<br />
			<form class="form-horizontal form-label-left input_mask">

				<div class="col-sm-6 col-md-6">
					<div class="thumbnail">
						<img
							src="<%=request.getServletContext().getContextPath()%>/join/upload/${mjdrodto.m_photo}"
							alt="...">
						<div class="caption">
							<h3>${mjdrodto.m_id },${mjdrodto.m_photo}</h3>
							<p>...</p>
							<p>
								<a href="#" class="btn btn-default btn-sm" role="button">사진변경</a>
								<a href="#" class="btn btn-default" role="button">경력조회</a>
							</p>
						</div>
					</div>
				</div>
				

				<div class="col-md-3 col-sm-6 col-xs-12 form-group has-feedback">
					<input type="text" class="form-control has-feedback-left"
						id="inputSuccess2" value="${mjdrodto.m_id }" readonly> <span
						class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
				</div>

				<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
					<input type="text" class="form-control" id="inputSuccess3" 
						value="${mjdrodto.m_name }" readonly> <span
						class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
				</div>

				<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
					<input type="text" class="form-control has-feedback-left"
						id="inputSuccess4" value="${mjdrodto.m_addr }" readonly> <span
						class="fa fa-envelope form-control-feedback left"
						aria-hidden="true"></span>
				</div>

				<div class="col-md-6 col-sm-6 col-xs-12 form-group has-feedback">
					<input type="text" class="form-control" id="inputSuccess5"
						value="${mjdrodto.m_daddr }" readonly> <span
						class="fa fa-phone form-control-feedback right" aria-hidden="true"></span>
				</div>
				
				<br>
				<br>
				
			 	<!-- 방금추가 -->
				<div class="form=group">
				<div class="col-sm-6  ">
				<br>
				<br>
				</div>
				</div> 
				
				
				
					<div class="form-group">
	
							<div class="col-md-6 col-sm-6 col-xs-12">
								<input type="text" class="form-control"
									value="${mjdrodto.j_name }" readonly>
					</div>
				
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input type="text" class="form-control" disabled="disabled"
							value="${mjdrodto.m_email }" readonly>
					
					</div>
				</div> 
				
			
			
				<div class="form-group">
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input type="text" class="form-control" readonly="readonly"
							value="${mjdrodto.m_license}" readonly>
					</div>
					
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control" required="required" type="text"
							value="${mjdrodto.m_birth }" readonly>
					</div>
				</div>
			
				
				<div class="form-group">

					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control" required="required" type="text"
							value="${mjdrodto.m_resume }" readonly>
					</div>
					
					<div class="col-md-6 col-sm-6 col-xs-12">
						<input class="form-control" required="required" type="text"
							value="${mjdrodto.o_date }" readonly>
					</div>
				</div>
				
				
				
				<div class="form-group">
					<div class="table-responsive" id="reguloffrtable"
						data-example-id="simple-table"></div>
				</div>

			</form>

		</div>
		<div class="modal-footer">
			<button type="button" data-toggle="modal" data-target="#memberresrecord" data-whatever="${mjdrodto.m_name }" class="btn btn-success">이력확인</button>
		</div>

	</div>

</div>


