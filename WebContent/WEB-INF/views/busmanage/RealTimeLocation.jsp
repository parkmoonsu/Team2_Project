<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "se" uri = "http://www.springframework.org/security/tags" %>
<%request.getCharacterEncoding();%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <script src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>

    <title>KOSBUS</title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- iCheck -->
    <link href="${pageContext.request.contextPath}/vendors/iCheck/skins/flat/green.css" rel="stylesheet">
    <!-- bootstrap-progressbar -->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css" rel="stylesheet">
    <!-- JQVMap -->
    <link href="${pageContext.request.contextPath}/vendors/jqvmap/dist/jqvmap.min.css" rel="stylesheet"/>
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">

    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/build/css/custom.min.css" rel="stylesheet">
    <style type="text/css">
    .element {
 #map { margin-left:auto; margin-right:auto; width:95%; }}
 select#selectBus, #selectRoute, #selectGisa{
	-webkit-appearance: button;
	-webkit-border-radius: 2px;
	-webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
	-webkit-padding-end: 20px;
	-webkit-padding-start: 2px;
	-webkit-user-select: none;
	background-image: url(http://i62.tinypic.com/15xvbd5.png),
		-webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
	background-position: 97% center;                                                      
	background-repeat: no-repeat;
	border: 1px solid #AAA;
	color: #555;
	font-size: inherit;
	overflow: hidden;
	padding: 5px 10px; 
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 150px;
	border-radius: 8px;
	margin-bottom:15px;
}
.btn{border-radius: 8px};
</style>
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
        <div class="col-md-3 left_col">
        	<c:choose>
          		<c:when test ="${jobname == '기사'}">
          			<jsp:include page="/sidebar/sidebar2.jsp"></jsp:include>
          		</c:when>
          		<c:otherwise>
          			<jsp:include page="/sidebar/sidebar.jsp"></jsp:include>
          		</c:otherwise>
       		</c:choose>
       		
        </div>
			
			<!--상단 menu -->
			
			<div class="top_nav">
				<jsp:include page="/sidebar/menuHeader.jsp"></jsp:include>
			</div>
        <!-- page content -->
        <div class="right_col" role="main">

          <div class="row" style="text-align: right">
            <div class="col-md-12 col-sm-12 col-xs-12">
            <input type="button" id="Search" class="btn btn-default" value="버스위치추적 ">
				<input type="button" id="SearchStop"  class="btn btn-default" value="버스위치추적 중지">
				
				<select id="selectRoute">
					<option>노선종류</option>
					<c:forEach var="i" items="${list}">
					<option>${i.bd_name}</option>					
					</c:forEach>																	
				</select>
				
				<select id="selectGisa">
					<option>기사 명단</option>																	
				</select>
				
								
				<select id="selectBus">
					<option>노선을 선택하세요</option>
					<option>all</option>					
				</select>								
     <div class="container" id="map" style="width:auto;height:500px; border: solid black 1px; margin-left:auto; margin-right: auto;">
		</div>
            </div>
            	<div class="col-sm-3"></div>
            	<div class="col-sm-6">            	
				<div id="map"></div>
             </div>

          </div>
          <br />
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
			<jsp:include page="/sidebar/footer.jsp"></jsp:include>
			<div class="clearfix"></div>
		</footer>
        <!-- /footer content -->
      </div>
    </div>

  
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
    <!-- Chart.js -->
    <script src="${pageContext.request.contextPath}/vendors/Chart.js/dist/Chart.min.js"></script>
    <!-- gauge.js -->
    <script src="${pageContext.request.contextPath}/vendors/gauge.js/dist/gauge.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- iCheck -->
    <script src="${pageContext.request.contextPath}/vendors/iCheck/icheck.min.js"></script>
    <!-- Skycons -->
    <script src="${pageContext.request.contextPath}/vendors/skycons/skycons.js"></script>
    <!-- Flot -->
    <script src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.pie.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.time.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.stack.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.resize.js"></script>
    <!-- Flot plugins -->
    <script src="${pageContext.request.contextPath}/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/flot.curvedlines/curvedLines.js"></script>
    <!-- DateJS -->
    <script src="${pageContext.request.contextPath}/vendors/DateJS/build/date.js"></script>
    <!-- JQVMap -->
    <script src="${pageContext.request.contextPath}/vendors/jqvmap/dist/jquery.vmap.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>
    <script type="text/javascript">

	
  //구글 지도 전역변수
    var map;
    
    //addgeojason 해서 지도위에 경로를 그리고 , 노선을 수정할때 바로 전에 경로를 지워주기 위해 전역변수로 뺌. 
    var features;
            
    //원본 정류장 파일로부터 좌표를 담을 배열변수
    var originalMarkers = new Array();
   
   
   	//마커의 번호를 부여하기 위한 변수.
    var as=0;
   	
   	var infoContents = new Array();
   	
   	var BusMarker;
   	var B1usMarker;
   	var B2usMarker;
   	var B3usMarker;
   	var B4usMarker;
   	
    var originalMarkers = new Array();
    var originalMarkers5623 = new Array();
    var originalMarkers6702 = new Array();
    var originalMarkers9000 = new Array();
    var originalMarkers6501 = new Array();
   	
   	//원본 버스 실시간 추적 중지 변수.
   	var stopSearch;
   	
   	
   	var poly;
    var poly1;
    var poly2;
    var poly3;
    var poly4;
    
    var now = new Date();
    //지도 기본 위치 , 마커 기본위치 가 됨.  
    //현 기본 좌표 : 판교역
    var myLatLng = {
    	lat : 37.48085213924345,
     	lng : 126.91500663757324
    };
    
    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
           center : myLatLng,
           zoom : 13
        });                                                  
       
       	//교통 지도
       	var trafficLayer = new google.maps.TrafficLayer();
       	trafficLayer.setMap(map);
       
	   	poly = new google.maps.Polyline({   	    
		    strokeOpacity: 1.0,
		    strokeWeight: 2,
	  	});
		poly.setMap(map);
		
	   	poly1 = new google.maps.Polyline({   	    
		    strokeOpacity: 1.0,
		    strokeWeight: 2,
	  	});
		poly1.setMap(map);
		
		poly2 = new google.maps.Polyline({  	    
		    strokeOpacity: 1.0,
		    strokeWeight: 2,
	  	});
		poly2.setMap(map);
		
		poly3 = new google.maps.Polyline({ 	  
		    strokeOpacity: 1.0,
		    strokeWeight: 2,
	  	});
		poly3.setMap(map);
		
		poly4 = new google.maps.Polyline({
		    strokeOpacity: 1.0,
		    strokeWeight: 2,
	  	});
		poly4.setMap(map);
		
		map.addListener('click', function(e) {
			console.log(e.latLng);
		});
    }
    
     //버스 정류장 원본 파일로 좌표 읽어와서 마커 생성
    function originalMarkerMake(latLng, map) {
    	 for(var i=0; i<latLng.length; i++){
     	   /* console.log("---------------------------------");
     	   console.log("진행방향 "+latLng[i].direction);
     	   console.log("정류장명 "+latLng[i].stationNm);
     	   console.log("순번 "+latLng[i].seq);
     	   console.log("정류장 번호 "+latLng[i].stationNo);
     	   console.log("회차지 번호 "+latLng[i].trnstnid);
     	   console.log("노선번호 "+latLng[i].busRouteNm);
     	   console.log("노선ID "+latLng[i].busRouteId);
     	   console.log("첫차시간 "+latLng[i].beginTm);
     	   console.log("막차시간 "+latLng[i].lastTm);
     	   console.log("정류장 간 거리 "+latLng[i].fullSectDist);
     	   console.log("정류장 X "+latLng[i].gpsX);
     	   console.log("정류장 Y "+latLng[i].gpsY);
     	   console.log("---------------------------------"); */    	  
     	                                       
        
    		var originalMarker = new google.maps.Marker({
            	position: new google.maps.LatLng(latLng[i].s_y, latLng[i].s_x),         
           		map: map,           		
           		animation: google.maps.Animation.DROP,
           		icon : '${pageContext.request.contextPath}/images/busstop.png',
           		zindex : "5"
        	});
     	   
     	  	var infowindow = new google.maps.InfoWindow({ maxWidth: 400 });
     	  	
     	  	(function (originalMarker, latLng, infowindow) {
     	        google.maps.event.addListener(originalMarker, "click", function (e) {
     	            infowindow.setContent('<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif; color: black;"  align="left">' +"<b>정류장 명</b>:"+ latLng.s_name+ "<br>"+ "<b>정차순서</b>:"+latLng.rs_order+"<br>"+ "<b>정류장번호</b>:"+ latLng.s_num + "<br>"+'</p>');
     	            infowindow.open(map, originalMarker);
     	           
     	        });
     	    })(originalMarker, latLng[i], infowindow);

     	  	//map.panTo(originalMarker.getPosition());
     	  	originalMarkers.push(originalMarker);
            

    	}//for문 끝
    }
     
    function originalMarkerMake5623(latLng, map) {
   	 	for(var i=0; i<latLng.length; i++){
    	   /* console.log("---------------------------------");
    	   console.log("진행방향 "+latLng[i].direction);
    	   console.log("정류장명 "+latLng[i].stationNm);
    	   console.log("순번 "+latLng[i].seq);
    	   console.log("정류장 번호 "+latLng[i].stationNo);
    	   console.log("회차지 번호 "+latLng[i].trnstnid);
    	   console.log("노선번호 "+latLng[i].busRouteNm);
    	   console.log("노선ID "+latLng[i].busRouteId);
    	   console.log("첫차시간 "+latLng[i].beginTm);
    	   console.log("막차시간 "+latLng[i].lastTm);
    	   console.log("정류장 간 거리 "+latLng[i].fullSectDist);
    	   console.log("정류장 X "+latLng[i].gpsX);
    	   console.log("정류장 Y "+latLng[i].gpsY);
    	   console.log("---------------------------------"); */    	  
    	                                       
       
   			var originalMarker5623 = new google.maps.Marker({
           	position: new google.maps.LatLng(latLng[i].s_y, latLng[i].s_x),         
          		map: map,
          		title: latLng[i].stationNm,
          		animation: google.maps.Animation.DROP,
          		icon : '${pageContext.request.contextPath}/images/busstop.png',
          		zindex : "5"
       		});
    	  	//map.panTo(originalMarker5623.getPosition());
   			originalMarkers5623.push(originalMarker5623);   		
   		
   		
   		}//for문 끝
   	 	
   		
   	}
    
    function originalMarkerMake6702(latLng, map) {
      	for(var i=0; i<latLng.length; i++){
       	   /* console.log("---------------------------------");
       	   console.log("진행방향 "+latLng[i].direction);
       	   console.log("정류장명 "+latLng[i].stationNm);
       	   console.log("순번 "+latLng[i].seq);
       	   console.log("정류장 번호 "+latLng[i].stationNo);
       	   console.log("회차지 번호 "+latLng[i].trnstnid);
       	   console.log("노선번호 "+latLng[i].busRouteNm);
       	   console.log("노선ID "+latLng[i].busRouteId);
       	   console.log("첫차시간 "+latLng[i].beginTm);
       	   console.log("막차시간 "+latLng[i].lastTm);
       	   console.log("정류장 간 거리 "+latLng[i].fullSectDist);
       	   console.log("정류장 X "+latLng[i].gpsX);
       	   console.log("정류장 Y "+latLng[i].gpsY);
       	   console.log("---------------------------------"); */    	  
       	                                       
          
      			var originalMarker6702 = new google.maps.Marker({
              		position: new google.maps.LatLng(latLng[i].s_y, latLng[i].s_x),         
             		map: map,
             		title: latLng[i].stationNm,
             		animation: google.maps.Animation.DROP,
             		icon : '${pageContext.request.contextPath}/images/busstop.png',
             		zindex : "5"
          		});
       			//map.panTo(originalMarker702.getPosition());
      			originalMarkers6702.push(originalMarker6702);   		
      		
      		
      	}//for문 끝 	 	     		
    }
    
    function originalMarkerMake9000(latLng, map) {
     	 for(var i=0; i<latLng.length; i++){
      	   /* console.log("---------------------------------");
      	   console.log("진행방향 "+latLng[i].direction);
      	   console.log("정류장명 "+latLng[i].stationNm);
      	   console.log("순번 "+latLng[i].seq);
      	   console.log("정류장 번호 "+latLng[i].stationNo);
      	   console.log("회차지 번호 "+latLng[i].trnstnid);
      	   console.log("노선번호 "+latLng[i].busRouteNm);
      	   console.log("노선ID "+latLng[i].busRouteId);
      	   console.log("첫차시간 "+latLng[i].beginTm);
      	   console.log("막차시간 "+latLng[i].lastTm);
      	   console.log("정류장 간 거리 "+latLng[i].fullSectDist);
      	   console.log("정류장 X "+latLng[i].gpsX);
      	   console.log("정류장 Y "+latLng[i].gpsY);
      	   console.log("---------------------------------"); */    	  
      	                                       
         
     			var originalMarker9000 = new google.maps.Marker({
             		position: new google.maps.LatLng(latLng[i].s_y, latLng[i].s_x),         
            		map: map,
            		title: latLng[i].stationNm,
            		animation: google.maps.Animation.DROP,
            		icon : '${pageContext.request.contextPath}/images/busstop.png',
            		zindex : "5"
         		});
      			//map.panTo(originalMarker9000.getPosition());
     			originalMarkers9000.push(originalMarker9000);   		      		    		
     	}//for문 끝      	 	      		
   	}
    
    function originalMarkerMake6501(latLng, map) {
    	for(var i=0; i<latLng.length; i++){
     	   /* console.log("---------------------------------");
     	   console.log("진행방향 "+latLng[i].direction);
     	   console.log("정류장명 "+latLng[i].stationNm);
     	   console.log("순번 "+latLng[i].seq);
     	   console.log("정류장 번호 "+latLng[i].stationNo);
     	   console.log("회차지 번호 "+latLng[i].trnstnid);
     	   console.log("노선번호 "+latLng[i].busRouteNm);
     	   console.log("노선ID "+latLng[i].busRouteId);
     	   console.log("첫차시간 "+latLng[i].beginTm);
     	   console.log("막차시간 "+latLng[i].lastTm);
     	   console.log("정류장 간 거리 "+latLng[i].fullSectDist);
     	   console.log("정류장 X "+latLng[i].gpsX);
     	   console.log("정류장 Y "+latLng[i].gpsY);
     	   console.log("---------------------------------"); */    	  
     	                                       
        
    			var originalMarker6501 = new google.maps.Marker({
            		position: new google.maps.LatLng(latLng[i].s_y, latLng[i].s_x),         
           		map: map,
           		title: latLng[i].stationNm,
           		animation: google.maps.Animation.DROP,
           		icon : '${pageContext.request.contextPath}/images/busstop.png',
           		zindex : "5"
        		});
     			//map.panTo(originalMarker6501.getPosition());
    			originalMarkers6501.push(originalMarker6501);   		      		    		
    	}//for문 끝      	 	      		
  	}
    
    //원본 움직이는 버스마커(XML -> JSON 파싱용)
    function movingBusMarker(data,map){
       if(BusMarker == null){
       		BusMarker = new google.maps.Marker({
          		map: map,
          		position:new google.maps.LatLng(data[0].msgBody.itemList.tmY, data[0].msgBody.itemList.tmX),
          		icon:"${pageContext.request.contextPath}/images/bus.png"
       		});
      		
			var infowindow = new google.maps.InfoWindow({ maxWidth: 400 });
     	  	
     	  	(function (BusMarker, data, infowindow) {
     	        google.maps.event.addListener(BusMarker, "click", function (e) {
     	            infowindow.setContent('<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif; color: black;"  align="left">' +"<b>노선번호</b>: "+ data.r_num+ "<br>"+ "<b>차량번호</b>: "+data.b_vehiclenum+"<br>"+ "<b>기사명</b>: "+ data.m_name + "<br>"+'</p>');
     	            infowindow.open(map, BusMarker);
     	           
     	        });
     	    })(BusMarker, data[1], infowindow);
     	  	
       }else{
    	    console.log("너 마커 새로 생성안함??");
       		BusMarker.setPosition(new google.maps.LatLng(data[0].msgBody.itemList.tmY, data[0].msgBody.itemList.tmX));
       		
       }
    }
    
    function movingBusMarker1(data,map){
    	console.log("0번쨰 버스마커");
    	console.log(data);
       if(B1usMarker == null){
       		B1usMarker = new google.maps.Marker({
          		map: map,
          		position:new google.maps.LatLng(data[0].msgBody.itemList.tmY, data[0].msgBody.itemList.tmX),
          		icon:"${pageContext.request.contextPath}/images/bus.png"
       		});
      		
			var infowindow = new google.maps.InfoWindow({ maxWidth: 400 });
     	  	
			if(data[1] == null){
				(function (B1usMarker, data, infowindow) {
	     	        google.maps.event.addListener(B1usMarker, "click", function (e) {
	     	            infowindow.setContent('<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif; color: black;"  align="left">매칭된 기사없음</p>');
	     	            infowindow.open(map, B1usMarker);
	     	           
	     	        });
	     	    })(B1usMarker, data[1], infowindow);
				
				
				
			}else{
				(function (B1usMarker, data, infowindow) {
	     	        google.maps.event.addListener(B1usMarker, "click", function (e) {
	     	            infowindow.setContent('<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif; color: black;"  align="left">' +"<b>노선번호</b>: "+ data.r_num+ "<br>"+ "<b>차량번호</b>: "+data.b_vehiclenum+"<br>"+ "<b>기사명</b>: "+ data.m_name + "<br>"+'</p>');
	     	            infowindow.open(map, B1usMarker);
	     	           
	     	        });
	     	    })(B1usMarker, data[1], infowindow);
			}
			
       }else{
    	    console.log("너 마커 새로 생성안함??");
       		B1usMarker.setPosition(new google.maps.LatLng(data[0].msgBody.itemList.tmY, data[0].msgBody.itemList.tmX));
       		
       }
    }
    
    function movingBusMarker2(data,map){
    	console.log("1번쨰 버스마커");
    	console.log(data);
        if(B2usMarker == null){
        		B2usMarker = new google.maps.Marker({
           		map: map,
           		position:new google.maps.LatLng(data[0].msgBody.itemList.tmY, data[0].msgBody.itemList.tmX),
           		icon:"${pageContext.request.contextPath}/images/bus.png"
        		});
        		
        		var infowindow = new google.maps.InfoWindow({ maxWidth: 400 });
         	  	
        		
        		if(data[1] == null){
    				(function (B2usMarker, data, infowindow) {
    	     	        google.maps.event.addListener(B2usMarker, "click", function (e) {
    	     	            infowindow.setContent('<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif; color: black;"  align="left">매칭된 기사없음</p>');
    	     	            infowindow.open(map, B2usMarker);
    	     	           
    	     	        });
    	     	    })(B2usMarker, data[1], infowindow);   				
    				
    				
    			}else{
    				(function (B2usMarker, data, infowindow) {
    	     	        google.maps.event.addListener(B2usMarker, "click", function (e) {
    	     	            infowindow.setContent('<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif; color: black;"  align="left">' +"<b>노선번호</b>: "+ data.r_num+ "<br>"+ "<b>차량번호</b>: "+data.b_vehiclenum+"<br>"+ "<b>기사명</b>: "+ data.m_name + "<br>"+'</p>');
    	     	            infowindow.open(map, B2usMarker);
    	     	           
    	     	        });
    	     	    })(B2usMarker, data[1], infowindow);
    			}
         	  	
        }else{
     	    console.log("너 마커 새로 생성안함??");
        		B2usMarker.setPosition(new google.maps.LatLng(data[0].msgBody.itemList.tmY, data[0].msgBody.itemList.tmX));
        		
        }
     }
    
    function movingBusMarker3(data,map){
    	console.log("2번쨰 버스마커");
    	console.log(data);
        if(B3usMarker == null){
        		B3usMarker = new google.maps.Marker({
           		map: map,
           		position:new google.maps.LatLng(data[0].msgBody.itemList.tmY, data[0].msgBody.itemList.tmX),
           		icon:"${pageContext.request.contextPath}/images/bus.png"
        		});
        		
        		var infowindow = new google.maps.InfoWindow({ maxWidth: 400 });
        		
        		if(data[1] == null){
    				(function (B3usMarker, data, infowindow) {
    	     	        google.maps.event.addListener(B3usMarker, "click", function (e) {
    	     	            infowindow.setContent('<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif; color: black;"  align="left">매칭된 기사없음</p>');
    	     	            infowindow.open(map, B3usMarker);
    	     	           
    	     	        });
    	     	    })(B3usMarker, data[1], infowindow);
    				
    				
    				
    			}else{
    				(function (B3usMarker, data, infowindow) {
    	     	        google.maps.event.addListener(B3usMarker, "click", function (e) {
    	     	            infowindow.setContent('<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif; color: black;"  align="left">' +"<b>노선번호</b>: "+ data.r_num+ "<br>"+ "<b>차량번호</b>: "+data.b_vehiclenum+"<br>"+ "<b>기사명</b>: "+ data.m_name + "<br>"+'</p>');
    	     	            infowindow.open(map, B3usMarker);
    	     	           
    	     	        });
    	     	    })(B3usMarker, data[1], infowindow);
    			}
        		
        }else{
     	    console.log("너 마커 새로 생성안함??");
        		B3usMarker.setPosition(new google.maps.LatLng(data[0].msgBody.itemList.tmY, data[0].msgBody.itemList.tmX));
        		
        }
     }
    
    function movingBusMarker4(data,map){
    	console.log("3번쨰 버스마커");
    	console.log(data);
        if(B4usMarker == null){
        		B4usMarker = new google.maps.Marker({
           		map: map,
           		position:new google.maps.LatLng(data[0].msgBody.itemList.tmY, data[0].msgBody.itemList.tmX),
           		icon:"${pageContext.request.contextPath}/images/bus.png"
        		});
        		
        		var infowindow = new google.maps.InfoWindow({ maxWidth: 400 });
        		
        		if(data[1] == null){
    				(function (B4usMarker, data, infowindow) {
    	     	        google.maps.event.addListener(B4usMarker, "click", function (e) {
    	     	            infowindow.setContent('<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif; color: black;"  align="left">매칭된 기사없음</p>');
    	     	            infowindow.open(map, B4usMarker);
    	     	           
    	     	        });
    	     	    })(B4usMarker, data[1], infowindow);
    				
    				
    				
    			}else{
    				(function (B4usMarker, data, infowindow) {
    	     	        google.maps.event.addListener(B4usMarker, "click", function (e) {
    	     	            infowindow.setContent('<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif; color: black;"  align="left">' +"<b>노선번호</b>: "+ data.r_num+ "<br>"+ "<b>차량번호</b>: "+data.b_vehiclenum+"<br>"+ "<b>기사명</b>: "+ data.m_name + "<br>"+'</p>');
    	     	            infowindow.open(map, B4usMarker);
    	     	           
    	     	        });
    	     	    })(B4usMarker, data[1], infowindow);
    			}
        }else{
     	    console.log("너 마커 새로 생성안함??");
        		B4usMarker.setPosition(new google.maps.LatLng(data[0].msgBody.itemList.tmY, data[0].msgBody.itemList.tmX));
        		
        }
     }
    
    
    function originaldelete(){
    	map.data.forEach(function(features) {           
     		map.data.remove(features);
     	});
     
     	for(var i=0; i<originalMarkers.length; i++){
     		originalMarkers[i].setMap(null);
     	}
     	originalMarkers=[];
     	originalMarkers.length = 0;
    }
    
    function originaldeleteAll(){
    	map.data.forEach(function(features) {           
     		map.data.remove(features);
     	});
     
     	for(var i=0; i<originalMarkers5623.length; i++){
     		originalMarkers5623[i].setMap(null);
     	}
     	originalMarkers5623=[];
     	originalMarkers5623.length = 0;
     	
     	for(var i=0; i<originalMarkers6702.length; i++){
     		originalMarkers6702[i].setMap(null);
     	}
     	originalMarkers6702=[];
     	originalMarkers6702.length = 0;
     	
     	for(var i=0; i<originalMarkers9000.length; i++){
     		originalMarkers9000[i].setMap(null);
     	}
     	originalMarkers9000=[];
     	originalMarkers9000.length = 0;
     	
     	for(var i=0; i<originalMarkers6501.length; i++){
     		originalMarkers6501[i].setMap(null);
     	}
     	originalMarkers6501=[];
     	originalMarkers6501.length = 0;
    }
    
	function deleteRoute(){
    	
    	if(originalMarkers !=null){ 		
    		originaldelete();   		
    	}
    	if(originalMarkers5623 !=null && originalMarkers6702 !=null && originalMarkers9000 !=null && originalMarkers6501 !=null){
    		originaldeleteAll();
    	}
    }
    
    function polyRemove(){
    	if(poly1 !=null && poly2 !=null && poly3 !=null && poly4 !=null){
			poly1.setMap(null);
			poly2.setMap(null);
			poly3.setMap(null);
			poly4.setMap(null);   			
		}
		if(poly !=null){
			poly.setMap(null);
		}
    }
    
    function busMarkerRemove(){
    	clearInterval(stopSearch);
    	
    	if(B1usMarker !=null && B2usMarker !=null && B3usMarker !=null && B4usMarker !=null){
    		B1usMarker.setMap(null);
    		B2usMarker.setMap(null);
    		B3usMarker.setMap(null);
    		B4usMarker.setMap(null);   			
		}
		if(BusMarker !=null){
			BusMarker.setMap(null);
			BusMarker = null;
		}
    }
    
    function loadVector(data){
     	console.log("옴?");
     	console.log(data);
     	poly = new google.maps.Polyline({
     		path: data,
     	    strokeColor: 'red',
     	    strokeOpacity: 1.0,
     	    strokeWeight: 4,
       	});
     	poly.setMap(map);
    }
    
    function loadVector5623(data){
     	console.log("5623옴?");
     	//console.log(data);
     	poly1 = new google.maps.Polyline({
     		path: data,
     	    strokeColor: 'red',
     	    strokeOpacity: 1.0,
     	    strokeWeight: 4,
       	});
     	poly1.setMap(map);
    }
    
    function loadVector6702(data){
     	console.log("6702옴?");
     	//console.log(data);
     	poly2 = new google.maps.Polyline({
     		path: data,
     	    strokeColor: 'navy',
     	    strokeOpacity: 1.0,
     	    strokeWeight: 4,
       	});
     	poly2.setMap(map);
    }
    
    function loadVector9000(data){
     	console.log("옴?");
     	console.log(data);
     	poly3 = new google.maps.Polyline({
     		path: data,
     	    strokeColor: 'purple',
     	    strokeOpacity: 1.0,
     	    strokeWeight: 4,
       	});
     	poly3.setMap(map);
    }
    
    function loadVector6501(data){
     	console.log("옴?");
     	console.log(data);
     	poly4 = new google.maps.Polyline({
     		path: data,
     	    strokeColor: 'green',
     	    strokeOpacity: 1.0,
     	    strokeWeight: 4,
       	});
     	poly4.setMap(map);
    }
    
    $(function() {
    			//비동기 버스 경로 을 뿌린다.
    			/* $.ajax({
                   	url : "busRouteSearch.admin",
                   	type : "get",
                   	dataType : "json",
                   	data : {r_num:"all"},
                   	success : function(data2) {
                    	console.log("읽어옴?");
                      	//console.log(data2);                              	                                                                  	                       
                      	//노선 전체로드 현재 안됨...
                      	if(data2.length == 4){
                     	   
                      		var hell =new Array();
                 			var route5623;
                 			var route6702;
                 			var route9000;
                 			var route6501
                 			
                     		console.log("4개 경로노선");
                     		console.log(data2.length);
                     		
                     		for(var j=0;j<data2.length;j++){
                     			route5623 = data2[0].msgBody;
                     			route6702 = data2[1].msgBody;
                     			route9000 = data2[2].msgBody;
                     			route6501 = data2[3].msgBody;
                     		}
                     		//console.log(route5623);
                     		
                     		for(var j=0;j<route5623.length;j++){
                     			var f=route5623[j].gpsY;
                         		var d=route5623[j].gpsX;
                         		hell.push(new google.maps.LatLng(f,d));
                         		//console.log(hell);
                     		}
                     		loadVector5623(hell);
                     		
                     		hell=[];
                  			for(var j=0;j<route6702.length;j++){
                     			var f=route6702[j].gpsY;
                         		var d=route6702[j].gpsX;
                         		hell.push(new google.maps.LatLng(f,d));
                     		}
                  			loadVector6702(hell);
                  			
                  			
                  			hell=[];
                  			for(var j=0;j<route9000.length;j++){                          		
                     			var f=route9000[j].gpsY;
                         		var d=route9000[j].gpsX;
                         		hell.push(new google.maps.LatLng(f,d));
                     		}
                  			loadVector9000(hell);
                  			
                  			
                  			hell=[];
                  			for(var j=0;j<route6501.length;j++){
                     			var f=route6501[j].gpsY;
                         		var d=route6501[j].gpsX;
                         		hell.push(new google.maps.LatLng(f,d));
                     		}
                  			loadVector6501(hell);
                  			hell=[];
                  			
                        }else{
                   	   		console.log("1개 경로 노선");
                   			console.log(data2.length);                          	
                   			var hell =new Array();
                   			for(var j=0;j<data2.msgBody.length;j++){
                   				var f=parseFloat(data2.msgBody[j].gpsY);
                       			var d=parseFloat(data2.msgBody[j].gpsX);
           		      			hell.push(new google.maps.LatLng(f,d));
                   			}    							
                        	loadVector(hell);
                   	  	}
                	}
           		}); */
    	
    	//비동기로 정류장 생성
    	/* $.ajax({
            url : "busStopRoad.admin",
            type : "get",
            dataType : "json",
            data : {r_num:"all"},
            success : function(data) {
                console.log("읽어옴?");
                console.log(data);                                                                                                               	                                                                  	                       	   
                originalMarkerMake(data, map);                     	                 	                     	
            }        		
        }); */
    	
    	//비동기로 노선 전체 버스를 위치추적한다.
    	/* stopSearch = setInterval(function(){
    		$.ajax({
                url : "RealTimeSearch.admin",
                type : "get",
                dataType : "json",
                data : {r_num:"all"},
                success : function(data) {                   	
                	 
                	if(data.length == 4){
                		console.log("멀티위치추적");
                		console.log(data.length);
                		console.log(data[0].msgBody.itemList);
                		console.log(data[1].msgBody.itemList);
                		console.log(data[2].msgBody.itemList);
                		console.log(data[3].msgBody.itemList);
                		
                		movingBusMarker(data[0].msgBody.itemList, map);
                		movingBusMarker2(data[1].msgBody.itemList, map);
                		movingBusMarker3(data[2].msgBody.itemList, map);
                		movingBusMarker4(data[3].msgBody.itemList, map);
                		
                		console.log("멀티추적된다");
                	}else{
                		console.log("혼자 추적");
                		console.log(data.msgBody.itemList);
                		movingBusMarker(data.msgBody.itemList, map);
                		console.log("너되니");
                	}        
                	           		  	
                }
            });  		
    	},30000); */
    
    	
    	$("#selectBus").change(function() {
    		deleteRoute();
    		polyRemove();
    		busMarkerRemove();          	
        	if($("#selectBus").val() !=null){       		             		
        		$.ajax({
                   	url : "busRouteSearch.admin",
                   	type : "get",
                   	dataType : "json",
                   	data : {r_num:$("#selectBus").val()},
                   	success : function(data2) {
                    	console.log("읽어옴?");
                      	//console.log(data2);                              	                                                                  	                       
                      	//노선 전체로드 현재 안됨...
                      	if(data2.length == 4){
                     	   
                      		var hell =new Array();
                 			var route5623;
                 			var route6702;
                 			var route9000;
                 			var route6501
                 			
                     		console.log("4개 경로노선");
                     		console.log(data2.length);
                     		
                     		for(var j=0;j<data2.length;j++){
                     			route5623 = data2[0].msgBody;
                     			route6702 = data2[1].msgBody;
                     			route9000 = data2[2].msgBody;
                     			route6501 = data2[3].msgBody;
                     		}
                     		//console.log(route5623);
                     		
                     		for(var j=0;j<route5623.length;j++){
                     			var f=route5623[j].gpsY;
                         		var d=route5623[j].gpsX;
                         		hell.push(new google.maps.LatLng(f,d));
                         		//console.log(hell);
                     		}
                     		loadVector5623(hell);
                     		
                     		hell=[];
                  			for(var j=0;j<route6702.length;j++){
                     			var f=route6702[j].gpsY;
                         		var d=route6702[j].gpsX;
                         		hell.push(new google.maps.LatLng(f,d));
                     		}
                  			loadVector6702(hell);
                  			
                  			
                  			hell=[];
                  			for(var j=0;j<route9000.length;j++){                          		
                     			var f=route9000[j].gpsY;
                         		var d=route9000[j].gpsX;
                         		hell.push(new google.maps.LatLng(f,d));
                     		}
                  			loadVector9000(hell);
                  			
                  			
                  			hell=[];
                  			for(var j=0;j<route6501.length;j++){
                     			var f=route6501[j].gpsY;
                         		var d=route6501[j].gpsX;
                         		hell.push(new google.maps.LatLng(f,d));
                     		}
                  			loadVector6501(hell);
                  			hell=[];
                  			
                        }else{
                   	   		console.log("1개 경로 노선");
                   			console.log(data2.length);                          	
                   			var hell =new Array();
                   			for(var j=0;j<data2.msgBody.length;j++){
                   				var f=parseFloat(data2.msgBody[j].gpsY);
                       			var d=parseFloat(data2.msgBody[j].gpsX);
           		      			hell.push(new google.maps.LatLng(f,d));
                   			}    							
                        	loadVector(hell);
                   	  	}
                	}
           		});
        		
        		$.ajax({
                    url : "busStopRoad.admin",
                    type : "get",
                    dataType : "json",
                    data : {r_num:$("#selectBus").val()},
                    success : function(data) {
                       console.log("읽어옴?");
                       console.log(data);                                                                                                              	                                                                  	                       	   
                    	   originalMarkerMake(data, map);
                       	                 	                     	
                    }        		
        		});
        	}
    	});    	   		    	          
             
        //실시간 위치추적 중지
        $("#SearchStop").click(function() {
        	clearInterval(stopSearch);
        	console.log("너되냐");
        	alert("위치추적이 중지되었습니다. 다시 추적하실경우 이 페이지를 새로고침 하십시오");
        });
               
        
        $("#Search").click(function() {
        	//stopSearch = setInterval(function(){
        		$.ajax({
                    url : "RealTimeSearch.admin",
                    type : "get",
                    dataType : "json",
                    data : {r_num:$("#selectBus").val()},
                    success : function(data) {                   	
                    	console.log(data);
                    	if(data.length == 4){
                    		console.log("멀티위치추적");
                    		console.log(data.length);
                    		console.log(data[0]);
                    		console.log(data[1]);
                    		console.log(data[2]);
                    		console.log(data[3]);
                    		
                    		movingBusMarker1(data[0], map);
                    		movingBusMarker2(data[1], map);
                    		movingBusMarker3(data[2], map);
                    		movingBusMarker4(data[3], map);
                    		
                    		console.log("멀티추적된다");
                    	}else{
                    		console.log("혼자 추적");
                    		console.log(data[0].msgBody.itemList);
                    		movingBusMarker(data, map);
                    		console.log("너되니");
                    	}
                    	           		  	
                    }
                });  		
        	//},30000);
        });
        
        
        $("#selectRoute").change(function(){
        	$.ajax({
                url : "RouteTypeRouteNo.admin",
                type : "get",
                dataType : "json",
                data : {r_type:$("#selectRoute").val()},
                success : function(data) {                   	
                	console.log("노선타입 전송잘되냐?");
                	console.log(data);
                }#
        	});
        });
        
    });//ready 함수 끝
   </script>
	<!-- 구글 맵 인증키 -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiviyGXEVDNM2G1FB323aGa4kyKgVouw8&callback=initMap">    
      </script>
  </body>
</html>
