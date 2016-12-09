
<!-- 
	@FileName : busenroll.jsp
	@Project	: KosBus
	@Date	: 2016. 12.07
	@Author	: 박문수
	@Discription : (관리자)버스 등록 페이지 View단
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
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">

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
			<br> <br> <br>
			<!-- page content -->
			<div class="right_col" role="main">

				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								<small>버스 등록</small>
							</h3>
						</div>
					</div>
					<div class="clearfix"></div>
					<div class="row">
						<div class="col-md-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										버스 등록
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											</li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>
								<div class="x_panel">
									<div class="x_content">
										<form action = "busreg2.admin" method = "post" class="form-horizontal form-label-left input_mask" id = "regform">
											<div class="form-group has-feedback">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="b_vehiclenum">
													버스 번호
												 </label>
												<div class = "col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left" id="b_vehiclenum" name = "b_vehiclenum"> 
													<span class="fa fa-bus form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											<div class="form-group has-feedback">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="b_sdate">
													구입 시기
												 </label>
												<div class = "col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left" id="b_sdate" name = "b_sdate"> 
													<span class="fa fa-calendar form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											<div class="form-group has-feedback">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="b_sprice">
													구매 가격
												 </label>
												<div class = "col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left" id="b_sprice" name = "b_sprice"> 
													<span class="fa fa-krw form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											<div class="form-group has-feedback">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="b_manuf">
													제조사
												 </label>
												<div class = "col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left" id="b_manuf" name = "b_manuf"> 
													<span class="fa fa-building-o form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											<div class="form-group has-feedback">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="b_caryear">
													연식
												 </label>
												<div class = "col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left" id="b_caryear" name = "b_caryear"> 
													<span class="fa fa-dashboard form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											<div class="form-group has-feedback">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="b_model">
													모델명
												 </label>
												<div class = "col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left" id="b_model" name = "b_model"> 
													<span class="fa fa-font form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											<div class="form-group has-feedback">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="b_effic">
													연비
												 </label>
												<div class = "col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left" id="b_effic" name = "b_effic"> 
													<span class="fa fa-database form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											<div class="form-group has-feedback">
												<label class="control-label col-md-3 col-sm-3 col-xs-12" for="b_pcount">
													탑승 가능 인원
												 </label>
												<div class = "col-md-6 col-sm-6 col-xs-12">
													<input type="text" class="form-control has-feedback-left" id="b_pcount" name = "b_pcount"> 
													<span class="fa fa-group form-control-feedback left" aria-hidden="true"></span>
												</div>
											</div>
											
											<div class = "col-md-6 col-sm-6">
											</div>
											<div class="col-sm-3 col-xs-12" align="right">
												<div class = "btn btn-success btn-xs" id="reg">&nbsp;<i class="fa fa-check"></i>&nbsp;&nbsp;등록</div>
												
												<input type = "reset" class = "btn btn-default btn-xs" value = "다시쓰기">
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
		<!-- footer content -->
		<footer>
			<jsp:include page="/sidebar/footer.jsp"></jsp:include>
			<div class="clearfix"></div>
		</footer>
		<!-- /footer content -->




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
		<script
			src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>	
			
	<script type="text/javascript">
		$(function(){
			$("#reg").click(function(){
				

				if($("#b_vehiclenum").val() == ''){
					$("#b_vehiclenum").focus();
					//swal("버스 번호를 입력하세요.");
					swal({
	                    title: "",
	                    text: "버스 번호를 입력하세요.",
	                    type: "info",
	                    closeOnConfirm: true,
	                    showLoaderOnConfirm: true,
	                  },
	                  function(){
	                    /* setTimeout(function(){
	                      swal("Ajax request finished!");
	                    }, 2000); */
	                  });
					
					return false;
				}else if($("#b_sdate").val() == ''){
					$("#b_sdate").focus();
					
					swal({
	                    title: "",
	                    text: "구입 시기를 입력하세요.",
	                    type: "info",
	                    closeOnConfirm: true,
	                    showLoaderOnConfirm: true,
	                  },
	                  function(){
	                    
	                  });
					
					return false;
				}else if($("#b_sprice").val() == ''){
					$("#b_sprice").focus();
					swal({
	                    title: "",
	                    text: "구매 가격을 입력하세요.",
	                    type: "info",
	                    closeOnConfirm: true,
	                    showLoaderOnConfirm: true,
	                  },
	                  function(){
	                    
	                  });
					return false;
				}else if($("#b_manuf").val() == ''){
					$("#b_manuf").focus();
				
					swal({
	                    title: "",
	                    text: "제조사를 입력하세요.",
	                    type: "info",
	                    closeOnConfirm: true,
	                    showLoaderOnConfirm: true,
	                  },
	                  function(){
	                    
	                  });
					
					return false;
				}else if($("#b_caryear").val() ==''){
					$("#b_caryear").focus();
				
					swal({
	                    title: "",
	                    text: "연식을 입력하세요.",
	                    type: "info",
	                    closeOnConfirm: true,
	                    showLoaderOnConfirm: true,
	                  },
	                  function(){
	                    
	                  });
					
					return false;
				}else if($("#b_model").val() ==''){
					$("#b_model").focus();
					
					swal({
	                    title: "",
	                    text: "모델명을 입력하세요.",
	                    type: "info",
	                    closeOnConfirm: true,
	                    showLoaderOnConfirm: true,
	                  },
	                  function(){
	                    
	                  });
					return false;
				}else if($("#b_effic").val() == ''){
					$("#b_effic").focus();
					
					swal({
	                    title: "",
	                    text: "연비를 입력하세요.",
	                    type: "info",
	                    closeOnConfirm: true,
	                    showLoaderOnConfirm: true,
	                  },
	                  function(){
	                    
	                  });
					return false;
				}else if($("#b_pcount").val() == ''){
					$("#b_pcount").focus();
					
					swal({
	                    title: "",
	                    text: "탑승 가능 인원을 입력하세요.",
	                    type: "info",
	                    closeOnConfirm: true,
	                    showLoaderOnConfirm: true,
	                  },
	                  function(){
	                    
	                  });
					return false;
				}else{
					$.ajax({
						url:"alreadyuse.admin",
						data : {b_vehiclenum : $("#b_vehiclenum").val().trim()},
						success : function(data){
							console.log(data.list[0]);
							if(data.list[0] == 1){
								$("#b_vehiclenum").focus();
							
								swal({
				                    title: "",
				                    text: "버스번호가 이미 존재합니다.",
				                    type: "info",
				                    closeOnConfirm: true,
				                    showLoaderOnConfirm: true,
				                  },
				                  function(){
				                    
				                  });
							}else{
								$("#regform").submit();
							}
						}
					});
				}
			});
		});
	
		$.datepicker.regional['ko'] = {
		        closeText : '닫기',
		        prevText : '이전달',
		        nextText : '다음달',
		        currentText : '오늘',
		        monthNames : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        monthNamesShort : ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		        dayNames : ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesShort : ['일', '월', '화', '수', '목', '금', '토'],
		        dayNamesMin : ['일', '월', '화', '수', '목', '금', '토'],
		        weekHeader : 'Wk',
		        dateFormat : 'yy-mm-dd',
		        firstDay : 0,
		        isRTL : false,
		        showMonthAfterYear : true,
		        yearSuffix : '년'
		};
		$.datepicker.setDefaults($.datepicker.regional['ko']);
		
		
		$('#b_sdate').datepicker( {
		     changeMonth: true,
		     changeYear: true,
		     dateFormat: 'yy-mm-dd',
		     showAnim : "clip"
		});
		
	</script>
</body>
</html>
