var array = new Array();

function ajaxLoader() {
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
		}
	});
}

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
				var title = $("#title").val();
				if (end) {
					ended = end;
				}
	
				categoryClass = $("#event_type").val();
	
				if (title) {
					//입력된 일정 db에 저장
					$.ajax({
						url : 'insertSchedule.htm',
						type : 'post',
						data : {
							title : title,
							allDay : true,
							sstart : start.format("YYYY-MM-DD HH:mm:ss"),
							eend : end.format("YYYY-MM-DD HH:mm:ss"),
							url : "nourl"
						},
						dataType : "json",
						success : function(data) {
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
				calEvent.title = $("#title2").val();
	
				calendar.fullCalendar('updateEvent', calEvent);
				$('.antoclose2').click();
				
				$.ajax({
					url : 'updateSchedule.htm',
					type : 'post',
					data : {
						id : calEvent.id,
						title : calEvent.title,
						allDay : true,
						sstart : calEvent.start.format('YYYY-MM-DD HH:mm:ss'),
						eend : calEvent.end.format('YYYY-MM-DD HH:mm:ss'),
						url : "nope"
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
						url : 'deleteSchedule.htm',
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

		},
		
		//날짜 길이 늘이기 이벤트
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
		}	
	});
}

$(window).load(function() {
	ajaxLoader();
	$(document).ajaxStop(function() {
		  loadCalendar();
	});
});