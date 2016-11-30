$(document).ready(function() {


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
