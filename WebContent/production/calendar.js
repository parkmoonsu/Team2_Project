/* 
 * @File Name: calendar.js
 * @Author: 길한종
 * @Data: 2016. 11. 14
 * @Desc: 일정관리(일반공용) -  풀캘린더 컨트롤
 */

//db연동을 위한 변수
var array = new Array();

$(window).load(function() {

	//최초 로딩 시 db에서 일정 로드
	$.ajax({
		url : 'selectSchedule.htm',
		type : 'post',
		dataType : 'json',
		success : function(data) {
			$.each(data.data, function(index, obj) {
				var item = {
					id : obj.id,
					title : obj.title,
					start : obj.sstart,
					end : obj.eend
				};
				array.push(item);
			});
			//ajax데이터를 받기 위해 여기서 풀캘린더 로드
			loadCalendar();
		}
	});

	//일정저장버튼 클릭시 이벤트
	$(".antosubmit").on("click", function() {
		title = $("#title").val();
		var event = {
			title : title,
			allDay : true,
			sstart : startdate,
			eend : enddate,
			url : "nourl"
		};
		$(".antoclose").click();

		//입력된 일정 db에 저장
		$.ajax({
			url : 'insertSchedule.htm',
			type : 'post',
			data : event,
			dataType : "json",
			success : function(data) {
				//저장 후 불러와서 표시
				event = {
					id : data.data.id,
					title : data.data.title,
					allDay : data.data.allDay,
					start : data.data.sstart,
					end : data.data.eend
				};
				$("#calendar").fullCalendar('renderEvent', event);
				$("#title").val("");
				$("#calendar").fullCalendar('unselect');
			}
		});

	});

	//일정업데이트버튼 클릭시 이벤트
	$(".antosubmit2").on("click", function() {
		title = $("#title2").val();
		var event = {
			id : calEventObj.id,
			title : title,
			allDay : true,
			sstart : calEventObj.start.format("YYYY-MM-DD HH:mm:ss"),
			eend : calEventObj.end.format("YYYY-MM-DD HH:mm:ss"),
			url : "nope"
		};
		$('.antoclose2').click();
		calEventObj.title = title;

		$.ajax({
			url : 'updateSchedule.htm',
			type : 'post',
			data : event,
			success : function(data) {
				$("#calendar").fullCalendar('updateEvent', calEventObj);
				$("#calendar").fullCalendar('unselect');
			}
		});

	});

	//삭제버튼
	$('#deleteschedule').click(function() {
		if (confirm("정말 삭제하시겠습니까??") == true) {
			//숨김처리
			$("#calendar").fullCalendar('removeEvents', calEventObj.id);

			//db삭제
			$.ajax({
				url : 'deleteSchedule.htm',
				type : 'post',
				dataType : 'json',
				data : {
					id : calEventObj.id
				},
				success : function(data) {
					console.log("삭제성공");
				}
			});
		}
		$('.antoclose2').click();
		$("#calendar").fullCalendar('unselect');
	});

});

//일정 저장 변수
var title;
var startdate;
var enddate;
var id;
var calEventObj;

function loadCalendar() {
	var calendar = $('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
		selectable : true,
		selectHelper : true,
		editable : true,
		events : array,

		//날짜 클릭시 이벤트 발생
		select : function(start, end, allDay) {

			//모달 입력창
			$('#fc_create').click();

			//데이터 가져오기
			startdate = start.format("YYYY-MM-DD");
			enddate = end.format("YYYY-MM-DD");
		},

		//일정 클릭시 이벤트 발생
		eventClick : function(calEvent, jsEvent, view) {

			//모달 입력창
			$('#fc_edit').click();

			//데이터 가져오기
			$('#title2').val(calEvent.title);
			calEventObj = calEvent;
		},

		//날짜드래그 시 이벤트
		eventDrop : function(event, delta, revertFunc) {

			$.ajax({
				url : 'updateSchedule.htm',
				type : 'post',
				data : {
					id : event.id,
					title : event.title,
					allDay : true,
					sstart : event.start.format('YYYY-MM-DD HH:mm:ss'),
					eend : event.end.format('YYYY-MM-DD HH:mm:ss'),
					url : "nope"
				},
				success : function(data) {
					console.log("날짜이동성공");
					$("#calendar").fullCalendar('unselect');
				}
			});
		},
		//날짜 길이 늘일때 이벤트
		eventResize : function(event, jsEvent, view) {

			$.ajax({
				url : 'updateSchedule.htm',
				type : 'post',
				data : {
					id : event.id,
					title : event.title,
					allDay : true,
					sstart : event.start.format('YYYY-MM-DD HH:mm:ss'),
					eend : event.end.format('YYYY-MM-DD HH:mm:ss'),
					url : "nope"
				},
				success : function(data) {
					console.log("날짜 늘이기 성공");
					$("#calendar").fullCalendar('unselect');
				}

			});
		}
	});
}