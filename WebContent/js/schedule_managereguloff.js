$(document).ready(function() {
	
	
	$('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		editable: true,
		droppable: true,
		monthNames: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		monthNamesShort: ["1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"],
		dayNames: ["일요일","월요일","화요일","수요일","목요일","금요일","토요일"],
		dayNamesShort: ["일","월","화 ","수 ","목 ","금 ","토 "],
		titleFormat: "YYYY년 MM월",
		drop: function() {

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
