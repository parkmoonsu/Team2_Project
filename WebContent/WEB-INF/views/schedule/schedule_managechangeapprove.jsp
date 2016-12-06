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
			
			<!-- 변경 요청자 != 변경 대상자 modal 수정 승인 모달 -->
			<div class="modal fade" id="approvebtw" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">
								<i class="fa fa-exclamation-triangle"></i> 차량번호 삭제
							</h4>
						</div>
						<div class="modal-body" aria-labelledby="myModalLabel"
							id="approvebtwcon">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>변경 요청자</th>
										<th>변경 대상자</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td id="1"></td>
										<td id="2"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<input type="hidden" id="m_id" name="m_id"> <input
								type="hidden" id="o_code" name="o_code"> <input
								type="hidden" id="m_id_1" name="m_id_1"> <input
								type="hidden" id="o_code_1" name="o_code_1">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="approvebtn">변경</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="refusebtn">거절</button>
						</div>
					</div>
				</div>
			</div>
			<!-- modal 수정 승인 모달 끝 -->
			
			<!-- 변경 요청자 == 변경 대상자 modal 수정 모달 시작 -->
			<div class="modal fade" id="approverefusebtw" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">
								<i class="fa fa-exclamation-triangle"></i> 
							</h4>
						</div>
						<div class="modal-body" aria-labelledby="myModalLabel"
							id="approverefusebtwcon">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>변경 요청자</th>
										<th>기존 휴무</th>
										<th>변경 휴무</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td id="3"></td>
										<td id="4"></td>
										<td id="5"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="modal-footer">
							<input type="hidden" id="sm_id"> <input
								type="hidden" id="so_code"> <input
								type="hidden" id="sm_id_1"> <input
								type="hidden" id="so_code_1">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="approvesamebtn">변경</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="refusesamebtn">거절</button>
						</div>
					</div>
				</div>
			</div>
			<!-- modal 수정 거절 모달 시작 -->
			
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
	var array = new Array();
	var dropObject;
	var calEventObject;
	var eventObjecte;
	function showCalInfo(r_num){
		array = []; //아무 동작도 처리 하지 않고 눌렀을때 array에 들어있던 값을 비워야한다.
		alert(r_num);
		$.ajax({
			url:"gethistorycal.admin",
			data:{"r_num":r_num},
			type:"post",
			success:function(data){
				var array1 = new Array();
				var item;
				var color = ["green", "black", "red", "purple","orange","yellow","silver","skyblue","gold"];
				$.each(data.mrmbrdto,function(index,obj){ //정규 휴무 같은 노선
					$.each(data.mbrdto,function(index1,obj1){ //변경 신청자 reguloff temp ='t'
					    console.log(obj.m_id + "/" + obj1.m_id + "/" + obj1.m_id_1);
						if(obj.m_id==obj1.m_id){ //변경 신청자
							if(obj1.m_id != obj1.m_id_1){//변경 신청자, 변경 대상자
							array1.push(obj1.m_id);
							array1.push(obj1.m_id_1);
							item = {
									id : obj1.m_id,
									afterid : obj1.m_id_1,
									aftername : obj1.m_name_1,
									title : obj1.m_name,
									dow : obj1.o_code,
									afterdow : obj1.o_code_1,
									color : color[index]
							}
							array.push(item);
							item = {
									id : obj1.m_id_1,
									afterid : obj1.m_id,
									aftername : obj1.m_name,
									title : obj1.m_name_1,
									dow : obj1.o_code_1,
									afterdow : obj1.o_code,
									color : color[index]
							}
							array.push(item);
							}else{//변경 대상자 = 변경 요청자
								if(obj1.o_code == obj1.o_code_1){ //변경 대상자 휴무 = 변경 요청자 휴무
									array1.push(obj1.m_id);
									alert('변경 요청자 휴무'+obj1.o_code+'변경 대상자 휴무'+obj1.o_code_1);
									item = {
											id : obj1.m_id,
											title : obj1.m_name,
											afterid : obj1.m_id_1,
											aftername : obj1.m_name_1,
											dow : obj1.o_code,
											downame : obj1.o_date,
											afterdowname : obj1.o_date_1,
											afterdow : obj1.o_code_1,
											color : color[index]
									}
									array.push(item);
								}else{ //변경 대상자 휴무 != 변경 요청자 휴무
									array1.push(obj1.m_id);
									alert('변경 요청자 휴무'+obj1.o_code+'변경 대상자 휴무'+obj1.o_code_1);
									item = {
											id : obj1.m_id,
											title : obj1.m_name,
											afterid : obj1.m_id_1,
											aftername : obj1.m_name_1,
											dow : obj1.o_code_1, //신청자 = 대상자, 휴무 != 휴무1 => dow = 휴무1
											downame : obj1.o_date,
											afterdowname : obj1.o_date_1,
											afterdow : obj1.o_code,
											color : color[index]
									}
									array.push(item);
								}
								
							}//else
						}//if
					});//2each
				});//1each
				
				for(var i=0;i<array1.length;i++){
					console.log(i+"번째 값"+array1[i]);
				}
				var count = 0;
				$.each(data.mrmbrdto,function(index,obj){//변경 신청중인 애들 제외하고 전부 뿌리는거
					console.log(obj.m_name + "/" + obj.m_id);
					for(var i=0;i<array1.length;i++){
						if(obj.m_id == array1[i]){ //변경 신청자, 변경 대상자
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
			}
		});
	}
	
		$(document).ajaxStop(function(){
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
					//변경 요청자 이외에 수정 하는 경우 막기
					if(event.afterdow == null){
						alert('변경 요청 데이터만 처리 할 수 있습니다.');
						revertFunc();
					}else{
						//변경 요청자 - 변경 대상자 매칭
						if(event.afterdow != Number(event.dow)+delta.days()){
							alert('변경 요청자의 휴무 변경은 변경 대상자로 해야 합니다.')
							revertFunc();
						}else{
							eventObjecte=event;
							alert(event.title + "/" + event.aftername);
							$('#1,#2').empty();
							$('#1').append(event.title);
							$('#2').append(event.aftername);
							$('#m_id').val(event.id);
							$('#o_code').val(event.dow);
							$('#m_id_1').val(event.afterid);
							$('#o_code_1').val(event.afterdow);
							$('#approvebtw').modal('show');
						}
					}
				},
				eventClick : function(calEvent, jsEvent, view) {
					//최초 휴무 신청자 처리 내용
					if(calEvent.id == calEvent.afterid){
						$('#approverefusebtw').modal('show');
						$('#3,#4,#5').empty();
						$('#3').append(calEvent.title);
						$('#4').append(calEvent.downame);
						$('#5').append(calEvent.afterdowname);
						$('#sm_id').val(calEvent.id);
						$('#so_code').val(calEvent.afterdow); //afterdow = o_code
						$('#so_code_1').val(calEvent.dow); //dow = o_code_1
						calEventObject = calEvent; //이벤트 할당
						
					}else{
						if(calEvent.afterdow == null){
							alert(calEvent.title + '님은 휴무 변경 신청자가 아닙니다.');
						}else{
							alert(calEvent.title + '님의 변경 대상자는' + calEvent.aftername + '입니다');
						}
					}//else
					
				}//eventclick
			});
		});
		
	$(function(){
		$('#approvebtw').modal('hide');
		$('#approverefusebtw').modal('hide');
		//일정 승인 처리
		$('#approvebtn').click(function(){
			var m_id = $('#m_id').val();
			var o_code = $('#o_code').val();
			var m_id_1 = $('#m_id_1').val();
			var o_code_1 = $('#o_code_1').val();
			$.ajax({
				url:"updatebtwinfo.admin",
				type:"post",
				data:{"m_id":m_id,"o_code":o_code,"m_id_1":m_id_1,"o_code_1":o_code_1},
				success:function(){
					alert('등록성공');
					$('#calendar').fullCalendar('removeEvents', eventObjecte.id);
					$('#calendar').fullCalendar('renderEvent', resultObject);
					$('#calendar').fullCalendar('unselect');
				}
			});
		});//approvebtn ajax
		//일정 거절 처리
		$('#refusebtn').click(function(){
			var m_id = $('#m_id').val();
			var o_code = $('#o_code').val();
			var m_id_1 = $('#m_id_1').val();
			var o_code_1 = $('#o_code_1').val();
			
			$.ajax({
				url:"updatebtwinfore.admin",
				type:"post",
				data:{"m_id":m_id,"o_code":o_code,"m_id_1":m_id_1,"o_code_1":o_code_1},
				success:function(){
					alert('거절 처리 되었습니다.');
				}
			})	
		});
		$('#approvesamebtn').click(function(){
			var m_id = $('#sm_id').val();
			var o_code = $('#so_code').val();
			var o_code_1 = $('#so_code_1').val();
			$.ajax({
				url:"approvefirstregister.admin",
				data:{"m_id":m_id,"o_code":o_code_1}, //변경 휴무로 reguloff에 등록되어야 한다.
				type:"post",
				success:function(data){
					alert('등록완료'+calEventObject.id+calEventObject.title);
					var resultObject = {
						id : calEventObject.id,
						title : calEventObject.title,
						dow : data.o_code,
						color : "red"
					};
					$('#calendar').fullCalendar('removeEvents', calEventObject.id);
					$('#calendar').fullCalendar('renderEvent', resultObject);
					$('#calendar').fullCalendar('unselect');
				}
			});
		});
		$('#refusesamebtn').click(function(){
			var m_id = $('#sm_id').val();
			var o_code = $('#so_code').val();
			var o_code_1 = $('#so_code_1').val();
			$.ajax({
				url:"refusefirstregister.admin",
				data:{"m_id":m_id,"o_code":o_code,"o_code_1":o_code_1},
				type:"post",
				success:function(data){
					alert('변경 거절');
					if(calEventObject.dow==calEventObject.afterdow){
					var resultObject = {
							id : calEventObject.id,
							title : calEventObject.title
						};
					}else{
					var resultObject = {
							id : calEventObject.id,
							title : calEventObject.title,
							dow : data.o_code
						};	
					}
					$('#calendar').fullCalendar('removeEvents', calEventObject.id);
					$('#calendar').fullCalendar('renderEvent', resultObject);
					$('#calendar').fullCalendar('unselect');
				}
			});
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