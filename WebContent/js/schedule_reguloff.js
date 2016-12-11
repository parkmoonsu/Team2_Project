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

	// reguloff에 저장된 승인 일정 불러오기
	$.ajax({
		url : 'reguloff_select.htm',
		type : 'post',
		data : {m_id:loginid},
		dataType : 'json',
		success : function(data) {

			$.each(data.data, function(index, obj) {
				

				if(obj.temp=='t'){

				} else {
					
					var item = {
						id : obj.m_id,
						title : obj.m_name,
						dow : [ obj.o_code ]
					};
					
					//승인된 일정에 대해
					if (obj.m_id==loginid){
						item.color="green"; //본인
					} else {
						item.color="black"; //타인
					}
					array.push(item);
				}
				
			});
		}
	});
	
	// reguloffr에 저장된 신청중인 일정 불러오기
	$.ajax({
		url : 'reguloffr_select.htm',
		type : 'post',
		data : {m_id:loginid},
		dataType : 'json',
		success : function(data) {
			
			var temp;
			
			$.each(data.data, function(index, obj) {

				var item = {
					id : obj.m_id,
					title : obj.m_name,
					dow : [ obj.ro_code ],
					color:''
				};
				
				//본인/타인 판별
				if (obj.m_id==loginid){
					item.color="red"; //본인				
					temp=obj.ro_object;
				} else {
					item.color="";	 //타인			
				}
				array.push(item);
			});
			
			//로그인 사용자와 일정을 바꾸는 경우 같은 색으로
			for (var i=0; i<array.length; i++){
				if (array[i].id==temp){
					array[i].color="red";
				}
			}

		}
	});

	// 캘린더 불러오기
	$(document).ajaxStop(function() {
		loadCalendar();
	});

	// ----------모달 버튼 이벤트-----------

	// 저장버튼
	$(".antosubmit").on("click", function() {

		var o_code = $('#select1').val();

		$(".antoclose").click();

		// 입력된 일정 reguloff에 저장
		$.ajax({
			url : 'reguloff_insert.htm',
			type : 'post',
			data : {
				m_id : loginid,
				o_code : o_code,
				temp : 't'
			},
			dataType : "json",
			success : function(data) {	

			}
		});
		
		// reguloffr에 저장
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
				
				var event = {
					id : data.data.m_id,
					title : data.data.m_name,
					dow : [ data.data.o_code ],
					color:"red"
				};
				
				$("#calendar").fullCalendar('renderEvent', event);
				$("#calendar").fullCalendar('unselect');
			}
		});

	});

	// 업데이트 버튼
	$(".antosubmit2").on("click", function() {

		swal({
			  title: "정말 일정을 변경하시겠습니까?",
			  //text: "You will not be able to recover this imaginary file!",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "확인!",
			  closeOnConfirm: false
			},
			function(isConfirm){
				if(isConfirm){
					var o_code = $("#select2").val();
					
					$("#calendar").fullCalendar('removeEvents', calEventObj.id);

					$.ajax({
						url : 'reguloff_update.htm',
						type : 'post',
						data : {
							m_id : calEventObj.id,
							o_code : o_code,
							temp : 't'
						},
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
				} else {
					sw
				}
				
				
						////
			$('.antoclose2').click();
		});
		////
		
		/*if (confirm("정말 일정을 변경하시겠습니까??") == true) {
			var o_code = $("#select2").val();
			
			$("#calendar").fullCalendar('removeEvents', calEventObj.id);

			$.ajax({
				url : 'reguloff_update.htm',
				type : 'post',
				data : {
					m_id : calEventObj.id,
					o_code : o_code,
					temp : 't'
				},
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
		////
		$('.antoclose2').click();*/

	});

	// 삭제버튼
	$('#deleteschedule').click(function() {
		
		swal({
			  title: "정말 삭제하시겠습니까?",
			  //text: "You will not be able to recover this imaginary file!",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "확인",
			  cancelButtonText: "취소",
			  closeOnConfirm: false,
			  closeOnCancel: true
			},
			function(isConfirm){
			  if (isConfirm) {
				  $.ajax({
						url : 'reguloff_delete.htm',
						type : 'post',
						dataType : 'json',
						data : {
							m_id : calEventObj.id
						},
						success : function(data) {
							
						}
					});
					$("#calendar").fullCalendar('removeEvents', calEventObj.id);
					$("#calendar").fullCalendar('unselect');
			  } 
			});
		
/*		if (confirm("정말 삭제하시겠습니까??") == true) {

			// db삭제
			$.ajax({
				url : 'reguloff_delete.htm',
				type : 'post',
				dataType : 'json',
				data : {
					m_id : calEventObj.id
				},
				success : function(data) {
					
				}
			});
			$("#calendar").fullCalendar('removeEvents', calEventObj.id);
			$("#calendar").fullCalendar('unselect');
		}*/
		
		
		
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
			console.log(loginid);
			$.ajax({
				data:{"m_id":loginid},
				url:"rnumcheck.member",
				type:"get",
				success:function(data){
					
						$.ajax({
							type:'post',
							url:'reguloffschedulecheck.member',
							success:function(data){
								if(data.str=="false"){
									console.log(data.str);
									//alert('지금은 휴무 변경 시간이 아닙니다.');
									swal(
											{
												title : "",
												text : "지금은 휴무 변경 시간이 아닙니다.",
												type : "warning",
												
												confirmButtonColor : "#DD6B55",
												confirmButtonText : "확인",
												closeOnConfirm : true
											}, function() {});
								} else if(data.str==null || data.str==""){
									console.log(data.str);
									swal(
											{
												title : "",
												text : "Undefined",
												type : "warning",
												
												confirmButtonColor : "#DD6B55",
												confirmButtonText : "확인",
												closeOnConfirm : true
											}, function() {});
									
								} else {
									console.log(data.str);
									//중복일정 체크
									$.ajax({
										url:"checkmid.member",
										data:{"m_id":loginid},
										type:"post",
										success:function(data){
											if (data.row != "0"){
												//alert("더는 일정을 추가할 수 없습니다.");
												swal(
														{
															title : "",
															text : "더는 일정을 추가할 수 없습니다.",
															type : "warning",															
															confirmButtonColor : "#DD6B55",
															confirmButtonText : "확인",
															closeOnConfirm : true
														}, function() {
															 
														});
											} else {							
												//모달 입력창
												$("#select1").val(start.weekday());
												$('#fc_create').click();
												
											}
										}
									});
								}
							}
						});		
					
				},
				error:function(){
					//alert('먼저 차랑/노선을 배정 받아야 합니다.');
					swal(
							{
								title : "",
								text : "먼저 차랑/노선을 배정 받아야 합니다.",
								type : "warning",								
								confirmButtonColor : "#DD6B55",
								confirmButtonText : "확인",
								closeOnConfirm : true
							}, function() {
							});
					
				}
			});		
		},
		
		//일정 클릭시 이벤트
		eventClick : function(calEvent, jsEvent, view) {
			$.ajax({
				type:'post',
				url:'reguloffschedulecheck.member',
				success:function(data){
					if(data.str=="false"){
						console.log(data.str);
						//alert('지금은 휴무 변경 시간이 아닙니다.');
						swal(
								{
									title : "",
									text : "지금은 휴무 변경 시간이 아닙니다.",
									type : "warning",									
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "확인",
									closeOnConfirm : true
								}, function() {});
						
					} else if(data.str==null || data.str==""){
						console.log(data.str);
						swal(
								{
									title : "",
									text : "Undefined",
									type : "warning",
									
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "확인",
									closeOnConfirm : true
								}, function() {
									 
								});
					} else {
						$.ajax({
							url:"mid.member",
							data:{m_id:loginid},
							type:"post",
							dataType:"json",
							success:function(data){
								
								if (data.rid=="" || data.rid==null){
									//alert('먼저 일정을 등록 하세요');
									swal(
											{
												title : "",
												text : "먼저 일정을 등록 하세요",
												type : "warning",
												
												confirmButtonColor : "#DD6B55",
												confirmButtonText : "확인",
												closeOnConfirm : true
											}, function() {
												 
											});
								} else {
									
									$.ajax({
										url:"mid.member",
										data:{m_id:calEvent.id},
										type:"post",
										dataType:"json",
										success:function(data){
											
											//동일사용자인 경우 일정 수정
											if(data.rid==loginid){
												//모달 창 띄우기
												$('#fc_edit').click();
												calEventObj=calEvent;	
												
												//데이터 저장
												$("#title2").val(calEvent.title);
												$("#select2").val(calEvent.dow[0]);
											
											}else{
												//동일 사용자가 아닌 경우 일정 바꾸기
												
												swal({
													  title: "해당 사용자와 일정을 바꾸시겠습니까?",
													  //text: "You will not be able to recover this imaginary file!",
													  type: "warning",
													  showCancelButton: true,
													  confirmButtonColor: "#DD6B55",
													  confirmButtonText: "확인",
													  closeOnConfirm: false
													},
													function(){
													  //swal("Deleted!", "Your imaginary file has been deleted.", "success");
														$.ajax({
															type:"post",
															url:"checkstatus.member",
															dataType:"json",
															data:{m_id:loginid},
															success:function(data){
																if(data.row!=0){
																	//alert('이미 일정변경을 신청 중 입니다.');
																	swal(
																			{
																				title : "",
																				text : "이미 일정변경을 신청 중 입니다.",
																				type : "warning",
																				
																				confirmButtonColor : "#DD6B55",
																				confirmButtonText : "확인",
																				closeOnConfirm : true,
																				closeOnCancel: true
																			}, function() {
																				 
																			});
																}else{
																
																	$.ajax({
																		type:"post",
																		url:"checkstatus.member",
																		dataType:"json",
																		data:{m_id:calEvent.id},
																		success:function(data){
																			if(data.row!=0){
																				//alert('변경 중인 일정입니다.');
																				swal(
																						{
																							title : "",
																							text : "변경 중인 일정입니다.",
																							type : "warning",
																							
																							confirmButtonColor : "#DD6B55",
																							confirmButtonText : "확인",
																							closeOnConfirm : true
																						}, function() {
																							 
																						});
																			} else {
																				var event1={
																						id:calEvent.id,
																						title:calEvent.title,
																						dow:calEvent.dow,
																						color:"black"
																				};
																				
																				//신청자
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
																								dow:[data.dto.o_code],
																								color:"green"
																						};
																						
																						//바꾸기		
																						var event3={
																								id : event1.id,
																								title : event1.title,
																								dow:event2.dow,
																								color:'red'
																									
																						};
																						
																						var event4={
																								id: event2.id,
																								title : event2.title,
																								dow:event1.dow,
																								color:'red'
																						};
																						
																						$("#calendar").fullCalendar('renderEvent', event3);
																						$("#calendar").fullCalendar('unselect');
																						$("#calendar").fullCalendar('renderEvent', event4);
																						$("#calendar").fullCalendar('unselect');
																						
																						//reguloff 업데이트
																						$.ajax({
																							url : 'reguloff_update.htm',
																							type : 'post',
																							data : {
																								m_id:event1.id,
																								o_code:event1.dow[0],
																								temp:''
																							},
																							success : function(data) {
																								
																							}
																						});
																						
																						$.ajax({
																							url : 'reguloff_update.htm',
																							type : 'post',
																							data : {
																								m_id:event2.id,
																								o_code:event2.dow[0],
																								temp:'s'
																							},
																							success : function(data) {
																								
																							}
																						});
																						
																						//history 저장
																						$.ajax({
																							url : 'history_insert.htm',
																							type : 'post',
																							data : { 
																								ko_code:'600',
																								o_code:event1.dow[0], //변경전 요일
																								m_id:event1.id, //본인id > 클릭된 사람
																								ro_code:event2.dow[0], //변경후 요일
																								ro_object:event2.id, //바꿀사람id
																								o_check:""
																							},
																							success : function(data) {
																								
																								console.log('대상자는 o_check 없음');
																							}
																						});
																						
																						$.ajax({
																							url : 'history_insert.htm',
																							type : 'post',
																							data : { 
																								ko_code:'600',
																								o_code:event2.dow[0], //변경전 요일
																								m_id:event2.id, //본인id > 클릭된 사람
																								ro_code:event1.dow[0], //변경후 요일
																								ro_object:event1.id, //바꿀사람id
																								o_check:'y'
																							},
																							success : function(data) {
																								console.log('신청자는 o_check=y');
																							}
																						});
																						
																						
																					} //success
																				}); //ajax
																				
																			} //else
																		}//success
																	});//ajax

																} //else
															}//success
															
														});
													});
												
												
												/*if (confirm("해당 사용자와 일정을 바꾸시겠습니까?") == true) {
													$.ajax({
														type:"post",
														url:"checkstatus.member",
														dataType:"json",
														data:{m_id:loginid},
														success:function(data){
															if(data.row!=0){
																//alert('이미 일정변경을 신청 중 입니다.');
																swal(
																		{
																			title : "",
																			text : "이미 일정변경을 신청 중 입니다.",
																			type : "warning",
																			
																			confirmButtonColor : "#DD6B55",
																			confirmButtonText : "확인",
																			closeOnConfirm : true,
																			closeOnCancel: true
																		}, function() {
																			 
																		});
															}else{
															
																$.ajax({
																	type:"post",
																	url:"checkstatus.member",
																	dataType:"json",
																	data:{m_id:calEvent.id},
																	success:function(data){
																		if(data.row!=0){
																			//alert('변경 중인 일정입니다.');
																			swal(
																					{
																						title : "",
																						text : "변경 중인 일정입니다.",
																						type : "warning",
																						
																						confirmButtonColor : "#DD6B55",
																						confirmButtonText : "확인",
																						closeOnConfirm : true
																					}, function() {
																						 
																					});
																		} else {
																			var event1={
																					id:calEvent.id,
																					title:calEvent.title,
																					dow:calEvent.dow,
																					color:"black"
																			};
																			
																			//신청자
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
																							dow:[data.dto.o_code],
																							color:"green"
																					};
																					
																					//바꾸기		
																					var event3={
																							id : event1.id,
																							title : event1.title,
																							dow:event2.dow,
																							color:'red'
																								
																					};
																					
																					var event4={
																							id: event2.id,
																							title : event2.title,
																							dow:event1.dow,
																							color:'red'
																					};
																					
																					$("#calendar").fullCalendar('renderEvent', event3);
																					$("#calendar").fullCalendar('unselect');
																					$("#calendar").fullCalendar('renderEvent', event4);
																					$("#calendar").fullCalendar('unselect');
																					
																					//reguloff 업데이트
																					$.ajax({
																						url : 'reguloff_update.htm',
																						type : 'post',
																						data : {
																							m_id:event1.id,
																							o_code:event1.dow[0],
																							temp:''
																						},
																						success : function(data) {
																							
																						}
																					});
																					
																					$.ajax({
																						url : 'reguloff_update.htm',
																						type : 'post',
																						data : {
																							m_id:event2.id,
																							o_code:event2.dow[0],
																							temp:'s'
																						},
																						success : function(data) {
																							
																						}
																					});
																					
																					//history 저장
																					$.ajax({
																						url : 'history_insert.htm',
																						type : 'post',
																						data : { 
																							ko_code:'600',
																							o_code:event1.dow[0], //변경전 요일
																							m_id:event1.id, //본인id > 클릭된 사람
																							ro_code:event2.dow[0], //변경후 요일
																							ro_object:event2.id, //바꿀사람id
																							o_check:""
																						},
																						success : function(data) {
																							
																							console.log('대상자는 o_check 없음');
																						}
																					});
																					
																					$.ajax({
																						url : 'history_insert.htm',
																						type : 'post',
																						data : { 
																							ko_code:'600',
																							o_code:event2.dow[0], //변경전 요일
																							m_id:event2.id, //본인id > 클릭된 사람
																							ro_code:event1.dow[0], //변경후 요일
																							ro_object:event1.id, //바꿀사람id
																							o_check:'y'
																						},
																						success : function(data) {
																							console.log('신청자는 o_check=y');
																						}
																					});
																					
																					
																				} //success
																			}); //ajax
																			
																		} //else
																	}//success
																});//ajax

															} //else
														}//success
														
													}); //ajax
												} //if
												*/
											} //else
										} //success
									}); //ajax							
								} //else
							} //success
						}); //ajax
					} //else
				} //success
			}); //ajax
		}, //eventclick
							
		//일정 드래그시 이벤트
		eventDrop : function(event, delta, revertFunc, jsEvent) {
			var dowbefore=event.dow[0];
			var dowafter= Number(event.dow[0])+delta.days();
			var evt;
			
		
			$.ajax({
				type:'post',
				url:'reguloffschedulecheck.member',
				success:function(data){
					if(data.str=="false"){
						console.log(data.str);
						//alert('지금은 휴무 변경 시간이 아닙니다.');
						swal(
								{
									title : "",
									text : "지금은 휴무 변경 시간이 아닙니다.",
									type : "warning",
									
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "확인",
									closeOnConfirm : true
								}, function() {
									 
								});
						$("#calendar").fullCalendar('refetchEvents');
						$("#calendar").fullCalendar('unselect');
					} else if(data.str==null || data.str==""){
						console.log(data.str);
						swal(
								{
									title : "",
									text : "Undefined",
									type : "warning",
									
									confirmButtonColor : "#DD6B55",
									confirmButtonText : "확인",
									closeOnConfirm : true
								}, function() {});
					} else {
						
						//동일사용자 확인
						$.ajax({
							url:"mid.member",
							data:{m_id:event.id},
							type:"post",
							dataType:"json",
							success:function(data){
								if(data.rid==loginid){
										
									swal({
										  title: "정말 일정을 변경하시겠습니까?",
										  //text: "You will not be able to recover this imaginary file!",
										  type: "warning",
										  showCancelButton: true,
										  confirmButtonColor: "#DD6B55",
										  confirmButtonText: "Yes!",
										  cancelButtonText: "No!",
										  closeOnConfirm: false,
										  closeOnCancel: false
										},
										function(isConfirm){
										  if (isConfirm) {
											  $.ajax({
													type:"post",
													url:"checkstatus.member",
													dataType:"json",
													data:{m_id:loginid},
													success:function(data){
														if(data.row!=0){
															//alert('이미 일정변경을 신청 중 입니다.');
															swal(
																	{
																		title : "",
																		text : "이미 일정변경을 신청 중 입니다.",
																		type : "warning",
																		
																		confirmButtonColor : "#DD6B55",
																		confirmButtonText : "확인",
																		closeOnConfirm : true
																	}, function() {
																		 
																	});
															
															
															$('#calendar').fullCalendar('refetchEvents');
															$('#calendar').fullCalendar('unselect');
														}else{
															
															if (dowafter>6){
																dowafter=dowafter%7;
															} else if (dowafter<0){
																dowafter=dowafter%7+7;
															} else {
															}
															
															$("#calendar").fullCalendar('removeEvents', event.id);
															
															$.ajax({
																url:"reguloff_update.htm",
																data:{
																	m_id : event.id,
																	o_code : dowbefore,
																	temp:'s'
																},
																type:"post",
																dataType:"json",
																success:function(data){
																	
																	evt={
																			id:event.id,
																			title:event.title,
																			dow:[dowbefore],
																			color:'green'
																	};
																	
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
																	
																	var event = {
																			id : data.data.m_id,
																			title : data.data.m_name,
																			dow : [ dowafter ],
																			color:"red"
																		};
																		
																		$("#calendar").fullCalendar('renderEvent', event);
																		$("#calendar").fullCalendar('unselect');
																}
															});
														}
													}
												});
											  
											  
											  
										  } else {
											 swal("취소되었습니다.");
											  $("#calendar").fullCalendar('refetchEvents');
												//원위치
												evt={
														id:event.id,
														title:event.title,
														dow:[dowbefore]
												};
												$("#calendar").fullCalendar('removeEvents', event.id);
												$("#calendar").fullCalendar('renderEvent', evt);
												$("#calendar").fullCalendar('unselect');
										  }
										});
									
									
									
									
									
									
									/*if (confirm("정말 일정을 변경하시겠습니까??") == true) {												
										$.ajax({
											type:"post",
											url:"checkstatus.member",
											dataType:"json",
											data:{m_id:loginid},
											success:function(data){
												if(data.row!=0){
													//alert('이미 일정변경을 신청 중 입니다.');
													swal(
															{
																title : "",
																text : "이미 일정변경을 신청 중 입니다.",
																type : "warning",
																
																confirmButtonColor : "#DD6B55",
																confirmButtonText : "확인",
																closeOnConfirm : true
															}, function() {
																 
															});
													
													
													$('#calendar').fullCalendar('refetchEvents');
													$('#calendar').fullCalendar('unselect');
												}else{
													
													if (dowafter>6){
														dowafter=dowafter%7;
													} else if (dowafter<0){
														dowafter=dowafter%7+7;
													} else {
													}
													
													$("#calendar").fullCalendar('removeEvents', event.id);
													
													$.ajax({
														url:"reguloff_update.htm",
														data:{
															m_id : event.id,
															o_code : dowbefore,
															temp:'s'
														},
														type:"post",
														dataType:"json",
														success:function(data){
															
															evt={
																	id:event.id,
																	title:event.title,
																	dow:[dowbefore],
																	color:'green'
															};
															
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
															
															var event = {
																	id : data.data.m_id,
																	title : data.data.m_name,
																	dow : [ dowafter ],
																	color:"red"
																};
																
																$("#calendar").fullCalendar('renderEvent', event);
																$("#calendar").fullCalendar('unselect');
														}
													});
												}
											}
										});
													
										} else {
											$("#calendar").fullCalendar('refetchEvents');
											//원위치
											evt={
													id:event.id,
													title:event.title,
													dow:[dowbefore]
											};
											$("#calendar").fullCalendar('removeEvents', event.id);
											$("#calendar").fullCalendar('renderEvent', evt);
											$("#calendar").fullCalendar('unselect');
											
			
										}*/
									
										$("#calendar").fullCalendar('unselect');
														
									}else{
										swal(
												{
													title : "",
													text : "해당 일정은 편집할 수 없습니다.",
													type : "warning",
													
													confirmButtonColor : "#DD6B55",
													confirmButtonText : "확인",
													closeOnConfirm : true
												}, function() {
													 
												});
										$("#calendar").fullCalendar('refetchEvents');
										$("#calendar").fullCalendar('unselect');
										/*//원위치
										evt={
												id:event.id,
												title:event.title,
												dow:[dowbefore]
										};
										$("#calendar").fullCalendar('removeEvents', event.id);
										$("#calendar").fullCalendar('renderEvent', evt);*/
									}	//else
								} //success
							});	//ajax	
					} //else
				} //success
			});	//ajax
		} //eventdrop
	}); //calendar
} //function