<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
 * @File Name: schedule_managereguloff.jsp
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

<title>기사 관리</title>

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
	margin-top:5%;
	width: 10%;
	padding: 2 3%;
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

select#selectedgaragename, select#selectedroutenumber {
	-webkit-appearance: button;
	-webkit-border-radius: 2px;
	-webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
	-webkit-padding-end: 20px;
	-webkit-padding-start: 2px;
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
	margin: 2px;
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 120px;
	border-radius: 8px;
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
								<small>기사 휴무 배정</small>
							</h3>
						</div>

						
					</div>

					<div class="clearfix"></div>
					
					<div class="row">
						<div class="col-md-12">
							<div class="x_panel">
							
								<div class="x_title">
									<h2>
										기사 휴무 배정 & 확인
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
								<div style="text-align: center">
									<button style="width:100px; height:30px; background-color: #46AAEB; border:0" class="btn btn-default"></button>
									휴무 변경 신청 없음&nbsp;&nbsp;&nbsp;
									<button style="width:100px; height:30px; background-color: #329632; border:0" class="btn btn-default"></button>
									휴무 변경 신청 (1인)&nbsp;&nbsp;&nbsp;
									<button style="width:100px; height:30px; background-color: #FFB432; border:0" class="btn btn-default"></button>
									휴무 변경 신청 (2인)
								</div>
								<hr>
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
			<jsp:include page="/sidebar/footer.jsp"></jsp:include>
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
				var item = "";
				var m_name = "";
				var m_id = "";
				var o_date = "";
				var array = new Array(); //db에 저장된 일정을 담는 배열
				$.each(data.mjrjmdto,function(index,obj){
						if(obj.m_id == obj.m_id_1){ // 변경 요청 == 변경 대상
							if(obj.o_code == obj.o_code_1){ //변경 요청 == 변경 대상 and 요청자 휴무 == 대상자 휴무
								item = {
								title : obj.m_name,
								aftername : obj.m_name_1,
								id : obj.m_id,
								afterid : obj.m_id_1,
								dow : obj.o_code,
								afterdow : obj.o_code_1, //어차피 o_code = o_code_1
								color : "#329632"
								}
							array.push(item);
							}else{ //변경 요청 == 변경 대상 and 요청자 휴무 != 대상자 휴무
							    item = {
								title : obj.m_name,
								aftername : obj.m_name_1,
								id : obj.m_id,
								afterid : obj.m_id_1,
								dow : obj.o_code,
								afterdow : obj.o_code_1, // o_code != o_code_1
								color : "#329632"//red로 바꿔야함
								}
							array.push(item);
							}//else 끝
						}else{ //변경 요청 != 변경 대상
					        item = {
							title : obj.m_name,
							aftername : obj.m_name_1,
							id : obj.m_id,
							afterid : obj.m_id_1,
							dow : obj.o_code,
							afterdow : obj.o_code_1, // o_code != o_code_1
							color : "#FFB432"
							}
							array.push(item);
					        item = {
									title : obj.m_name_1,
									aftername : obj.m_name,
									id : obj.m_id_1,
									afterid : obj.m_id,
									dow : obj.o_code_1,
									afterdow : obj.o_code, // o_code != o_code_1
									color : "#FFB432"
									}
					        array.push(item);
						}//else
					
				});//each
				 $.each(data.mrmbrjdto,function(index,obj1){ //reguloff 전체중에서 신청 중인것 뺀 dto
							 item = {
										title : obj1.m_name,
										id : obj1.m_id,
										dow : obj1.o_code
								}
						array.push(item);
				});//each 
				var eventObject;
				    calendar = $('#calendar').fullCalendar({
					header : {
						left : 'prev,next today',
						center : 'title',
						right : 'month,agendaWeek,agendaDay'
					},
					editable : true,
					eventDrop : function(event, delta, revertFunc, jsEvent, ui, view){
						if(event.color=="#329632" || event.color=="#FFB432"){
							alert(event.title + '님은 현재 휴무 변경 승인 대기 중입니다.');
							revertFunc();
							$('#calendar').fullCalendar('unselect');
						}else{
						var item = {
								m_id : event.id,
								m_name : event.title,
								o_date : event.start.format('dddd').substr(0,3)
						}
						$.ajax({
							url:"modifyingschedule.admin",
							data: item,
							success:function(data){
								var eventObjectr = {
									id : data.m_id,
									title : data.m_name,
									dow : data.o_code	
								};
								$('#calendar').fullCalendar('removeEvents', event.id);
								$('#calendar').fullCalendar('renderEvent', eventObjectr);
								$('#calendar').fullCalendar('unselect');
								alert(event.title+' 님의 일정이 변경 되었습니다.');
							}
						});
						}
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
								var eventObject2={
									id:eventObject.id,
									title:eventObject.title,
									dow:[data.o_code]
								};
								$('#calendar').fullCalendar('removeEvents', eventObject.id);
								$('#calendar').fullCalendar('renderEvent', eventObject2);
								$('#calendar').fullCalendar('unselect');
								$(dragitem).remove();
								alert(event.title+' 님의 일정을 설정하였습니다.');
							}
						});
						
					}
				}); //calendar
				
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
				});//each
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

				}); //each
			}//success
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