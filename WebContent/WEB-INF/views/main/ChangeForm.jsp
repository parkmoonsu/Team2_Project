<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script
	src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>

<title>KOSBUS</title>

<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css"
	rel="stylesheet">
<!-- iCheck -->
<link
	href="${pageContext.request.contextPath}/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">
<!-- bootstrap-progressbar -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link
	href="${pageContext.request.contextPath}/vendors/jqvmap/dist/jqvmap.min.css"
	rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/build/css/custom.min.css"
	rel="stylesheet">
<script type="text/javascript">
	$(function(){
		$("#photo_swipe").click(function(){
			$("#photo").click();
		});
	});
</script>
</head>


<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
			<c:choose>
          		<c:when test ="${jobname == '기사'}">
          			<jsp:include page="/sidebar/sidebar2.jsp"></jsp:include>
          		</c:when>
          		<c:otherwise>
          			<jsp:include page="/sidebar/sidebar.jsp"></jsp:include>
          		</c:otherwise>
       		</c:choose>
       		</div>
			<!--상단 menu -->

			<div class="top_nav">
				<jsp:include page="/sidebar/menuHeader.jsp"></jsp:include>
			</div>
			<!-- page content -->
			<div class="right_col" role="main">
				<!-- top tiles -->
				<div class="row tile_count"></div>
				<!-- /top tiles -->

				<div class="row">
					<div class="col-sm-12">
						<div class="dashboard_graph">
							<div class="row x_title">
								<div class="col-md-6">
									<h3>개인정보</h3>
								</div>
							</div>
							<div class="clearfix">
								<div class="container">
									<div class="row">
										<div class="col-sm-2"></div>
										<div class="col-sm-8">

											<div class="panel panel-info">
												<div class="panel-heading">
													<h3 class="panel-title">개인정보</h3>
												</div>
												<div class="panel-body">
													<div class="row">
														<div class="col-xs-12 col-sm-5" align="center">
															<div class="row">
																<div class="col-xs-12 col-sm-12">
																	
																	<img
																		src="${pageContext.request.contextPath}/join/upload/${dto.m_photo}"
																		style="width: 200px; height: 200px;" class = "img img-thumbnail">
																</div>
																<!-- <a style = "display:none"><input type = "file" id = "photo"></a>
																<button class="btn btn-primary" style="margin-top:10px;margin-right: 10px" id = "photo_swipe">사진변경</button>
																 -->
																
															</div>
														</div>
														<div class="col-xs-12 col-sm-7">
															<table class="table table-user-information">
																<tbody>
																	<tr>
																		<td>이름</td>
																		<td>${dto.m_name}</td>
																	</tr>
																	<tr>
																		<td>ID</td>
																		<td>${dto.m_id}</td>
																	</tr>
																	<tr>
																		<td>연락처</td>
																		<td>${dto.m_phone}</td>
																	</tr>
																	<tr>
																		<td>성별</td>
																		<c:choose>
																			<c:when test = "${dto.m_gender == 'male'}">
																				<td>남성</td>
																			</c:when>
																			<c:otherwise>
																				<td>여성</td>
																			</c:otherwise>
																		</c:choose>
																		
																	</tr>
																	
																	<tr>
																		<td>우편주소</td>
																		<td>${dto.m_addr}</td>
																	</tr>
																	<tr>
																		<td>상세주소</td>
																		<td>${dto.m_daddr}</td>
																	</tr>
																	<tr>
																		<td>직책</td>
																		<td>${dto.j_name}</td>
																	</tr>
																	<tr>
																		<td>면허증</td>
																		<td>${dto.m_license}</td>
																	</tr>
																	<tr>
																		<td>이력서</td>
																		<td><a>${dto.m_resume}</a></td>
																	</tr>
																	<tr>
																		<td>E-Mail</td>
																		<td>${dto.m_email}
																		</td>

																	</tr>
																	<tr>
																		<td>생년월일</td>
																		<td>${dto.m_birth}</td>
																	</tr>
																	<tr>
																		<td>사용 가능 연차</td>
																		<td>${dto.m_annual}일</td>
																	</tr>
																</tbody>
															</table>
															<div class="col-xs-12">
															<a class="btn btn-primary" id="pass">정보수정</a> 
															<a class="btn btn-primary" id="watch">이력보기</a>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>

				</div>
				<br />

			</div>
		</div>
		<!-- /page content -->

		<!-- footer content -->
		<footer>
			<jsp:include page="/sidebar/footer.jsp"></jsp:include>
			<div class="clearfix"></div>
		</footer>
		<!-- /footer content -->
	</div>
<!-- BEGIN # MODAL LOGIN -->
	<div class="modal fade" id="new-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	<div class="modal-dialog">
			<div class="modal-content">      
                <!-- Begin # DIV Form -->
                <div id="div-forms">
                <div class="modal-header" align="center">
					<h3>이력보기</h3>
				</div>
                    <!-- Begin # Login Form -->
                    <form id="login-form" action="" method="post">
		                <div class="modal-body">
		                	<table class="table">
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
		                		<c:forEach var="lists" items="${list }">
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
				     	</div>
        		    	<div class="modal-footer">
                            <div>
                                <a href="redirect:/ChangeForm.htm"><button type="submit" class="btn btn-primary btn-lg btn-block">완료</button></a>
                            </div>
        		    	</div>
                    </form>
                    <!-- End # Login Form -->  
                </div>
                <!-- End # DIV Form --> 
			</div>
		</div>
	</div>
	<!-- end modal -->
	
	<!-- BEGIN # MODAL LOGIN -->
	<div class="modal fade" id="pass-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	<div class="modal-dialog">
			<div class="modal-content">      
                <!-- Begin # DIV Form -->
                <div id="div-forms">
                <div class="modal-header" align="center">
					<h3>비밀번호 입력</h3>
				</div>
                    <!-- Begin # Login Form -->
                    <form id="login-form" action="updateinfo.htm" method="post">
		                <div class="modal-body">
		                	<div style = "text-align:center">
		                	<label for ="m_pw">비밀번호 </label>
		                	<input type = "password" name = "m_pw" id = "m_pw">
		                	</div>
				     	</div>
        		    	<div class="modal-footer">
                            <div>
                                <input type="submit" class="btn btn-primary btn-lg btn-block" value = "완료">
                            </div>
        		    	</div>
                    </form>
                    <!-- End # Login Form -->  
                </div>
                <!-- End # DIV Form --> 
			</div>
		</div>
	</div>
	<!-- end modal -->
	
	
	<script type="text/javascript">
	$(document).ready(function() {
		$('#watch').click(function(){
			$('#new-modal').modal();
		});
		
		$("#pass").click(function(){
			$("#pass-modal").modal();
		});
	});
	
	</script>


	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
	<!-- Chart.js -->
	<script
		src="${pageContext.request.contextPath}/vendors/Chart.js/dist/Chart.min.js"></script>
	<!-- gauge.js -->
	<script
		src="${pageContext.request.contextPath}/vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script
		src="${pageContext.request.contextPath}/vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.time.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script
		src="${pageContext.request.contextPath}/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script
		src="${pageContext.request.contextPath}/vendors/DateJS/build/date.js"></script>
	<!-- JQVMap -->
	<script
		src="${pageContext.request.contextPath}/vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script
		src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>
</body>
</html>
