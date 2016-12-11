 <!-- 
	@FileName : busenroll.jsp
	@Project	: KosBus
	@Date	: 2016. 11.25
	@Author	: 박문수
	@Discription : (관리자)버스 관리 페이지 View단
 -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">



<script>



</script>
<title>운영 관리</title>

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
	src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js">
</script>
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">

<style>
th{
	text-align: center;
}

ul.pagination li a.active {
    background-color: #1ABB9C;
    color: white;
}

ul.pagination li a {
    color: #73879C;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}

#no,#m,#n,#w,#g{
cursor: pointer; 
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
			<br><br><br>
			<!-- page content -->
			<div class="right_col" role="main">
				<!-- top tiles -->
				<div class="row tile_count" style="text-align: center">
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count" id = "no">
						
						<span class="count_top"><i class="fa fa-bus"></i> 미정</span>
						<div class="count red">${no}</div>
					
					</div>
					
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count" id = "m">

						<span class="count_top"><i class="fa fa-bus"></i> 간선버스</span>
						<div class="count">${m}</div>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count" id = "n">
						<span class="count_top"><i class="fa fa-bus"></i> 지선버스</span>
						<div class="count">${n}</div>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count" id = "w">
						<span class="count_top"><i class="fa fa-bus"></i> 공항버스</span>
						<div class="count">${a}</div>
					</div>
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count" id = "g">
						<span class="count_top"><i class="fa fa-bus"></i> 광역버스</span>
						<div class="count">${g}</div>
					</div>
					
					<div class="col-md-2 col-sm-4 col-xs-6 tile_stats_count" id = "allbus">
						<a href ="busenroll.admin">
							<span class="count_top"><i class="fa fa-bus"></i> 전체(대)</span>
							<div class="count green">${m+n+a+g+no}</div>
						</a>
					</div>
					
				</div>
				<!-- /top tiles -->
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								<small>노선-기사 등록</small>
							</h3>
						</div>
					</div>
					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-xs-12">
							<div class="x_panel">
								<div class="x_content" id = "xbody">
									<!-- start project list -->
									<!-- <div
										class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
										<div class="input-group">
											<input type="text" class="form-control"
												placeholder="Search for..." id="search"> <span
												class="input-group-btn">
												<button class="btn btn-default" type="button" id="btnsearch">Go!</button>
											</span>
										</div>
									</div> -->
									<table class="table table-hover projects" style="text-align: center">
										<thead>
											<tr>
												<th style="width: 70px">번호</th>
												<th style="width: 120px">차량번호</th>
												<th style="width: 120px">노선번호</th>
												<th style="width: 120px">기사</th>
												<th style="width: 180px">차고지 이름</th>
												
												<th style="width: 100px; text-align: center;"><i
													class="fa fa-trash" style="margin-bottom: 2px"></i> <input
													type="checkbox" class="form" id = "checkall"></th>
											</tr>
										</thead>
										<tbody>
											<c:set value="${list}" var="d" />

											<c:forEach var="i" items="${d}">

											<tr>
												<td>${i.r}</td>
												<td>${i.b_vehiclenum}</td>
												<td>${i.r_num}</td>
												<td>${i.m_name}</td>
												<td>${i.g_name}</td>
												
												<td style = "text-align:center"> 
													<input type = "checkbox" id = "check${i.r}" value = "${i.b_vehiclenum}" name = "chklist">
                                         		</td>
											</tr>

											</c:forEach>
										</tbody>
									</table>
									
									<!-- end project list -->

									<!-- 요기서부터 페이징처리 -->

									<c:set var = "Count" value = "${count}"/>
									<c:set var = "pgc" value = "${pgs}"/>
									<c:set var = "pagecount" value = "${pagecount}" />
									
									
									<div style="text-align: center">
										<ul class="pagination">
										<c:if test="${pgc > 1}">
											<li><a href="busenroll.admin?pg=${pgc-1}">Prev</a></li>
										</c:if>

										<c:forEach begin="1" end="${pagecount}" var="i" step = "5">
											<c:forEach begin = "${i}" end = "${i+4}" step = "1" var = "x">
												<c:if test="${x <= pagecount}">
													<c:choose>
														<c:when test="${pgc == x}">
															<li><a  class="active" href="#">${x}</a></li>
														</c:when>
														<c:when test="${pgc > i-1 && pgc < i+5 }">
															<li><a href="busenroll.admin?pg=${x}">${x}</a></li>
														</c:when>
														<c:when test ="${x == i+5}">
															<c:forEach begin = "${x}" end = "${x+4}" step = "1" var = "y">
																<li><a href="busenroll.admin?pg=${y}">${y}</a></li>
															</c:forEach>
														</c:when>
													</c:choose>
												</c:if>
												
											</c:forEach>
										</c:forEach>
											

										<%-- <c:forEach var="i" begin="1" end="${pagecount}" step="1">
											<li><a href="busenroll.admin?pg=${i}">${i}</a></li>
										</c:forEach> --%>
										
										<c:if test="${pgc < Count/10 }">

											<li><a href="busenroll.admin?pg=${pgc+1}">Next</a></li>
										</c:if>
									</ul>
								</div>

								</div>

									<div style = "float: right;">
									<!-- <div class="btn btn-success btn-xs" id = "ebtn"><i class="fa fa-check"></i>
                                         			 등록 </div> -->
                                    <div class="btn btn-default btn-xs" id = "ubtn"><i class="fa fa-retweet"></i>
                                         			 수정 </div>
									<div class="btn btn-danger btn-xs" id = "dbtn"><i class="fa fa-trash-o"></i>
                                         			 삭제 </div>
									</div>
					
							</div>
							
							<div id = "enroll">
							
							<!-- 여기에 ajax 내용 삽입됨(enroll.jsp) -->
							</div>	
							
							<div id = "updateenroll">
							<!-- 여기에 ajax 내용 삽입됨(updateenroll.jsp) -->
							</div>
							

							</div>

						</div>



					</div>
				</div>
			</div>
		</div>

	<!-- BEGIN # MODA4L LOGIN -->
	<!-- 비밀번호 모달 :match-pass -->
	<div class="modal fade" id="match-pass" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true"
		style="display: none;">
		<div class="modal-dialog">
			<div class="modal-content">
				<!-- Begin # DIV Form -->
				<div id="div-forms">
					<div class="modal-header" align="center">
						<h3>비밀번호 입력</h3>
					</div>
					<!-- Begin # Login Form -->
					<form id="login-form" method="post">
						<div class="modal-body">
							<div style="text-align: center">
								<label for="m_pw">비밀번호 </label> <input type="password"
									name="m_pw" id="m_pw">
							</div>
						</div>
						<div class="modal-footer">
							<div>
								<input type="button" class="btn btn-dark" value="완료"
									id="passtrue" data-target="myModal">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">닫기</button>
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
	<!-- 수현:삭제모달    -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">
								<i class="fa fa-exclamation-triangle"></i> 차량번호 삭제
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
			tr += "<select class='form-control' id='mname" + num + "' name = 'mname'>";
			tr += "<option>선택</option>";
			tr += "</select>";
			tr += "</td>";
			tr += "</tr>";
			
			$("#tbody").append(tr); 
			
			
			$.ajax({
				url : "getmember.admin",
				success:function(data){
					for(var i = 0 ; i < data.m_id.length ; i++){
						$(mname).append("<option value = " + data.m_id[i] + ">" + data.m_name[i] +  "</option>");
					}
				}
				
			});
			
			$.ajax({
				url : "getgarage.admin",
				success:function(data){
						//console.log(data.gname[0]);
						
						for(var i = 0 ; i < data.gname.length; i++){
							$(gname).append("<option value = " + data.gnum[i] + ">" + data.gname[i] + "</option>");
						}
				}
			});
			
			$(gname).change(function(){
				//console.log($("#g_name").val());
				$.ajax({
					url : "getroute.admin",
					type : "post",
					data:{g_num : $(gname).val().trim()},
					success:function(data){
							$(rnum).empty();
							$(rnum).append("<option>선택</option>");
							for(var i = 0 ; i < data.rnum.length; i++){
								$(rnum).append("<option value = " + data.rnum[i] + ">" + data.rnum[i] + "</option>");
								
							}
					}
					
				});
				
			});
	}
	
	function update(){
		$("#update").submit();
	}

	
	function reg(){
	
		var array = "";
		var vnum = ""
		for(var i = 1 ; i <= num ; i++){
			vnum = "#b_vehiclenum" + i;
			array += $(vnum).val() + ",";
		}
		var a;
		$.ajax({
			url:"alreadyuse.admin",
			data:{b_vehiclenum : array},
			success : function(data){
				$.each(data.list,function(index,sd){
					if(sd == 0){
						$("#target").submit();
						
					}else{
						a = index;
					}
				});
				$.each(data.array,function(index,sd){
					if(a == index){
						//alert(sd + "는 이미 존재하는 차량 번호입니다.");
						swal({
		                    title: "",
		                    text: sd + "는 이미 존재하는 차량 번호입니다.",
		                    type: "info",
		                    closeOnConfirm: true,
		                    showLoaderOnConfirm: true,
		                  },
		                  function(){
		                  });
					}
				});
			}
		});

	}
	$(function(){
		
		var count = 1;
		
		$("#checkall").click(function(){
			if($("#checkall").prop("checked")){
				$("input[name='chklist']").prop("checked",true);
			}else{
				$("input[name='chklist']").prop("checked",false);
			}
		});
		
		$("input[name='chklist']").change(function(){

			 if($('input:checkbox[name="chklist"]:checked').length < $('input:checkbox[name="chklist"]').length){
				 $("#checkall").prop("checked",false);
			 }else{
				 $("#checkall").prop("checked",true);
			 }
		});
 
	$("#dbtn").click(function(){
		for(var i = 1 ; i <= ${Count} ; i++){ //엑박 뜨는거 무시할것
				var checkbox = "#check" + i;
				
				if($(checkbox).is(":checked")){
					console.log($(checkbox).val());
					$("#match-pass").modal("show");	
				}
			}
		}); 
		
		

		
		$("#passtrue").click(function(){
			$.ajax({
				url:"matchpass.admin",
				data:{m_pw : $("#m_pw").val()},
				success : function(data){
					console.log(data.data);
					if(data.data == 'true'){
						
						$("#m_pw").val("");
						$("#match-pass").modal("hide");
						$("#myModal").modal("show");
						 $("#myModalLabel2").empty();
						 $("#myModalLabel2").append("차량 번호<br>");
						 
						for(var i = 1 ; i <= ${Count} ; i++){ //엑박 뜨는거 무시할것
							var checkbox = "#check" + i;
							
							if($(checkbox).is(":checked")){
								console.log($(checkbox).val());	
								 $('#myModalLabel2').append("&nbsp;<span class='blue'>&nbsp;"+$(checkbox).val()+'</span><br>');
							}
						}
						 $('#myModalLabel2').append("삭제 하시겠습니까?");

					}else{
						//alert("비밀번호가 틀렸습니다.");
						swal({
		                    title: "",
		                    text: "비밀번호가 틀렸습니다.",
		                    type: "info",
		                    closeOnConfirm: true,
		                    showLoaderOnConfirm: true,
		                  },
		                  function(){
		                  });
					}
				}
			});
		});
		
		$("#cancelbutton").click(function(){
			 
			for(var i = 1 ; i <= ${Count} ; i++){ //엑박 뜨는거 무시할것
				var checkbox = "#check" + i;
				
				if($(checkbox).is(":checked")){
					$.ajax({
						url:"deleteBus.admin",
						data : {b_vehiclenum : $(checkbox).val()},
						success : function(data){
							window.location.reload();
						}
					});			
				}
			}
		});
		
		
		
		$("#ubtn").click(function(){
			if($("input[name='chklist']:checked").length >= 2){
				//alert("2개 이상을 수정 할 수 없습니다.");
				swal({
                    title: "",
                    text: "2개 이상을 수정 할 수 없습니다.",
                    type: "info",
                    closeOnConfirm: true,
                    showLoaderOnConfirm: true,
                  },
                  function(){
                  });
			}else{
				
				$("#enroll").empty();
				count = 1;
				for(var i = 1 ; i <= ${Count} ; i++){ //엑박 무시할것
					var checkbox = "#check" + i;
					
					if($(checkbox).is(":checked")){
						$.ajax({
							url : "enrollupdate.admin",
							data : {b_vehiclenum : $(checkbox).val().trim()},
							success:function(data){
								$("#updateenroll").empty();
								$("#updateenroll").append(data);
								
								$.ajax({
									url : "getmember2.admin",
									data : {mid : $("#mname_u").val()},
									success:function(data){
										for(var i = 0 ; i < data.m_id.length ; i++){
											$("#mname_u").append("<option value = " + data.m_id[i] + ">" + data.m_name[i] + "</option>");
										}
										
										if($("#mname_u").val() != "(미정)"){	
											$("#mname_u").append("<option value = '(미정)'>(미정)</option>");
										}
									}
									
								});
								
								
								
								$.ajax({
									url : "getgarage2.admin",
									type : "post",
									data : {g_num : $("#g_name_u").val()},
									success : function(data){
									
										for(var i = 0 ; i < data.gname.length; i++){
											$("#g_name_u").append("<option value = " + data.gnum[i] + ">" + data.gname[i] + "</option>");
										}
										
										if($("#g_name_u").val() != "(미정)"){	
											$("#g_name_u").append("<option value = '(미정)'>(미정)</option>");
										}
									}
								});
								
								$("#g_name_u").change(function(){
									$.ajax({
										url : "getroutenum2.admin",
										type : "post",
										data : {g_num : $("#g_name_u").val()},
										success : function(data){
											$("#r_num_u").empty();
											$("#r_num_u").append("<option>선택</option>");
											$("#r_num_u").append("<option value = '(미정)'>(미정)</option>");
											for(var i = 0 ; i < data.rnum.length; i++){
												$("#r_num_u").append("<option value = " + data.rnum[i] + ">" + data.rnum[i] + "</option>");
												
											}
										}
									});
								});
								
							}
						});
					}
					
				}
			}	
		});
		
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
						$("#updateenroll").empty();
						$("#enroll").empty();
						$("#enroll").append(data);
						
						$.ajax({
							url : "getmember.admin",
							success:function(data){
								for(var i = 0 ; i < data.m_id.length ; i++){
									$(mname).append("<option value = " + data.m_id[i] + ">" + data.m_name[i] + "</option>");
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
	
		$("#no").click(function(){
			$.ajax({
				url: "noroute.admin",
				success:function(data){
					$("#updateenroll").empty();
					$("#xbody").empty();
					$("#xbody").append(data);
				}
			});
			
		});
		
		$("#m").click(function(){
			$.ajax({
				url: "mbusinfo.admin",
				success:function(data){
					$("#updateenroll").empty();
					$("#xbody").empty();
					$("#xbody").append(data);
				}
			});
		});
		
		
		$("#n").click(function(){
			$.ajax({
				url: "nbusinfo.admin",
				success:function(data){
					$("#updateenroll").empty();
					$("#xbody").empty();
					$("#xbody").append(data);
				}
			});
		});
		
		$("#w").click(function(){
			$.ajax({
				url: "wbusinfo.admin",
				success:function(data){
					$("#updateenroll").empty();
					$("#xbody").empty();
					$("#xbody").append(data);
				}
			});
		});
		
		$("#g").click(function(){
			$.ajax({
				url: "gbusinfo.admin",
				success:function(data){
					$("#updateenroll").empty();
					$("#xbody").empty();
					$("#xbody").append(data);
				}
			});
		});
	});

	
	</script>
</body>
</html>
