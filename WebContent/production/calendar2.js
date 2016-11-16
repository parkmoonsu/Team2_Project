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
					end: obj.eend
				};
				array.push(item);
			});
			//ajax데이터를 받기 위해 여기서 풀캘린더 로드
			loadCalendar();
		}
	});

});

function loadCalendar() {
	var calendar = $('#calendar').fullCalendar({
		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
		selectable : true,
		selectHelper : true,
		
		//날짜 클릭시 이벤트 발생
		select : function(start, end, allDay) {
			
			//모달 입력창 띄우기
			$('#fc_create').click();
			console.log(start.format("YYYY-MM-DD HH:mm:ss"));
			console.log(end.format("YYYY-MM-DD HH:mm:ss"));

			$(".antosubmit").on("click", function() {

				var title = $("#title").val();

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
						dataType:"json",
						success : function(data) {
							//캘린더에 그리기
							calendar.fullCalendar('renderEvent', {
									id : data.data.id,
									title : data.data.title,
									allDay : data.data.allDay,
									start : data.data.sstart,
									end : data.data.eend
									//url : data.data.url
								}, true
							);
						}
					});
				}

				$('#title').val('');

				calendar.fullCalendar('unselect');

				$('.antoclose').click();

				return false;
			});
		},
		
		//일정 클릭시 이벤트 발생
		eventClick : function(calEvent, jsEvent, view) {

			//모달 입력창
			$('#fc_edit').click();
			
			$('#title2').val(calEvent.title);
			
			//삭제버튼
			$('#deleteschedule').click(function() {
				console.log('삭제');
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
			
			//update버튼
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
						eend : calEvent.end.format('YYYY-MM-DD HH:mm:ss'),
						url : "nope"
					},
					success : function(data) {
						console.log("수정성공");
					}
				});

			});

			calendar.fullCalendar('unselect');

		},
		editable : true,
		
		//날짜드래그 이벤트
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
					console.log("날짜 늘이기 성공");
				}  
				
			});

		},
		events : array
	});
}