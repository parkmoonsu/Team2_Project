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
					start : obj.sstart
				};
				array.push(item);
			});
			//ajax데이터를 받기 위해 여기서 풀캘린더 로드
			loadCalendar();
		}
	});

});
var started;
function loadCalendar() {
	var calendar = $('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
		selectable : true,
		selectHelper : true,
		select : function(start, end, allDay) {
			//모달 입력창 띄우기
			$('#fc_create').click();

			/*var started = start;
			var ended = end;*/
			
			$(".antosubmit").on("click", function() {
				console.log('일정추가');
				var title = $("#title").val();
				/*if (end) {
					ended = end;
				}*/

				//categoryClass = $("#event_type").val();
				if (title) {
					calendar.fullCalendar('renderEvent', {
						title : title,
						start : start._d,
						end : end._d,
						allDay : allDay,
						url: "url"
					}, true // make the event "stick"
					);
				}

				$('#title').val('');

				calendar.fullCalendar('unselect');

				$('.antoclose').click();

				//입력된 일정 db에 저장
				$.ajax({
					url : 'insertSchedule.htm',
					type : 'post',
					data : {
						title : title,
						allDay : true,
						sstart : start.format("YYYY-MM-DD HH:mm:ss"),
						eend : end.format("YYYY-MM-DD HH:mm:ss"),
						url: "nourl"
					},
					success : function(data) {
						console.log(data.data);
						//이벤트
						//기존 이벤트객체의 id속성을 이걸로 교체
						calendar.fullCalendar('removeEvents', data.data.id);
						console.log("요까지");
						calendar.fullCalendar('renderEvent', {
								id: data.data.id,
								title : data.data.title,
								start : data.data.sstart,
								end : data.data.eend,
								allDay : data.data.allDay,
								url: data.data.url
							}, true // make the event "stick"
						);
					}

				});
				return false;
			});
		},
		eventClick : function(calEvent, jsEvent, view) {

			//모달 입력창
			$('#fc_edit').click();
			$('#title2').val(calEvent.title);

			//categoryClass = $("#event_type").val();

			$('#deleteschedule').click(function() {
				//숨김처리
				calendar.fullCalendar('removeEvents', calEvent.id);
				//db삭제
				$.ajax({
					url : 'deleteSchedule.htm',
					type : 'post',
					dataType : 'json',
					data : {
						id : calEvent.id
					},
					success : function(data) {
						console.log("삭제성공");

					}
				});
			});

			$(".antosubmit2").on("click", function() {
				console.log('업데이트');
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
						eend : calEvent.start.format('YYYY-MM-DD HH:mm:ss'),
						url: "nope"
					},
					success : function(data) {
						console.log(title2);
						console.log("수정성공");
					}
				});

			});

			calendar.fullCalendar('unselect');

		},
		editable : true,
		eventDrop : function(event, delta, revertFunc) {
			$.ajax({
				url : 'updateSchedule.htm',
				type : 'post',
				data : {
					id : event.id,
					title : event.title,
					allDay : true,
					sstart : event.start.format('YYYY-MM-DD HH:mm:ss'),
					eend : event.start.format('YYYY-MM-DD HH:mm:ss'),
					url: "nope"
				},
				success : function(data) {
					console.log(data.title2);
					console.log("날짜이동성공");
				}
			});

		},
		events : array
	});
}