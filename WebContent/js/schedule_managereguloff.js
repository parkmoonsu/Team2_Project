$(document).ready(function() {

	var m_name = "";
	var m_id = "";
	var date = new Date();
	var d = date.getDate();
	var m = date.getMonth();
	var y = date.getFullYear();
	var obj = new Object();

	/* initialize the external events
	-----------------------------------------------------------------*/

	/* initialize the calendar
	-----------------------------------------------------------------*/

	$('#calendar').fullCalendar({

		header : {
			left : 'prev,next today',
			center : 'title',
			right : 'month,agendaWeek,agendaDay'
		},
		editable : true,
		eventDrop : function(event,dayDelta,minuteDelta,allDay,revertFunc){
			console.log('변경자'+event.title);
			console.log('시작일'+event.start.format('YYYY-MM-DD'));
		},
		eventDurationEditable : false,
		droppable : true, // this allows things to be dropped onto the calendar
		events : [ {
			title : 'all day event',
			start : new Date(2016, 11, 2)
		}, {
			title : 'long Event',
			start : new Date(y, m, d - 5),
			end : new Date(y, m, d - 2)
		} ],
		eventRender : function(event, element) {
			//console.log("description"+event.description);
			m_name = event.title;
			m_id = event.description;
		},
		drop : function(date, jsEvent) {
			console.log(date.format('YYYY-MM-DD'));
			/*$.ajax({
				url : "",
				data : {"m_name":m_name,"m_id":m_id},
				success : function(){
					$(this).remove();
				}
			});*/

		}
	});

	$('#selectedgaragename').change(function() {
		console.log($('#selectedgaragename').val());
		var param = $('#selectedgaragename').val();
		$('#selectedroutenumber').empty();
		var view = "<option value='0'>선택없음</option>"
		$.ajax({
			url : "getselectedroute.admin",
			data : {
				"g_num" : param
			},
			success : function(data) {
				$.each(data.rdto, function(index, value) {
					view += "<option value=" + value.r_num + ">";
					view += value.r_num;
					view += "</option>";
				});
				$('#selectedroutenumber').html(view);
			}
		});
	});

});
