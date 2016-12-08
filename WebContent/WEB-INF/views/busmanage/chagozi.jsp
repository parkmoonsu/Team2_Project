<!-- 
   @FileName : chagozi.jsp
   @Project   : KosBus
   @Date   : 2016. 11.26
   @Author   : 김ㅇㅇ현, 조한솔
   @Discription : (관리자)차고지별 버스 현황 View단
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

<title>버스 관리</title>

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
<script>
   $(function() {
      $('#chagozi').change(function() {            
         console.log("확인한다 " + $('#chagozi').val());
         var param = $('#chagozi').val();
         var page = "${pgs}";
         $.ajax({
            url : "selectchagozi.admin",
            data : {"g_name" : param,
                  pg : page},
            success : function(data) {
               $('#tabelinfo').empty();   
               $('#tabelinfo').append(data);               
            }
         });
         
      });
      
   });
      function smodal(b_vehiclenum){
    	  $('#modalbody').empty();
         console.log(b_vehiclenum);
         var i = "";
         $.ajax({
            url:"busstatsearch.admin",
            type:"post",
            data:{
               "b_vehiclenum" :b_vehiclenum
            },
            success:function(data){
                $.each(data.list,function(index,obj){
                   i+="<tr>";
                   i+="<td>"+obj.r+"</td>";
                   i+="<td>"+obj.r_num+"</td>";
                   i+="<td>"+obj.rep_name+"</td>";
                   i+="<td>"+obj.rd_detail+"</td>";
                   i+="<td>"+obj.rd_cost+"</td>";
                   i+="<td>"+obj.rd_date+"</td>";
                   i+="</tr>";
                   
                });   
                $('#modalbody').append(i);
                $('#repairmodal').modal('show');
             }

         });
      }
</script>
<style>
table, th {
	text-align: center
}

select#chagozi {
	-webkit-appearance: button;
	-webkit-border-radius: 2px;
	-webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
	/* -webkit-padding-end: 20px;
	-webkit-padding-start: 2px; */
	-webkit-user-select: none;
	background-image: url(http://i62.tinypic.com/15xvbd5.png),
		-webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
	background-position: 97% center;
	background-repeat: no-repeat;
	border: 1px solid #AAA;
	color: #555;
	font-size: inherit;
	overflow: hidden;
	padding: 5px 5px;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 150px;
	margin:10px;
	margin-bottom:20px;
	border-radius: 8px;
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
				<!-- top tiles -->
				<div class="row tile_count" style="text-align: left"></div>
				<!-- /top tiles -->
				<div class="">
					<div class="page-title row">
						<div class="title_left">
							<h3>
								<small>차고지별 버스현황</small>
							</h3>
						</div>
					</div>
					
					<br>
					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-xs-12">
							<div class="x_panel">
					<div style="text-align: right">
						<select id="chagozi">
							<option>차고지 선택</option>

						</select>
					</div>
								<div class="x_content" id="tabelinfo">
									<!-- start project list -->
									<table class="table table-hover projects" id="bustable">
										<thead>
											<tr>
												<th style="width:90px">구분</th>
												<th style="width:145px">버스번호</th>
												<th style="width:150px">차량번호</th>
												<th style="width:130px">기사</th>
												<th style="width:180px">등록</th>
												<th style="width:160px">수리조회</th>

											</tr>
										</thead>
										<tbody id="tbody">
											<c:set value="${slist}" var="d" />

											<c:forEach var="i" items="${d}">
												<tr>
													<td style="width:90px">${i.r}</td>
													<td style="width:145px">${i.b_vehiclenum}</td>
													<td style="width:150px">${i.r_num}</td>
													<td style="width:130px">${i.m_name}</td>
													<td style="width:180px">${i.g_name}</td>
													<td style="width:160px">
														<div class="btn btn-success btn-xs" style="color: white"
															onClick="smodal('${i.b_vehiclenum}');">
															<i class="fa fa-search"></i> &nbsp;조회
														</div>
													</td>

												</tr>
											</c:forEach>
										</tbody>
									</table>

									<!-- end project list -->

									<!-- 요기서부터 페이징처리 -->
									<c:set var="count" value="${count}" />
									<c:set var="pgc" value="${pgs}" />
									<c:set var="pagecount" value="${pagecount}" />

									<div style="text-align: center">
										<ul class="pagination">
											<c:if test="${pgc > 1}">
												<li><a href="chagozi.admin?pg=${pgc-1}">Previous</a></li>
											</c:if>

											<c:forEach begin="1" end="${pagecount}" var="i" step="5">
												<c:forEach begin="${i}" end="${i+4}" step="1" var="x">
													<c:if test="${x <= pagecount}">
														<c:choose>
															<c:when test="${pgc == x}">
																<li><a class="active" href="#">${x}</a></li>
															</c:when>
															<c:when test="${pgc > i-1 && pgc < i+5 }">
																<li><a href="chagozi.admin?&pg=${x}">${x}</a></li>
															</c:when>
															<c:when test="${x == i+5}">
																<c:forEach begin="${x}" end="${x+4}" step="1" var="y">
																	<li><a href="chagozi.admin?&pg=${y}">${y}</a></li>
																</c:forEach>
															</c:when>
														</c:choose>
													</c:if>

												</c:forEach>
											</c:forEach>

											<c:if test="${pgc < count/10 }">
												<li><a href="chagozi.admin?pg=${pgc+1}">Next</a></li>
											</c:if>
										</ul>

									</div>
								</div>
							</div>

							<div id="enroll">

								<!-- 여기에 ajax 내용 삽입됨(enroll.jsp) -->
							</div>

						</div>



					</div>
				</div>
			</div>
		</div>

		<!-- 수리내역모달    -->
		<div class="modal fade" id="repairmodal" role="dialog">
			<div class="modal-dialog modal-md">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">
							<i class="fa fa-cogs"></i>&nbsp;수리내역
						</h4>
					</div>
					<div class="modal-body" aria-labelledby="myModalLabel"
						id="myModalLabel">

						<table class="table table-hover projects" id="bustable">
							<thead>
								<tr>
									<th>구분</th>
									<th>노선번호</th>
									<th>수리명</th>
									<th>수리내역</th>
									<th>수리비용</th>
									<th>수리날짜</th>

								</tr>
							</thead>

							<tbody id="modalbody">

							</tbody>

						</table>

					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
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
						<h4 class="modal-title" id="resrecordtitle"></h4>
					</div>
					<div class="modal-body" aria-labelledby="myModalLabel"
						id="resrecordtable"></div>
				</div>
			</div>
		</div>



		<!-- footer content -->
		<footer>
			<jsp:include page="/sidebar/footer.jsp" />
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
                  $(mname).append("<option value = " + data.m_id[i] + ">" + data.m_name[i] + "("+data.m_id[i] +")" + "</option>");
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
   
   $(function(){
      $.ajax({
         url : "getgarage.admin",
         success : function(data){
            for(var i = 0 ; i < data.gname.length ; i++){
               $("#chagozi").append("<option>" + data.gname[i] + "</option>");
            
            }
         }
      });
      var count = 1;
      
      //console.log(num);

      $("#reg").click(function(){
         $("#reg").submit();
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
   
   </script>
</body>
</html>