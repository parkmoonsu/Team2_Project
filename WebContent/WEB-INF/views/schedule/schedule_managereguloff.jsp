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
<style>


#wrap {
	width: 100%;
	margin: 0 auto;
}
#external-events hr{
	color:red;
	border:thin;

}
#external-events {
	margin-left:65%;
	width: 10%;
	padding: 0 1%;
	border: 1% solid #ccc;
	background: #eee;
	text-align: left;
	position: fixed; 
	font-size:100%;
    top: 30%; 
    text-align:center;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

#external-events .fc-event {
	margin: 10px 0;
	cursor: pointer;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}
#external-events select{
	width : 100%;
}
#external-events p input {
	margin: 0;
	vertical-align: middle;
}

#calendar {
	float: left;
	width: 80%;
}
</style>

</head>
<script>


</script>
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

						<div class="title_right">
							<div
								class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
								<div class="input-group">
									<input type="text" class="form-control"
										placeholder="Search for..."> <input type="hidden"
										id="hidden" value="${LoginUser}"> <span
										class="input-group-btn">
										<button class="btn btn-default" type="button">Go!</button>
									</span>
								</div>
							</div>
						</div>
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

									<div id='wrap'>
										
										<div id='external-events'>
											<div>
												<select id="selectedgaragename">
													<option value="0">차고지선택</option>
													<c:forEach var="gdtolist" items="${gdto }"
														varStatus="status">
														<option value="${gdtolist.g_num }">${gdtolist.g_name }</option>
													</c:forEach>
												</select>
											</div>
											<div id="showroutename">
											<select id="selectedroutenumber">
												<option value="0">노선선택</option>
											</select>
											</div>
											<hr>
											<h5>휴무 미등록 기사</h5>
											<hr>
											<div id="draggablemember"></div>
										</div>
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

	<!-- calendar modal -->
	<!-- /calendar modal -->
	<script>

	$('#selectedroutenumber').change(function(){
		$('#calendar2').empty();
		$('#calendar2').append("<div id='calendar'></div>");
		//window.location.reload(true);
		console.log('선택한 루트: '+$('#selectedroutenumber').val());
		var param = $('#selectedroutenumber').val();
		var view = "";
		
		$.ajax({
			url:"getselectedmember.admin",
			data:{"r_num":param},
			success:function(data){

				var m_name = "";
				var m_id = "";
				var array = new Array(); //db에 저장된 일정을 담는 배열
				
				$.each(data.mrmbrjdto,function(index,obj){
					console.log("휴무있는m_id: "+obj.m_id);
					console.log("휴무있는m_name: "+obj.m_name);
					console.log("휴무있는o_date: "+obj.o_date);
					console.log("휴무있는o_code: "+obj.o_code);
					var item = {
							title : obj.m_name,
							id : obj.m_id,
							dow : obj.o_code
					};
					array.push(item);
				}); 
				var eventObject;
				var calendar = $('#calendar').fullCalendar({

					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month,agendaWeek,agendaDay'
					},
					editable : true,
					eventDrop : function(event,dayDelta,minuteDelta,allDay,revertFunc){
						console.log('변경자'+event.title);
						console.log('시작일'+event.start.format('YYYY-MM-DD'));
						console.log('변경자 id:'+event.id);
						var item = {
								m_id : event.id,
								m_name : event.title,
								o_date : event.start.format('dddd').substr(0,3)
						}
						$.ajax({
							url:"modifyingschedule.admin",
							data: item,
							success:function(data){
								console.log(data);
								
							}
						});
					},
					eventDurationEditable : false,
					droppable : true, // this allows things to be dropped onto the calendar
					events : array,
					monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
					monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
					dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
					dayNamesShort: ["일","월","화 ","수 ","목 ","금 ","토 "],
					titleFormat: "YYYY년 MM월",
					eventRender : function(event, element) {
						//console.log("description"+event.description);
						m_name = event.title;
						m_id = event.id;
						eventObject=event;
					},
					drop : function(date, jsEvent) {
						console.log(date.format('dddd').substr(0,3));
						var o_date = date.format('dddd').substr(0,3);
						var dragitem = $(this);
						
						$.ajax({
							url : "makingschedule.admin",
							data : 
							{
								"m_name":m_name,
								"m_id":m_id,
								"o_date":o_date
							},
							success : function(data){
								console.log("야야야야야ㅑㅇ야ㅑ"+data);
								console.log(eventObject);
								var eventObject2={
									id:eventObject.id,
									title:eventObject.title,
									dow:[data.o_code]
								};
								$('#calendar').fullCalendar('removeEvents', eventObject.id);
								$('#calendar').fullCalendar('renderEvent', eventObject2);
								$('#calendar').fullCalendar('unselect');
								$(dragitem).remove();
							}
						});
						
					}
				});
				
				$.each(data.mjrdto,function(index,value){
					console.log("휴무없는m_id: "+value.m_id);
					console.log("휴무없는m_name: "+value.m_name);
					view += "<div class='fc-event'>";
					view += value.m_name;
					view += "<input type='hidden' value='";
					view += value.m_id;
					view += "' id='";
					view += value.m_id;
					view += "'>";
					view += "</div>";
				});
				$('#draggablemember').empty();
				$('#draggablemember').append(view);
				
				$('#external-events .fc-event').each(function() {
					
					// store data so the calendar knows to render an event upon drop
					
					$(this).data('event', {
						title: $.trim($(this).text()), // use the element's text as the event title
						id: $(this).find('input').val(),
						stick: true // maintain when user navigates (see docs on the renderEvent method)
					});
					
					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex: 999,
						revert: true,      // will cause the event to go back to its
						revertDuration: 0  //  original position after the drag
					});

				});
			}
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