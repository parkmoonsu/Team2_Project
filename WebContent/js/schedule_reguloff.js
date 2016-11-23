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
		eventStartEditable:true,
		//maxDate: "2016-11-30", 
		monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		dayNamesShort: ["일","월","화 ","수 ","목 ","금 ","토 "],
		titleFormat: "YYYY년 MM월",


		//새로운 일정
		select : function(start, end, jsEvent) {
			//console.log($(jsEvent.target).hasClass("disabled"));
			//console.log(jsEvent);
			//if($(jsEvent.target).hasClass("disabled")){
				//모달 입력창
				$('#fc_create').click();
		    //}else{
		    	//alert('여긴 안됨');
		    	//return false;
		    	
		    //}
					
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
		eventDrop : function(event, delta, revertFunc, jsEvent) {
			
			var id = event.id;
			var dow= Number(event.dow[0])+delta.days();
			var m_id=event.title;
			
			
			if (dow>6){
				dow=dow%7;
			} else if (dow<0){
				dow=dow%7+7;
			} else {
			}
			event.dow[0]=dow;
			
			$.ajax({
				url : "dowcount.member",
				type : "post",
				data:{o_code : dow},
				success:function(data){
					console.log(data.dow);
					if(data.dow >= 3){
						alert("넌 꺼져");
					}else{
						$.ajax({
							url : 'reguloff_update.htm',
							type : 'post',
							data : {
								id:id,
								m_id:m_id,
								o_code:dow
							},
							success : function(data) {

								//updateEvent, renderEvent를 하기 위해서는.... 표준 event object가 되어야 한다
								$("#calendar").fullCalendar('refetchEvents');
								//$("#calendar").fullCalendar('unselect');
							}
						});
					}
				}
				
			});
			console.log(event.start.format("YYYY-MM-DD"));
			/*$.ajax({
				url : 'reguloff_update.htm',
				type : 'post',
				data : {
					id:id,
					m_id:m_id,
					o_code:dow
				},
				success : function(data) {

					//updateEvent, renderEvent를 하기 위해서는.... 표준 event object가 되어야 한다
					$("#calendar").fullCalendar('refetchEvents');
					//$("#calendar").fullCalendar('unselect');
				}
			});*/
			
		}
		
		/*dayRender: function( date, cell ) {
		     // It's an example, do your own test here
			
		    if(cell.hasClass("fc-other-month")) {
		          cell.addClass("disabled");
		          alert(cell);
		     } 

		},
		dayClick: function(date, jsEvent, view) {
			console.log(jsEvent.target.hasClass("disabled"));
			console.log(jsEvent.target);
		    if($(jsEvent.target).hasClass("disabled")){
		        alert('여긴 안됨');
		    }
		    // Your code
		    // ....
		}*/
		
		/*dayRender: function(date, cell){
			console.log(date.format("YYYY-MM-DD") > "2016-11-23");
	        if (date.format("YYYY-MM-DD") > "2016-11-23"){
	        	console.log(cell);
	            //$(cell).addClass('fc-future-disabled');
	            $(cell).addClass('fc-status-disabled');
	        }
		}*/

		/*eventDragStop: function( event, jsEvent) {
			console.log("eventdragstop");
			console.log(jsEvent);			
		}*/
		
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

