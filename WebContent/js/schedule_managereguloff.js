$(document).ready(function() {
		
		var m_name = "";
		var m_id = "";
		/* initialize the external events
		-----------------------------------------------------------------*/

		


		/* initialize the calendar
		-----------------------------------------------------------------*/

		$('#calendar').fullCalendar({
			header: {
				left: 'prev,next today',
				center: 'title',
				right: 'month,agendaWeek,agendaDay'
			},
			editable: true,
			droppable: true, // this allows things to be dropped onto the calendar
			eventRender: function(event,element){
				console.log("description"+event.description);
				m_name = event.title;
				m_id = event.description;
			},
			drop: function(date,jsEvent) {
				console.log('dddfdfdf');
				console.log(date);
				console.log(jsEvent);
				console.log(jsEvent.title);
				console.log(jsEvent.description);
				// is the "remove after drop" checkbox checked?
				
					// if so, remove the element from the "Draggable Events" list
					$(this).remove();
				
			}
		});
		
		$('#selectedgaragename').change(function(){
			console.log($('#selectedgaragename').val());
			var param = $('#selectedgaragename').val();
			$('#selectedroutenumber').empty();
			var view = "<option value='0'>선택없음</option>"
			$.ajax({
				url:"getselectedroute.admin",
				data:{"g_num":param},
				success:function(data){
					$.each(data.rdto,function(index,value){
						view += "<option value="+value.r_num+">";
						view += value.r_num;
						view += "</option>";
					});
					$('#selectedroutenumber').html(view);
				}
			});
		});
		

	});

