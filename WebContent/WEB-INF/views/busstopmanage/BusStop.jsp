<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix = "se" uri = "http://www.springframework.org/security/tags" %>
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
 #map { margin-left:auto; margin-right:auto; width:95%; }
    
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

          <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
     <div class="container" id="map" style="width:auto;height:500px; border: solid black 1px; margin-left:auto; margin-right: auto;">
		</div>
            </div>
            	<div class="col-sm-3"></div>
            	<div class="col-sm-6">
            <input type="button" id="newsave" value="좌표저장">
			<input type="button" id="saveReturn" value="저장된 경로 불러오기">
			<input type="button" id="routeRemove" value="경로 지우기">
			<input type="button" id="busStopLoad" value="버스 정류장 보기">
			<input type="button" id="busLoad" value="버스 보기">
             </div>

          </div>
          <br />
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
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
    
    //출발 좌표 변수
    var locationX;
    var locationY;

    //도착 좌표 변수
    var elocationX;
    var elocationY;                       
    
    
    //경로 를 그리기 위해 지도위에 찍었던 마커들을 배열에 담아 파일에 저장하기위한 변수
    var savelocations = new Array();
    var savelocation;
    
    //addgeojason 해서 지도위에 경로를 그리고 , 노선을 수정할때 바로 전에 경로를 지워주기 위해 전역변수로 뺌. 
    var features;
    
    var dataArray = new Array();
    
    //원본 정류장 좌표 로 부터 새로 저장한후 불러올떄 좌표들을 저장할 배열변수
    var copyMarkers = new Array();
    
    
    //원본 정류장 파일로부터 좌표를 담을 배열변수
    var originalMarkers = new Array();
   
   
   	//마커의 번호를 부여하기 위한 변수.
    var as=0;
   	
    //지도 기본 위치 , 마커 기본위치 가 됨.  
    //현 기본 좌표 : 판교역
    var myLatLng = {
    	lat : 37.39489285215817,
     	lng : 127.11115658283234
    };
    
    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
           center : myLatLng,
           zoom : 15
        });

        //지도 를 마우스를 클릭시 마커를 생성하는 함수 호출.      
          map.addListener('click', function(e) {               
        	  copyMarkerMakes(e.latLng, map);
        });                                                    
       
       //교통 지도
       var trafficLayer = new google.maps.TrafficLayer();
       trafficLayer.setMap(map);
    }
    
     //버스 정류장 원본 파일로 좌표 읽어와서 마커 생성
    function originalMarkerMake(latLng, map) {
        var originalMarker = new google.maps.Marker({
            position: latLng,
           	map: map,
           	//label: latLng.title,
           	animation: google.maps.Animation.DROP,
           	icon : '${pageContext.request.contextPath}/images/cccc.png',
           	draggable : true,
           	zindex : "5"
        });
     
        var infowindow = new google.maps.InfoWindow({
            content: latLng.title
        }); 
     
        originalMarker.addListener('click', function() {      
        	infowindow.open(map, originalMarker);
      	});
           
        originalMarkers.push(originalMarker);
        originalMarkersRead(originalMarkers);
        
        //버스 가 움직이기 위해 좌표 배열에 저장
        dataArray.push(latLng);
        
        
    }
     
  //버류 정류장 수동 생성
    function copyMarkerMakes(latLng, map) {
	  	//마커의 번호를 부여하기 위해 사용.
       	as++;
	  	
        var copyMarker = new google.maps.Marker({
        	position: latLng,        
           	map: map,
           	label : as.toString(),
           	animation: google.maps.Animation.DROP,
           	icon : '${pageContext.request.contextPath}/images/cccc.png',
           	draggable : true
        });    
           
        copyMarkers.push(copyMarker);

		//마커 드래그 끝났을떄
      	copyMarker.addListener('dragend', function() {
      		
      		//마커 라벨을 얻어와 담을 변수
            var markerLabel = copyMarker.getLabel();
      		
      		//마커를 드래그후 마커의 좌표를 담기위한 변수
            var dragendX= copyMarker.getPosition().lat;
            var dragendY= copyMarker.getPosition().lng;
              
           
            for(var i=0; i<copyMarkers.length;i++){
                console.log(copyMarkers.length);
                console.log("bmarker ? "+copyMarkers[i]);
                
                if(copyMarkers[i].getLabel() == markerLabel){
                    //console.log("라벨:"+ markerLabel);        
                    //console.log(bmarkers[i].getPosition());
                    //console.log(bmarkers[i]);
                    //console.log(bmarkers[i].getPosition().lng);
                    //console.log(bmarkers[i].getPosition().lat);
                    copyMarkers[i].getPosition().lat = dragendX;
                    copyMarkers[i].getPosition().lng = dragendY;
                    //console.log("bmarkers 좌표 ??:"+bmarkers[i].getPosition());
                      
                }
                 
            }
            console.log(copyMarker.getLabel());         
     	});
		
		
      
      	//마커의 라벨 이름을 알기위해 적용. 추후삭제 할것
      	copyMarker.addListener('click', function() {         
        	console.log(copyMarker.getLabel());
      	});
      	
      //버스 가 움직이기 위해 좌표 배열에 저장
      	dataArray.push(latLng);
   	}
    
    
  
    //버스정류장 원본 파일에서 읽어온 버스정류장 좌표 
    function originalMarkersRead(originalMarkers){
        var x;
        for(var i=0; i<originalMarkers.length; i++){
        	x=i;
        }
          
        //출발마커
        if(x==0 && originalMarkers.length == 1){
            locationX = originalMarkers[0].getPosition().lng();
            locationY = originalMarkers[0].getPosition().lat();
            console.log("출발마커"+ x);
            console.log(locationX +","+ locationY);
              
            savelocation = {
                lng : locationX,
                lat : locationY
            }
            savelocations.push(savelocation);
        }
          
        //도착 마커
        if(x==1 && originalMarkers.length == 2){
            elocationX = originalMarkers[x].getPosition().lng();
            elocationY = originalMarkers[x].getPosition().lat();
            console.log("도착마커"+ x);             
            console.log(elocationX +","+ elocationY); 
            
            savelocation = {
            	lng : elocationX,
                lat : elocationY
            }
            savelocations.push(savelocation);
            routeDraw(locationX, locationY, elocationX, elocationY);
              
        }
          
        //도착마커
        if(x==2 && originalMarkers.length == 3){                                          
            locationX = originalMarkers[x-1].getPosition().lng();
            locationY = originalMarkers[x-1].getPosition().lat();                                                                                       
            
            console.log("출발마커"+ (x-1));
            console.log(locationX +","+ locationY);
              
            elocationX = originalMarkers[x].getPosition().lng();
            elocationY = originalMarkers[x].getPosition().lat();
              
            savelocation = {
                lng : elocationX,
                lat : elocationY
            };
            
            savelocations.push(savelocation);
              
                console.log("도착마커"+x);
                console.log(elocationX +","+ elocationY);              
                routeDraw(locationX, locationY, elocationX, elocationY);
          	}
          
          //마커 4개 이상.
          if(x>2 && originalMarkers.length > 3){                                                                                                         
            	locationX = originalMarkers[x-1].getPosition().lng();
                locationY = originalMarkers[x-1].getPosition().lat();
                console.log("출발마커"+ (x-1));
                console.log(locationX +","+ locationY);
              
               	elocationX = originalMarkers[x].getPosition().lng();
                elocationY = originalMarkers[x].getPosition().lat();
              
                console.log("도착마커"+x);
                console.log(elocationX +","+ elocationY);
              
                savelocation = {
                    lng : elocationX,
                    lat : elocationY
                };
                savelocations.push(savelocation);
                
                routeDraw(locationX, locationY, elocationX, elocationY);               
          }          
       }
    
    //경로 그리는 함수
    function routeDraw(locationX, locationY, elocationX, elocationY) {           
          //티맵 으로 부터 데이터를 GeoJson 형식으로 가져와서 지도에 그려준다.
          map.data.setStyle({
				strokeWeight: 5,
				strokeColor:'blue'
			});
           $.getJSON("https://apis.skplanetx.com/tmap/routes?version=1&format=json&reqCoordType=WGS84GEO&resCoordType=WGS84GEO&startX="
                   + locationX
                   + "&startY="
                   + locationY
                   + "&endX="
                   + elocationX
                   + "&endY="
                   + elocationY
                   + "&searchOption=10&appKey=cc15578e-061d-3387-9d44-a405a43c034e",
                   
                   
                function (data) {
                   //console.log(data);                    
                   //type:"LineString"
                   	for(var i=0; i<data.features.length; i++){
                      if(data.features[i].geometry.type == 'LineString'){
                    	  features = map.data.addGeoJson(data.features[i]);
                      }               
                    }                                                                                                                                                                                                                                   
                }
           );           
    }
    
    //움직이는 버스마커
    function movingBusMarker(dataArray, map){
    	//console.log(dataArray);
    	var BusMarker = new google.maps.Marker({
            position: new google.maps.LatLng(dataArray[0].lat,dataArray[0].lng),
            icon:'${pageContext.request.contextPath}/images/bus.png',
           	map: map      
        });
    	
    	moveBus(BusMarker, map);
    }
    
    function moveBus(BusMarker) { 
    	var i=0;
    	setInterval(function(){
    		if(i == dataArray.length){
    			return false;
    		}else{
    			console.log(dataArray[i]);
    			BusMarker.setPosition(new google.maps.LatLng(dataArray[i].lat,dataArray[i].lng));
    		}
    		i++;
    	},1000); 	
    };
    
    $(function() {
       	//새로운 좌표 저장
        $("#newsave").click(function() {
           /*
           	새로 변경된 좌표들을 파일에 저장하기 위해 
           	for문을 돌리면서 editX 에 lng , editY 에 lat 좌표를 담고
           	savelocation 에 lng, lat 키 로하고,  editX ,editY 변수를 값으로 한다. 
           */
           var editX;
           var editY;
           for(var i=0;i<copyMarkers.length;i++){
        	   editX = copyMarkers[i].getPosition().lng();
        	   editY = copyMarkers[i].getPosition().lat();
        	   savelocation = {
                    lng : editX,
                    lat : editY
               };
        	   savelocations.push(savelocation);
            
           }
           $.ajax({
                url : "busStoplocationEdit.admin",
                type : "get",                          
                data : {
                    kml : JSON.stringify(savelocations)
                },
                success : function(data) {
                    console.log("저장잘됨?");
                }
            });
       	});
       
       
      //추가된 버스정류장 파일에서 좌표 불러오기
        $("#saveReturn").click(function() {
        	copyMarkers=[];
          	$.ajax({
               	url : "busStoplocationEditRead.admin",
               	type : "get",
               	dataType : "json",                
               	success : function(data) {
                  	console.log("읽어옴?");
                  	//파일이 읽혔으면, 읽어온 좌표들을 for문으로 마커를 생성하는 함수 호출.
                  	for(var i=0; i<data.length; i++){         
                  		copyMarkerMakes(data[i], map);                  
                  	}               
               	}
            });
        });
      
      //지도 위에 그려저있는 마커, 경로 지우기
        $("#routeRemove").click(function() {                 
            map.data.forEach(function(features) {
                //console.log(features);
            	map.data.remove(features);
            });
            
            for(var i=0; i<bmarkers.length; i++){
            	copyMarkers[i].setMap(null);
            }
            
            copyMarkers.length = 0;
        });
      
      //버스 정류장 원본 파일 불러오기
        $("#busStopLoad").click(function() {
           $.ajax({
                url : "busStopOriginalRead.admin",
                type : "get",
                dataType : "json",                
                success : function(data) {
                   console.log("읽어옴?");
                   
                   for(var i=0; i<data.length; i++){                     
                      originalMarkerMake(data[i], map);
                      //dataArray.push(data[i]);                     
                   }
                }
             });
        });
      
      $("#busLoad").click(function() {
    	  movingBusMarker(dataArray, map);
    	  //moveBus(BusMarker, map);
      });
    });//ready 함수 끝
   </script>
	<!-- 구글 맵 인증키 -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiviyGXEVDNM2G1FB323aGa4kyKgVouw8&callback=initMap">    
      </script>
  </body>
</html>
