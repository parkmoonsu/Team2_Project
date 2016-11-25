/*
 * @File Name: calendar_reguloff.js
 * @Author: 길한종
 * @Data: 2016. 11. 18
 * @Desc: 일정관리(정기휴무) -  풀캘린더 컨트롤 
 */

var array = new Array(); //db에 저장된 일정을 담는 배열
var loginid=$('#hidden').val();//{LoginUser}의 id
var displayname; //일정에 id대신 표시될 이름

$(function() {
	
	//id로 이름 불러오기
	$.ajax({
		url:"name.htm",
		data:{"m_id":loginid},
		success:function(data){
			displayname=data.m_name;
			//모달 창에 이름 설정
			$("#title").val(data.m_name);
			$("#title2").val(data.m_name);
			
			//db에 저장된 일정 불러오기
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
		}
	});	

	//캘린더 불러오기
	$(document).ajaxStop(function() {
		  loadCalendar();
	});
	
	//----------모달 버튼 이벤트-----------
	
	//저장버튼
	$(".antosubmit").on("click", function() {
		//ajax로 해서 db에 m_id가 있으면 일정추가 금지
		$.ajax({
			url:"checkmid.member",
			data:{"m_id":loginid},
			type:"post",
			success:function(data){
				$(".antoclose").click();
				if (data.row != "0"){
					alert("더는 일정을 추가할 수 없습니다.");
					$(".antoclose").click();
				} else {
					var o_code=$('#select1').val();

					var event = {
						m_id : loginid,
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
		
							$(document).ajaxStop(function() {
									event={
											id: data.data.id,
											title : data.data.m_id,
											dow : [data.data.o_code]
									};
									console.log(data);
									
									$("#calendar").fullCalendar('removeEvents', event.id);
									$("#calendar").fullCalendar('renderEvent', event);
									$("#calendar").fullCalendar('unselect');
							});
							
						}
					});
				}
			}

		});	
	});
	
	//업뎃버튼
	$(".antosubmit2").on("click", function() {	
		
		if (confirm("정말 일정을 변경하시겠습니까??") == true){
			var o_code=$("#select2").val();
			
			calEventObj.dow[0]=o_code;
			
			$("#calendar").fullCalendar('removeEvents', calEventObj.id);
			var event={
					id : calEventObj.id,
					m_id : calEventObj.title,
					o_code : o_code
			};
			
			$.ajax({
				url : 'reguloff_update.htm',
				type : 'post',
				data : event,
				success : function(data) {
					event={
							id: calEventObj.id,
							title: calEventObj.title,
							dow:[o_code]
					};
					$("#calendar").fullCalendar('renderEvent', event);
					$("#calendar").fullCalendar('unselect');
				}
			});	
		}
		
		$('.antoclose2').click();
		
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
					$("#calendar").fullCalendar('unselect');
				}
			});
		} 
	});
});

//일정객체 저장 변수
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
		monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		dayNamesShort: ["일","월","화 ","수 ","목 ","금 ","토 "],
		titleFormat: "YYYY년 MM월",

		//날짜 선택시 이벤트
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
		
		//일정 클릭시 이벤트
		eventClick : function(calEvent, jsEvent, view) {
			$.ajax({
				url:"mid.member",
				data:{id:calEvent.id},
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.rid==loginid){
						//모달 창 띄우기
						$('#fc_edit').click();
						
						//데이터 저장
						$("#title2").val(calEvent.title);
						$("#select2").val(calEvent.dow[0]);
						calEventObj=calEvent;	
					}else{
						alert("해당 일정은 편집할 수 없습니다.")
					}	
				}
			});		
		},
		
		//일정 드래그시 이벤트
		eventDrop : function(event, delta, revertFunc, jsEvent) {
			$.ajax({
				url:"mid.member",
				data:{id:event.id},
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.rid==loginid){
						var id = event.id;
						var dow= Number(event.dow[0])+delta.days();
						var m_id=loginid;
	
						if (dow>6){
							dow=dow%7;
						} else if (dow<0){
							dow=dow%7+7;
						} else {
						}
						event.dow[0]=dow;
						if (confirm("정말 일정을 변경하시겠습니까?") == true) {

							
							$.ajax({
								url : "dowcount.member",
								type : "post",
								data:{o_code : dow},
								success:function(data){
				
									if(data.dow >= 3){
										alert("더 이상 일정을 추가할 수 없습니다.");
									}else{
										$.ajax({
											url : 'reguloff_update.htm',
											type : 'post',
											data : {
												id:id,
												m_id:event.title,
												o_code:dow
											},
											success : function(data) {
	
												event={
														id:id,
														title:event.title,
														dow:[dow]	
												};
											}
										});
										$(document).ajaxStop(function() {
											$("#calendar").fullCalendar('removeEvents', id);
											$("#calendar").fullCalendar('renderEvent', event);
											$("#calendar").fullCalendar('unselect');
										});
									}
								}
								
							});
						} else {
							//원위치로 돌리기
							event = {
								id:id,
								title:displayname,
								dow:[dow]
							};
							
							//$("#calendar").fullCalendar('refetchEvents');
							$("#calendar").fullCalendar('removeEvents', id);
							$("#calendar").fullCalendar('renderEvent', event);
							$("#calendar").fullCalendar('unselect');
						}	
					}else{
						alert("해당 일정은 편집할 수 없습니다.");
						$("#calendar").fullCalendar('refetchEvents');
						$("#calendar").fullCalendar('unselect');
					}	
				}
			});			
		}
	});
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


