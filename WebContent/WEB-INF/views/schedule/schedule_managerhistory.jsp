<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>

<!--
 * @File Name: schedule_managerhistory.jsp
 * @Author: 길한종
 * @Data: 2016. 11. 29
 * @Desc: 일정관리(매니저 승인)
-->

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>버스 관리</title>
<script src="${pageContext.request.contextPath}/NewLoader/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/NewLoader/js/jquery.oLoader.min.js"></script>
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
	
<!-- Editor -->
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
		<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<style>
table, th{
	text-align: center;
}
</style>
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-xs-12  col-md-3 left_col">

				<jsp:include page="/sidebar/sidebar.jsp"></jsp:include>
			</div>

			<!--상단 menu -->
			<div class="top_nav">
				<jsp:include page="/sidebar/menuHeader.jsp"></jsp:include>
			</div>
			  <!-- page content -->
        <div class="right_col" role="main">
        
         <!--  top tiles
          <div class="row tile_count" style = "text-align: center">
          	<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
          		<span class="count_top"></span>
          	</div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-bus"></i> 마을버스</span>
              <div class="count">0</div>          
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-bus"></i> 시내버스</span>
              <div class="count">0</div>              
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-bus"></i> 시외버스</span>
              <div class="count">0</div>            
            </div>
            <div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count">
              <span class="count_top"><i class="fa fa-bus"></i> 전체(대)</span>
              <div class="count green">0</div>
            </div>  
          </div>
          top tiles -->
          
				<div class="">
				<div class="page-title">
						<div class="title_left">
							<h3>휴무 신청 내역
								<small>확인 및 승인</small>
							</h3>
						</div>
					</div>
					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-xs-12">
						
							<div class="x_panel">
								<div class="x_content">
									<!-- start project list -->
									<div
										class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
										<div class="input-group">
											<!-- <input type="text" class="form-control"
												placeholder="Search for..." id="search"> <span
												class="input-group-btn">
												<button class="btn btn-default" type="button" id="btnsearch">Go!</button>
											</span> -->
										</div>
									</div>
									<table class="table table-hover projects">
										<thead>
											<tr>
												<th>번호</th>
												<th>현재휴무일</th>
												<th>변경휴무일</th>
												<th>요청일</th>
												<th>승인일</th>
												<th>신청자</th>
												<th>변경대상</th>
												<th>상태</th>
												<!-- <th style="width: 20%; text-align:center;">
												<i class ="fa fa-trash" style = "margin-bottom: 2px"></i> <input type = "checkbox" class = "form"> -->
											
											</tr>
										</thead>
										<tbody>
											<c:set value="${list}" var="d"/>
										
											<c:forEach var="i" items="${d}" varStatus="status">
											<tr>
												<td>${status.count}</td>
												<td>${i.bd}</td>
												<td>${i.ad}</td>
												<td>${i.ro_reqdate}</td>
												<td>${i.ro_regdate}</td>
												<td>${i.bn}</td>
												<td>${i.an}</td>
												<c:if test="${i.ko_name=='승인'}">
													<td><button class="btn btn-success" style="width:69px">${i.ko_name}</button></td>
												</c:if>
												<c:if test="${i.ko_name=='신청중'}">
													<td><button class="btn btn-info" id="${i.m_id}n${i.ro_object}" onclick="btnclick('${i.m_id}', '${i.ro_object}')">${i.ko_name}</button></td>
												</c:if>
												<!-- <td style = "text-align:center"> 
													<input type = "checkbox">
                                         		</td> -->
											</tr>
											</c:forEach>
										</tbody>
									</table>
									<!-- end project list -->
									
									<!-- 요기서부터 페이징처리 -->
									<c:set var = "count" value = "${count}"/>
									<c:set var = "pgc" value = "${pgs}"/>
									<c:choose>
											<c:when test="${count % 10 == 0}">
												<c:set value = "${count/10}" var = "pagecount"/>
											</c:when>
											<c:otherwise>
												<c:set value = "${count/10 + 1}" var = "pagecount"/>
											</c:otherwise>
									</c:choose>	
									<ul class="pager">
										<c:if test="${pgc > 1}">
											<li><a href="busenroll.admin?pg=${pgc-1}">Previous</a></li>
										</c:if>
										
										
										<c:forEach var="i" begin="1" end="${pagecount}" step="1">
											<li><a href="busenroll.admin?pg=${i}">${i}</a></li>
										</c:forEach>
										
										<c:if test="${pgc < count/10 }">
											<li><a href="busenroll.admin?pg=${pgc+1}">Next</a></li>
										</c:if>
									</ul>
									
									
								</div>
									
									
									
									
									
									
									
									
									
							</div>
							
							<div id = "enroll">
							
							<!-- 여기에 ajax 내용 삽입됨(enroll.jsp) -->
							</div>	
								
							</div>
							
							
							
						</div>
					</div>
				</div>
			</div>

      <!-- 수현:삭제모달    -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">
								<i class="fa fa-exclamation-triangle"></i> 회원삭제
							</h4>
						</div>
						<div class="modal-body" aria-labelledby="myModalLabel"
							id="myModalLabel2"></div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="cancelbutton">삭제</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
							<input type="hidden" id="hvalue">
						</div>
					</div>
				</div>
			</div>

			<!-- 수현:삭제모달 끝 -->

			<div class="modal fade" id="memberresrecord" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title" id="resrecordtitle">
								 
							</h4>
						</div>
						<div class="modal-body" aria-labelledby="myModalLabel"
							id="resrecordtable"></div>
					</div>
				</div>
			</div>



			<!-- footer content -->
			<footer>
			<jsp:include page="/sidebar/footer.jsp"></jsp:include>
			<div class="clearfix"></div>
		</footer>
			<!-- /footer content -->
		</div>



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
	<script type="text/javascript">
	var num = 1;
	function plus(){
		 num++;
			var gname = "#g_name" + num;
			var rnum = "#r_num" + num;
			var mname = "#mname" + num;	
			var bvehiclenum = "#b_vehiclenum" + num;
			var tr = "<tr>";
			tr += "<td width = 300px>";
			tr += "<input class='form-control' id='b_vehiclenum"+ num +"' name = 'b_vehiclenum' type='text' size = '3'>";
			tr += "</td>";
			tr += "<td width = 300px>";
			tr += "<select class='form-control' id='g_name" + num + "' name = 'g_name'>";
			tr += "<option>선택</option>";
			tr += "</select>";
			tr += "</td>";
			tr += "<td width = 300px>";
			tr += "<select class='form-control' id='r_num" + num + "' name = 'r_num'>";
			tr += "<option>선택</option>";
			tr += "</select>";
			tr += "</td>";
			tr += "<td width = 300px>";
			tr += "<select class='form-control' id='mname" + num + "' name = 'm_name'>";
			tr += "<option>선택</option>";
			tr += "</select>";
			tr += "</td>";
			tr += "</tr>";
			
			$("#tbody").append(tr); 
				
	}
	
	$(function(){
		
		var count = 1;
		
		//console.log(num);

		$("#ebtn").click(function(){
			var mname = "#mname" + num;
			$.ajax({
				url : "enrollpage.admin",
				success:function(data){
						if (count % 2 == 0) {
							$("#enroll").attr("style", "display:none");
							count++;
						} else {
							$("#enroll").attr("style", "display:inline");
							count++;
						}
						$("#enroll").empty();
						$("#enroll").append(data);
						
						$.ajax({
							url : "getmember.admin",
							success:function(data){
								for(var i = 0 ; i < data.m_id.length ; i++){
									$(mname).append("<option value = " + data.m_id[i] + ">" + data.m_name[i] + "("+data.m_id[i] +")" + "</option>");
								}
							}
							
						});
						
						$.ajax({
							url : "getgarage.admin",
							success:function(data){
									//console.log(data.gname[0]);
									
									for(var i = 0 ; i < data.gname.length; i++){
										$("#g_name1").append("<option value = " + data.gnum[i] + ">" + data.gname[i] + "</option>");
									}
							}
						});
						
						$("#g_name1").change(function(){
							//console.log($("#g_name").val());
							$.ajax({
								url : "getroute.admin",
								type : "post",
								data:{g_num : $("#g_name1").val().trim()},
								success:function(data){
										$("#r_num1").empty();
										$("#r_num1").append("<option>선택</option>");
										for(var i = 0 ; i < data.rnum.length; i++){
											$("#r_num1").append("<option value = " + data.rnum[i] + ">" + data.rnum[i] + "</option>");
											
										}
								}
								
							});
							
						});
				}
			});
		});
		
		
		
	});
	
	function btnclick(m_id, ro_object){
		if (confirm("승인 하시겠습니까??") == true){
			$.ajax({
				type:"post",
				data:{
					m_id:m_id,
					ro_object:ro_object
				},
				url:"agreehistory.admin",
				success:function(){
					//alert('승인 되었습니다.');
					swal({
						  title: "",
						  text: "승인 되었습니다.",
						  type: "info",
						  closeOnConfirm: true,
						  showLoaderOnConfirm: true,
						},
						function(){
						  /* setTimeout(function(){
						    swal("Ajax request finished!");
						  }, 2000); */
						});
					$('#'+m_id+'n'+ro_object).attr('class', 'btn btn-success');
					$('#'+m_id+'n'+ro_object).attr('onclick', '');
					$('#'+m_id+'n'+ro_object).text('승인');
				}
			});
		}
		    
	}
	
	</script>
</body> 	
</html>
