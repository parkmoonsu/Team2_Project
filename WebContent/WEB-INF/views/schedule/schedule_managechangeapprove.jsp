<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
 * @File Name: calendar_reguloff.jsp
 * @Author: 길한종
 * @Data: 2016. 11. 22
 * @Desc: 일정관리(정기휴무) -  풀캘린더 ui
-->
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.disabled {
	background-color: black;
}
</style>
<se:authentication property="name" var="LoginUser" />
<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Gentellela Alela! |</title>

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
<!-- FullCalendar -->
<link
	href="${pageContext.request.contextPath}/vendors/fullcalendar/dist/fullcalendar.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/vendors/fullcalendar/dist/fullcalendar.print.css"
	rel="stylesheet" media="print">

<!-- Custom styling plus plugins -->
<link href="${pageContext.request.contextPath}/build/css/custom.min.css"
	rel="stylesheet">
</head>
<script>
$(document).ready(function() {
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,basicWeek,basicDay'
		},
		defaultDate: '2016-09-12',
		navLinks: true, // can click day/week names to navigate views
		editable: true,
		eventLimit: true, // allow "more" link when too many events
		events: [
			{
				title: 'All Day Event',
				start: '2016-09-01'
			},
			{
				title: 'Long Event',
				start: '2016-09-07',
				end: '2016-09-10'
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: '2016-09-09T16:00:00'
			},
			{
				id: 999,
				title: 'Repeating Event',
				start: '2016-09-16T16:00:00'
			},
			{
				title: 'Conference',
				start: '2016-09-11',
				end: '2016-09-13'
			},
			{
				title: 'Meeting',
				start: '2016-09-12T10:30:00',
				end: '2016-09-12T12:30:00'
			},
			{
				title: 'Lunch',
				start: '2016-09-12T12:00:00'
			},
			{
				title: 'Meeting',
				start: '2016-09-12T14:30:00'
			},
			{
				title: 'Happy Hour',
				start: '2016-09-12T17:30:00'
			},
			{
				title: 'Dinner',
				start: '2016-09-12T20:00:00'
			},
			{
				title: 'Birthday Party',
				start: '2016-09-13T07:00:00'
			},
			{
				title: 'Click for Google',
				url: 'http://google.com/',
				start: '2016-09-28'
			}
		]
	});
	
});

</script>
<c:set var="total" value="${total }"/>
<c:set var="refuse" value="${refuse }"/>
<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<jsp:include page="/sidebar/sidebar.jsp"></jsp:include>
			</div>

			<!--상단 menu -->
			<div class="top_nav">
				<jsp:include page="/sidebar/menuHeader.jsp"></jsp:include>
			</div>

			<!-- page content -->
			<div class="right_col" role="main">

				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								Calendar <small>Click to add/edit events</small>
							</h3>
						</div>

						<div class="title_right"></div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12">
							<div class="x_panel">

								<div class="x_title">
									<h2>
										Calendar Events <small>Sessions</small>
									</h2>
									<ul class="nav navbar-right panel_toolbox">
										<li><a class="collapse-link"><i
												class="fa fa-chevron-up"></i></a></li>
										<li class="dropdown"><a href="#" class="dropdown-toggle"
											data-toggle="dropdown" role="button" aria-expanded="false"><i
												class="fa fa-wrench"></i></a>
											<ul class="dropdown-menu" role="menu">
												<li><a href="#">Settings 1</a></li>
												<li><a href="#">Settings 2</a></li>
											</ul></li>
										<li><a class="close-link"><i class="fa fa-close"></i></a>
										</li>
									</ul>
									<div class="clearfix"></div>
								</div>

								<div class="x_content">
									<ul class="stats-overview">
										<li >
										<span class="name"> 변경 요청 </span> 
										<span class="value text-success"> ${total }건 </span>
										</li>
										<li >
										<span class="name"> 변경 거절 </span> 
										<span class="value text-danger"> ${refuse }건 </span>
										</li>
										<li >
										<c:forEach var="mrordto" items="${mrordto }">
										<div style="float:left; margin-left:3%">
											<button id="${mrordto.r_num }" class="btn btn-round btn-info" onclick="showCalInfo('${mrordto.r_num }');">
											${mrordto.m_name }</button>
										</div>
										</c:forEach>	
										</li>
									</ul>

									<div id='wrap'>
										<div id='calendar2'>
											<div id='calendar'></div>
										</div>
										<div style='clear: both'></div>
									</div>
								</div>
							</div>
						</div>
					</div>
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
	</div>
	
	<script>
	function showCalInfo(r_num){
		alert(r_num);
		$.ajax({
			url:"gethistorycal.admin",
			data:{"r_num":r_num},
			type:"post",
			success:function(data){
				var array = new Array();
				var array1 = new Array();
				var item;
				var color = ["green", "black", "cyan", "purple","red","orange","yellow","silver"];
				$.each(data.mrmbrdto,function(index,obj){ //정규 휴무 전체
					$.each(data.mbrdto,function(index1,obj1){ //변경 신청자
						
						if(obj.m_id==obj1.m_id){
							if(obj1.m_id != obj1.m_id_1){
							array1.push(obj1.m_id);
							array1.push(obj1.m_id_1);
							item = {
									id : obj1.m_id,
									title : obj1.m_name,
									dow : obj1.o_code,
									afterdow : obj1.o_code_1,
									color : color[index]
							}
							array.push(item);
							item = {
									id : obj1.m_id_1,
									title : obj1.m_name_1,
									dow : obj1.o_code_1,
									afterdow : obj1.o_code,
									color : color[index]
							}
							array.push(item);
							}else{
								array1.push(obj1.m_id);
								item = {
										id : obj1.m_id,
										title : obj1.m_name,
										dow : obj1.o_code,
										afterdow : obj1.o_code_1,
										color : color[index]
								}
								array.push(item);
							}
						}//if
					});//2each
				});//1each
				
				for(var i=0;i<array1.length;i++){
					console.log(i+"번째 값"+array1[i]);
				}
				var count = 0;
				$.each(data.mrmbrdto,function(index,obj){
					console.log(obj.m_name + "/" + obj.m_id);
					for(var i=0;i<array1.length;i++){
						if(obj.m_id == array1[i]){
							count++;
						};
					};
					if(count>0){
						count = 0;
					}else{
						item = {
							id : obj.m_id,
							title : obj.m_name,
							dow : obj.o_code,
							afterdow : null,
							resourceEditable: false
						}
						array.push(item);
					}
				});
				$('#calendar2').empty();
				$('#calendar2').append("<div id='calendar'></div>");
				$('#calendar').fullCalendar({
					header: {
						left: 'prev,next today',
						center: 'title',
						right: 'month,basicWeek,basicDay'
					},
					navLinks: true, // can click day/week names to navigate views
					editable: true,
					eventLimit: true, // allow "more" link when too many events
					events: array,
					eventDrop : function(event, delta, revertFunc, jsEvent) {
						alert(event.afterdow);
						if(event.afterdow == null){
							alert('변경 요청 데이터만 처리 할 수 있습니다.');
							revertFunc();
						}
					},
					eventClick : function(calEvent, jsEvent, view) {
						if(calEvent.afterdow == calEvent.dow){
							alert(calEvent.title+'님은 휴무 신규 등록자입니다.'+calEvent.id+calEvent.afterdow);
							//reguloff, reguloffr
							$.ajax({
								url:"approvefirstregister.admin",
								data:{"m_id":calEvent.id,"o_code":calEvent.afterdow},
								success:function(data){
									
								}
							});
						}
					}
				});
			}
		});
	}
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
	<!-- FullCalendar -->
	<script
		src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/fullcalendar/dist/fullcalendar.min.js"></script>

	<script
		src="${pageContext.request.contextPath}/vendors/fullcalendar/dist/jquery-ui.min.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>

	<!-- FullCalendar -->
	<script
		src="${pageContext.request.contextPath }/js/schedule_managereguloff.js"></script>
</body>
</html>