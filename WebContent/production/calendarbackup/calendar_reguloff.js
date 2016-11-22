/*
 * @File Name: calendar_reguloff.js
 * @Author: 길한종
 * @Data: 2016. 11. 18
 * @Desc: 일정관리(정기휴무) -  풀캘린더 컨트롤 
 */
var array = new Array();

$(window).load(function() {
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
});

function loadCalendar(){
	var date = new Date(),
	d = date.getDate(),
	m = date.getMonth(),
	y = date.getFullYear(),
	started, categoryClass;

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
		
		//새로운 일정
		select : function(start, end, allDay) {
			$('#fc_create').click();
	
			started = start;
			ended = end;
	
			$(".antosubmit").on("click", function() {
				var m_id = $("#title").val();
				var o_code=$('#select1').val();
				
				if (end) {
					ended = end;
				}
	
				categoryClass = $("#event_type").val();
	
				if (title) {
					//입력된 일정 db에 저장
					$.ajax({
						url : 'reguloff_insert.htm',
						type : 'post',
						data : {
							m_id : m_id,
							o_code : o_code
						},
						dataType : "json",
						success : function(data) {
							console.log(data);
							window.location.reload();
						}
					});
					
				}
	
				$('#title').val('');
	
				calendar.fullCalendar('unselect');
	
				$('.antoclose').click();
	
				return false;
			});
		},
		
		//일정 클릭
		eventClick : function(calEvent, jsEvent, view) {
			$('#fc_edit').click();
			$('#title2').val(calEvent.title);
			
			categoryClass = $("#event_type").val();
	
			//일정 업데이트
			$(".antosubmit2").on("click", function() {
				var id = calEvent.id;
				var m_id = $("#title2").val();
				var o_code=$('#select2').val();
				
				$('.antoclose2').click();
				
				$.ajax({
					url : 'reguloff_update.htm',
					type : 'post',
					data : {
						id : id,
						m_id : m_id,
						o_code : o_code
					},
					success : function(data) {
						window.location.reload();
					}
				});
			});
			
			//일정 삭제
			$('#deleteschedule').click(function() {
				
				if (confirm("정말 삭제하시겠습니까??") == true) {
					//숨김처리
					//calendar.fullCalendar('removeEvents', calEvent.id);
					console.log(calEvent.id);
					//db삭제
					$.ajax({
						url : 'reguloff_delete.htm',
						type : 'post',
						dataType : 'json',
						data : {
							id : calEvent.id
						},
						success : function(data) {
							window.location.reload();
						},
						error: function(jqXHR, textStatus, errorThrown) {
							window.location.reload();
					    }
					});

				} 
					
			});
	
			calendar.fullCalendar('unselect');
		},
		
		//일정 드래그
		eventDrop : function(event, delta, revertFunc) {
			
					window.location.reload();

		},
		eventStartEditable: false
		
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

