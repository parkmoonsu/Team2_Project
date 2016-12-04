m9<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
 * @File Name: calendar_reguloff.jsp
 * @Author: 김수현
 * @Data: 2016. 12. 01
 * @Desc: 일정관리(실행될스케줄) -  풀캘린더 ui
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

<title>최종 예상 스케줄</title>

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

#external-events hr {
	color: red;
	border: thin;
}

#external-events {
	margin-left: 65%;
	width: 10%;
	padding: 0 1%;
	border: 1% solid #ccc;
	background: #eee;
	text-align: left;
	position: fixed;
	font-size: 100%;
	top: 30%;
	text-align: center;
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

#external-events select {
	width: 100%;
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
								Calendar<i class="fa fa-calendar"></i>
							</h3>
						</div>

					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12">
							<div class="x_panel">
								<div class="x_title">
									<h2>
										<select id="selectedrnum">
											<option value="0">노선선택</option>
											<c:forEach var="rlist" items="${routelist}">
												<option value="${rlist.r_num}">${rlist.r_num}</option>
											</c:forEach>
										</select>
										<!--  <small>Sessions</small> -->

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
	var array = new Array();
		$(function() {
			//rlist.r_num
			
			$('#selectedrnum').change(function() {

				console.log('선택한 노선번호(r_num): ' + $('#selectedrnum').val());
				var param = $('#selectedrnum').val();
				var view = "";
				$.ajax({
					url : "lastpredictschedule.admin",
					type : "post",
					data : {
						"r_num" : param
					},
					success : function(data) {
									
						var m_name = "";
						var m_id = "";
						//data.rdto.r_start 첫차
						//data.rdto.r_end 막차
						//data.rdto.r_peroid 배차
						console.log(data);
						$.each(data.mjrolist, function(index, obj) {
							var item = {
								title : obj.m_name,
								id : obj.m_id,
								//start : obj1.r_start,
								dow :obj.o_code
							};
							array.push(item);
						});
					
					}
				});
			});//change
		});//ready
		$(document).ajaxStop(function(){
			$('#calendar2').empty();
			$('#calendar2').append('<div id="calendar"></div>');
			$('#calendar').fullCalendar({
				header : {
					left : 'prev,next today',
					center : 'title',
					right : 'month,agendaWeek,agendaDay'
				},

				slotDuration : '00:10:00',
				buttonIcons : false, // show the prev/next text
				weekNumbers : true,
				navLinks : true, // can click day/week names to navigate views
				editable : true,
				eventLimit : true, // allow "more" link when too many events
				events : array

			/* [
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
			   
			      title: '김수현',
			      start: '17:10:00',
			      dow : [0]
			   },
			   {
			      
			      title: '김용현',
			      start: '2016-09-16T16:10:00'
			   },
			   {
			      
			      title: '박문수',
			      start: '2016-09-16T16:20:00'
			   },
			   {
			      
			      title: '조한솔',
			      start: '2016-09-16T16:30:00'
			   },
			   {
			      
			      title: '김지현',
			      start: '2016-09-16T16:40:00'
			   },
			   {
			      
			      title: '길한종',
			      start: '2016-09-16T16:50:00'
			   },
			   {
			      
			      title: '강민수',
			      start: '2016-09-16T17:00:00'
			   },
			   
			   {
			      title: 'Conference',
			      start: '2016-09-11',
			      end: '2016-09-13'
			   },
			   {
			      title: 'Meeting',
			      start: '2016-09-12T10:30:00',
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
			]   */
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