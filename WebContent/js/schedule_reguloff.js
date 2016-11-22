/*
 * @File Name: calendar_reguloff.js
 * @Author: 길한종
 * @Data: 2016. 11. 18
 * @Desc: 일정관리(정기휴무) -  풀캘린더 컨트롤 
 */

var array = new Array();


$(function() {
	var id=$('#hidden').val();

	$.ajax({
		url:"name.htm",
		data:{"m_id":id},
		success:function(data){
			$("#title").val(data.m_name);
			$("#title2").val(data.m_name);		
		}
	});
	$.ajax({
		url : 'reguloff_select.htm',
		type : 'post',
		dataType : 'json',
		success : function(data) {
			$.each(data.data, function(index, obj) {
				var item = {
					id : obj.id,
					title : obj.m_id,
					dow:[obj.o_code]
				};
				array.push(item);
			});
		}
	});

	$(document).ajaxStop(function() {
		  loadCalendar();
	});
	
	//저장버튼
	$(".antosubmit").on("click", function() {
		var m_id = $("#title").val();
		var o_code=$('#select1').val();

		var event = {
			m_id : m_id,
			o_code : o_code
		};
		$(".antoclose").click();
		
		//입력된 일정 db에 저장
		$.ajax({
			url : 'reguloff_insert.htm',
			type : 'post',
			data : event,
			dataType : "json",
			success : function(data) {

				event={
					id: data.data.id,
					title : data.data.m_id,
					dow : [data.data.o_code]
				}
				$("#calendar").fullCalendar('renderEvent', event);
				//$("#calendar").fullCalendar('refetchEvents');
				//$("#title").val("");
				$("#calendar").fullCalendar('unselect');
			}
		});
	});
	
	//업뎃버튼
	$(".antosubmit2").on("click", function() {
		var id = calEventObj.id;
		var m_id = $("#title2").val();
		var o_code=$("#select2").val();
		calEventObj.title=m_id;
		calEventObj.dow[0]=o_code;
		
		$("#calendar").fullCalendar('removeEvents', calEventObj.id);
		var event={
			id : id,
			m_id : m_id,
			o_code : o_code
		};
		$('.antoclose2').click();

		$.ajax({
			url : 'reguloff_update.htm',
			type : 'post',
			data : event,
			success : function(data) {
				event={
					id:id,
					title:m_id,
					dow:[o_code]
				};
				$("#calendar").fullCalendar('renderEvent', event);
				//updateEvent, renderEvent를 하기 위해서는.... 표준 event object가 되어야 한다
				//$("#calendar").fullCalendar('refetchEvents');
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
				url : 'reguloff_delete.htm',
				type : 'post',
				dataType : 'json',
				data : {
					id : calEventObj.id
				},
				success : function(data) {
					$("#title").val("");
					$("#calendar").fullCalendar('unselect');
				}
			});
		} 
	});
});

//일정 저장 변수
var calEventObj;

function loadCalendar(){

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
		eventDurationEditable: false,
		eventStartEditable:false,
		
		//새로운 일정
		select : function(start, end, allDay) {
			
			//모달 입력창
			$('#fc_create').click();
					
		},
		
		//일정 클릭
		eventClick : function(calEvent, jsEvent, view) {

			//모달 창 띄우기
			$('#fc_edit').click();
			
			//데이터 저장
			$("#title2").val(calEvent.title);
			$("#select2").val(calEvent.dow[0]);
			calEventObj=calEvent;
			
		},
		
		//일정 드래그
		eventDrop : function(event, delta, revertFunc) {
			var id = event.id;
			/*var m_id = event.?;
			var o_code=event.?;*/

			$('.antoclose2').click();
			
			/*$.ajax({
				url : 'reguloff_update.htm',
				type : 'post',
				data : {
					id:id,
					m_id:m_id,
					o_code:o_code
				},
				success : function(data) {

					//updateEvent, renderEvent를 하기 위해서는.... 표준 event object가 되어야 한다
					$("#calendar").fullCalendar('refetchEvents');
					$("#calendar").fullCalendar('unselect');
				}
			});*/
			
		}
		
		/*//날짜 길이 늘이기 이벤트
		eventResize : function(event, jsEvent, view) {
			console.log(event.start);
			console.log(event.end);
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
					window.location.reload();
				}
			});
		}	*/
	});
}

