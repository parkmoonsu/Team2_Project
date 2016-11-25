<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "se" uri = "http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<se:authentication property="name" var = "LoginUser"/>       													
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
	var id="${LoginUser}";
	$("p").hide();
	 $("#search").hide(); 
		$("#go").click(function(){
			console.log("ihiuhiu")
			alert("떠떠떠떠");
		    $.ajax({
			url:"getoffwork.member",
			data: {
				m_id:id
			},
			type:"post",
			success:function(data){
				console.log(data.dto.c_start);				
				$("#show").html(id+"님의 퇴근시간은 "+data.dto.c_end+"입니다."+"<br>"+
								id+"님의 퇴근상태는 "+ data.dto.ce_stat+"입니다."); 
				//$("#search").show();
			 	$("p").show();
				$("#search").show() 
			}
			});   
		});
		
	}); 
	function click() {
		console.log('?');
		//location.href='commute/comsearch.jsp';
	}
	
</script>
</head>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<jsp:include page="/sidebar/sidebar2.jsp"></jsp:include>
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
									<h3>퇴근</h3>
								</div>
							</div>
							<div class="clearfix" style="margin-top:20px;">
								<div class="container" >
								<div class="col-sm-5"></div>
									<input type="button" id="go" value="퇴근하기" onclick="go()" class="btn btn-primary"/>

									<div class="row" style="margin-top:20px">
										<div class="col-sm-1"></div>
										<div class="col-sm-10">
											<!-- <div id="show"></div> -->
											 <div class="panel panel-info">
												<!-- <div class="panel-heading">
													
												</div> -->
												<div class="panel-body" style="order-radius: 4em">
													<div class="row">
														<div class="col-sm-1" >
															<div class="row"></div>
														</div>
														<div class="col-sm-10">
														<form>
															<div class="my-box" id="show">
																 <p style="text-align:center; font-size:1.5em;">
																${LoginUser}님의 퇴근시간은 ${m_id.dto.c_end}입니다. <br><br>
																${LoginUser}님의 퇴근상태는 ${dto.ce_stat}입니다.</p><br><br>
																<input id="search" type="button" value="출/퇴근 조회하기" onClick="location.href='comsearch.member?m_id=${LoginUser}'" class="btn btn-success">
 															</div>
 														</form>
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
		<div class="pull-right">
			Gentelella - Bootstrap Admin Template by <a
				href="https://colorlib.com">Colorlib</a>
		</div>
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
	
	
	
</body>
</html>