/*
 * @File Name: schedule_reguloff.js
 * @Author: 길한종
 * @Data: 2016. 11. 18
 * @Desc: 일정관리(정기휴무) -  풀캘린더 컨트롤 
 */

var array = new Array(); //db에 저장된 일정을 담는 배열
var loginid=$('#hidden').val();//{LoginUser}의 id
var displayname; //일정에 id대신 표시될 이름

$(function() {

	// id로 이름 불러오기
	$.ajax({
		url : "name.htm",
		data : {
			"m_id" : loginid
		},
		success : function(data) {
			// 모달 창에 이름 설정
			$("#title").val(data.m_name);
			$("#title2").val(data.m_name);
		}
	});

	// db에 저장된 일정 불러오기-색깔 넣어서
	$.ajax({
		url : 'reguloffr_select.htm',
		type : 'post',
		data : {m_id:loginid},
		dataType : 'json',
		success : function(data) {
	
			$.each(data.data, function(index, obj) {

				var item = {
					id : obj.m_id,
					title : obj.m_name,
					dow : [ obj.o_code ],
					color:''
				};

				//승인상태별 색 지정
				if (obj.m_id==loginid && obj.ko_code=="600"){
					item.color="red"; //본인, 신청중
				} else if (obj.m_id==loginid && obj.ko_code=="601"){
					item.color="green"; //본인, 승인
				} else if (obj.ko_code=="600"){
					item.color="black"; //타인, 신청
				} else if (obj.ko_code="601"){
					item.color=""; //타인, 승인
				}
				console.log(item);
				array.push(item);
			});
		}
	});
	
	/*// db에 저장된 일정 불러오기-색깔 없이
	$.ajax({
		url : 'reguloff_select.htm',
		type : 'post',
		data : {m_id:loginid},
		dataType : 'json',
		success : function(data) {

			$.each(data.data, function(index, obj) {
				 
				var item = {
					id : obj.m_id,
					title : obj.m_name,
					dow : [ obj.o_code ]
				};
				array.push(item);
			});
		}
	});*/

	// 캘린더 불러오기
	$(document).ajaxStop(function() {
		loadCalendar();
	});

	// ----------모달 버튼 이벤트-----------

	// 저장버튼
	$(".antosubmit").on("click", function() {

		var o_code = $('#select1').val();

		var event = {
			m_id : loginid,
			o_code : o_code,
			temp : 't'
		};
		$(".antoclose").click();

		// 입력된 일정 db에 저장
		$.ajax({
			url : 'reguloff_insert.htm',
			type : 'post',
			data : event,
			dataType : "json",
			success : function(data) {
				event = {
					id : data.data.m_id,
					title : data.data.m_name,
					dow : [ data.data.o_code ]
				};

				$("#calendar").fullCalendar('renderEvent', event);
				$("#calendar").fullCalendar('unselect');

			}
		});
		
		// history에 저장
		$.ajax({
			url : 'history_insert.htm',
			type : 'post',
			data : { 
				ko_code:'600',
				o_code:o_code,
				m_id:loginid,
				ro_code:o_code,
				ro_object:loginid,
				o_check:'y'
			},
			success : function(data) {
				
			}
		});

	});

	// 업뎃버튼
	$(".antosubmit2").on("click", function() {

		if (confirm("정말 일정을 변경하시겠습니까??") == true) {
			var o_code = $("#select2").val();
			
			$("#calendar").fullCalendar('removeEvents', calEventObj.id);

			$.ajax({
				url : 'reguloff_update.htm',
				type : 'post',
				data : {
					m_id : calEventObj.id,
					o_code : o_code,
					temp : ''
				},
				success : function(data) {
					console.log('reguloff에 업뎃');
					event = {
						id : data.data.m_id,
						title : data.data.m_name,
						dow : [ data.data.o_code ]
					};
					$("#calendar").fullCalendar('renderEvent', event);
					$("#calendar").fullCalendar('unselect');
				}
			});
			
			//history 저장
			$.ajax({
				url : 'history_insert.htm',
				type : 'post',
				data : { 
					ko_code:'600',
					o_code:calEventObj.dow[0],
					m_id:loginid,
					ro_code:o_code,
					ro_object:loginid,
					o_check:'y'
				},
				success : function(data) {
					
				}
			});
			
		}

		$('.antoclose2').click();

	});

	// 삭제버튼
	$('#deleteschedule').click(function() {

		if (confirm("정말 삭제하시겠습니까??") == true) {

			// db삭제
			$.ajax({
				url : 'reguloff_delete.htm',
				type : 'post',
				dataType : 'json',
				data : {
					m_id : calEventObj.id
				},
				success : function(data) {
					// 여기 이상
				}
			});
			$("#calendar").fullCalendar('removeEvents', calEventObj.id);
			$("#calendar").fullCalendar('unselect');
		}
	});
});

// 일정객체 저장 변수
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
			
			//중복일정 체크
			$.ajax({
				url:"checkmid.member",
				data:{"m_id":loginid},
				type:"post",
				success:function(data){
					if (data.row != "0"){
						alert("더는 일정을 추가할 수 없습니다.");
					} else {							
						//모달 입력창
						$("#select1").val(start.weekday());
						$('#fc_create').click();
						
					}
				}
			});
		},
		
		//일정 클릭시 이벤트
		eventClick : function(calEvent, jsEvent, view) {
			
			//동일사용자 확인
			$.ajax({
				url:"mid.member",
				data:{m_id:calEvent.id},
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.rid==loginid){
						//모달 창 띄우기
						$('#fc_edit').click();
						calEventObj=calEvent;	
						
						//데이터 저장
						$("#title2").val(calEvent.title);
						$("#select2").val(calEvent.dow[0]);
					}else{	
						if (confirm("해당 사용자와 일정을 바꾸시겠습니까?") == true) {
							//선택한 사용자
							var event1={
								id:calEvent.id,
								title:calEvent.title,
								dow:calEvent.dow
							};
							$("#calendar").fullCalendar('removeEvents', event1.id);
							$("#calendar").fullCalendar('unselect');
							
							//본인껄 어케 뽑나???
							var event2;
							$.ajax({
								url:"selectseq.member",
								data:{m_id:loginid},
								dataType:"json",
								type:"post",
								success:function(data){
									event2={
										id:data.dto.m_id,
										title:data.dto.m_name,
										dow:[data.dto.o_code]
									};
									$("#calendar").fullCalendar('removeEvents', event2.id);
									$("#calendar").fullCalendar('unselect');
								}
							});
							//바꾸기
							$(document).ajaxStop(function() {
								
								event1.dow=event2.dow;
								event2.dow=calEvent.dow;

								
								$("#calendar").fullCalendar('renderEvent', event1);
								$("#calendar").fullCalendar('renderEvent', event2);
								
								var o_code1=event1.dow[0]; //여기가 문제
								var o_code2=event2.dow[0];
								
								event1={
									m_id : calEvent.id,
									o_code : o_code1
								};
								
								event2={
									m_id : loginid,
									o_code : o_code2
								};
								
								//일정저장
								$.ajax({
									url : 'reguloff_update.htm',
									type : 'post',
									data : event1,
									success : function(data) {
										
									}
								});
								
								$.ajax({
									url : 'reguloff_update.htm',
									type : 'post',
									data : event2,
									success : function(data) {
										
									}
								});

								//history 저장
								$.ajax({
									url : 'history_insert.htm',
									type : 'post',
									data : { 
										ko_code:'600',
										o_code:event2.o_code, //변경전 요일
										m_id:event1.m_id, //본인id > 클릭된 사람
										ro_code:event1.o_code, //변경후 요일
										ro_object:event2.m_id, //바꿀사람id
										o_check:''
									},
									success : function(data) {
										'대상자는 y없이 변경되었다'
									}
								});
								
								//history 저장
								$.ajax({
									url : 'history_insert.htm',
									type : 'post',
									data : { 
										ko_code:'600',
										o_code:event1.o_code, //변경전 요일
										m_id:event2.m_id, //본인id > 클릭된 사람
										ro_code:event2.o_code, //변경후 요일
										ro_object:event1.m_id, //바꿀사람id
										o_check:'y'
									},
									success : function(data) {
										'요청자는 y있게 변경되었다'
									}
								});
								
							});
						}
					}	
				}
			});		
		},
		
		//일정 드래그시 이벤트
		eventDrop : function(event, delta, revertFunc, jsEvent) {
			var dowbefore=event.dow[0];
			var dowafter= Number(event.dow[0])+delta.days();
			var evt;
			
			//동일사용자 확인
			$.ajax({
				url:"mid.member",
				data:{m_id:event.id},
				type:"post",
				dataType:"json",
				success:function(data){
					if(data.rid==loginid){
						if (confirm("정말 일정을 변경하시겠습니까??") == true) {
							
							if (dowafter>6){
								dowafter=dowafter%7;
							} else if (dowafter<0){
								dowafter=dowafter%7+7;
							} else {
							}
				
							$.ajax({
								url:"reguloff_update.htm",
								data:{
									m_id : event.id,
									o_code : dowafter
								},
								type:"post",
								dataType:"json",
								success:function(data){
									evt={
											id:data.data.m_id,
											title:data.data.m_name,
											dow:[data.data.o_code]
									};
									$("#calendar").fullCalendar('removeEvents', event.id);
									$("#calendar").fullCalendar('renderEvent', evt);
								}
							});
							
							//history 저장
							$.ajax({
								url : 'history_insert.htm',
								type : 'post',
								data : { 
									ko_code:'600',
									o_code:dowbefore,
									m_id:loginid,
									ro_code:dowafter,
									ro_object:loginid,
									o_check:'y'
								},
								success : function(data) {
									
								}
							});
							
						} else {
							//원위치
							evt={
									id:event.id,
									title:event.title,
									dow:[dowbefore]
							};
							$("#calendar").fullCalendar('removeEvents', event.id);
							$("#calendar").fullCalendar('renderEvent', evt);

						}
					
						$("#calendar").fullCalendar('unselect');
								
					}else{
						alert("해당 일정은 편집할 수 없습니다.");
						//원위치
						evt={
								id:event.id,
								title:event.title,
								dow:[dowbefore]
						};
						$("#calendar").fullCalendar('removeEvents', event.id);
						$("#calendar").fullCalendar('renderEvent', evt);
					}	
				}
			});		
				
		}
	});
}
		


