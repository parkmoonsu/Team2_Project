var sx;
var sy;
var ex;
var ey;
var markers = new Array();
var map;

$( document ).ready(function() {
	initMap();
});

function initMap() {
	var myLatlng = {
		lat : 37.363,
		lng : 127
	};

	map = new google.maps.Map(document.getElementById('map'), {
		zoom : 4,
		center : myLatlng
	});

	map.addListener('click', function(event) {
		var marker = new google.maps.Marker({
			position : event.latLng,
			map : map
		});
		markers.push({
			y:event.latLng.lat(),
			x:event.latLng.lng()
		});
		//체크함수호출
		check();
		console.log(markers);
	});
}

function check() {	

	if (markers.length <= 1) {
		// 작업하지않음
	} else if (markers.length == 2) {
		sx=markers[0].x;
		sy=markers[0].y;
		ex=markers[1].x;
		ey=markers[1].y;
		requestTmap(sx, sy, ex, ey);
	} else {
		for(var i=1; i<markers.length ; i++){
			/*sx=markers[i-1].x;
			sy=markers[i-1].y;
			ex=markers[i].x;
			ey=markers[i].y;
			requestTmap(sx, sy, ex, ey);*/
			sx=markers[i].x;
			sy=markers[i].y;
			ex=markers[1+1].x;
			ey=markers[1+1].y;
			requestTmap(sx, sy, ex, ey);
		}
	}
}

function requestTmap(sx, sy, ex, ey){
	var url= "https://apis.skplanetx.com/tmap/routes?version=1&format=json&reqCoordType=WGS84GEO&resCoordType=WGS84GEO"
		+ "&startX=" + sx + "&startY=" + sy
        + "&endX=" + ex + "&endY=" + ey
        + "&searchOption=10&appKey=cc15578e-061d-3387-9d44-a405a43c034e";

	$.ajax({
		url:url,
		type:'get',
		dataType:'json',
		success:function(data){
			for (var i=0; i<data.features.length; i++){
				if(data.features[i].geometry.type=="LineString"){	
					map.data.addGeoJson(data.features[i]);
				}				
			}
		}
	});
	
	//var 결과
	//return 결과;
}
