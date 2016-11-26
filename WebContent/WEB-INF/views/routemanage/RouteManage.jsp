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
     <div class="container" id="map" style="width:800px;height:500px; border: solid black 1px; margin-left:auto; margin-right: auto;">
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
     
     //지도위에 생성한 마커들을 배열에 담을려는 변수     
     var markers=new Array();
     
     var markers2=new Array();
     //마커의 전역변수
     var marker;
      
      //출발 좌표 변수
      var locationX;
      var locationY;

      //도착 좌표 변수
      var elocationX;
      var elocationY;                       
      
      
      //경로 를 그리기 위해 지도위에 찍었던 마커들을 배열에 담아 파일에 저장하기위한 변수
      var savelocations = new Array();
      var savelocation;
      
      var Dsavelocations = new Array();
      var Dsavelocation;
      //addgeojason 해서 지도위에 경로를 그리고 , 노선을 수정할때 바로 전에 경로를 지워주기 위해 전역변수로 뺌. 
      var features;
      
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
            placeMarkerAndPanTo(e.latLng, map);           
         });
        
        //지오코더 이벤트
        var geocoder = new google.maps.Geocoder();
        document.getElementById('submit').addEventListener('click', function() {
           geocodeAddress(geocoder, map);
        });                    
        
        //교통 지도
        var trafficLayer = new google.maps.TrafficLayer();
        trafficLayer.setMap(map);
      }
      
      
      
      //장소 명 을 입력받아 마커생성
      function geocodeAddress(geocoder, resultsMap) {
         var address = document.getElementById('address').value;
         geocoder.geocode({'address': address}, function(results, status) {
           if (status === google.maps.GeocoderStatus.OK) {
             resultsMap.setCenter(results[0].geometry.location);
             var marker = new google.maps.Marker({
               map: resultsMap,
               position: results[0].geometry.location
             });
             markers.push(marker);
             markerArrayMake(markers);            
           } else {
             alert('Geocode was not successful for the following reason: ' + status);
           }
         });
       }
      
      //노선을 그리기 위한 마커를 생성하는 함수.
      function fplaceMarkerAndPanTo(latLng, map) {
         marker = new google.maps.Marker({
            position : latLng,
            map : map,
            draggable : true
         });
         map.panTo(latLng);
         
         markers2.push(marker);
         console.log("뭐냐대체:"+JSON.stringify(latLng));
         
         markers.push(marker);
         console.log("마커의 길이:"+markers.length);
         //마커 배열 result
         fmarkerArrayMake(markers);
         
         //마커의 드래그가 끝날때마다 지도위에 그려진 경로를 지워준다..(노선을 수정할때...)
         marker.addListener('dragend', function() {
            console.log("마커 :"+markers.length);
            dragLocation(marker,markers);          
         });
         
      }
      function placeMarkerAndPanTo(latLng, map) {
           marker = new google.maps.Marker({
              position : latLng,
              map : map,
              draggable : true
           });
           map.panTo(latLng);
         
           console.log("뭐냐대체:"+JSON.stringify(latLng));
           
           markers.push(marker);
           console.log("마커의 길이:"+markers.length);
           //마커 배열 result
           markerArrayMake(markers);
           
           //마커의 드래그가 끝날때마다 지도위에 그려진 경로를 지워준다..(노선을 수정할때...)
           marker.addListener('dragend', function() {
        	  dragLocation(marker,markers);          
           });
           
        }
        
    
      //마커 배열 result
      function markerArrayMake(markers){
         console.log("마돈ㄴ");
            var x;
            for(var i=0; i<markers.length; i++){
               markers[i].getPosition().lng(); //X
               markers[i].getPosition().lat(); //Y              
               x=i;
            }
            
            //출발마커
            if(x==0 && markers.length == 1){
               locationX = markers[0].getPosition().lng();
                locationY = markers[0].getPosition().lat();
                console.log("출발마커"+ x);
                console.log(locationX +","+ locationY);
                
                savelocation = {
                      lng : locationX,
                      lat : locationY
                }
                savelocations.push(savelocation);
                
            }
            
            //도착 마커
            if(x==1 && markers.length ==2){
               elocationX = markers[x].getPosition().lng();
                elocationY = markers[x].getPosition().lat();
                console.log("왔니" + x);             
                
                savelocation = {
                      lng : elocationX,
                      lat : elocationY
                }
                savelocations.push(savelocation);
                
                routeDraw(locationX, locationY, elocationX, elocationY);
            }
            
            //도착마커
            if(x==2 && markers.length == 3){                                          
               locationX = markers[x-1].getPosition().lng();
                locationY = markers[x-1].getPosition().lat();                                                                                       
              
                console.log("출발마커" + (x-1));
                console.log(locationX +","+ locationY);
                
              elocationX = markers[x].getPosition().lng();
                elocationY = markers[x].getPosition().lat();
                
                savelocation = {
                      lng : elocationX,
                      lat : elocationY
                }
                savelocations.push(savelocation);
                
                console.log("도착마커" + x);
                console.log(elocationX +","+ elocationY);              
                routeDraw(locationX, locationY, elocationX, elocationY);
            }
            
            //마커 4개 이상.
            if(x>2 && markers.length > 3){                                                                                                         
               locationX = markers[x-1].getPosition().lng();
                locationY = markers[x-1].getPosition().lat();
                console.log("출발마커" + (x-1));
                console.log(locationX +","+ locationY);
                
              	elocationX = markers[x].getPosition().lng();
                elocationY = markers[x].getPosition().lat();
                
                console.log("도착마커" + x);
                console.log(elocationX +","+ elocationY);
                
                savelocation = {
                      lng : elocationX,
                      lat : elocationY
                }
                savelocations.push(savelocation);
                routeDraw(locationX, locationY, elocationX, elocationY);               
            }   
          
         }
      
      function fmarkerArrayMake(markers){
         console.log("드래그 함수 탑니까?");
         if(markers.length !=null){
             for(var i=0; i<=markers.length-1; i++){
         if(i==0){
        	 locationX = markers[i].getPosition().lng();
          	 locationY = markers[i].getPosition().lat();
          	 console.log("출발마커1");
          	 console.log(locationX +","+ locationY); 
         }
      
          //출발마커
          else if(i>=1){
              elocationX = markers[i].getPosition().lng();
              elocationY = markers[i].getPosition().lat();
              console.log("도착마커" + i);
              console.log(elocationX +","+ elocationY);
              routeDraw(locationX, locationY, elocationX, elocationY);
             }
             }
          }
       }
      
      //좌표 드래그 했을때 값 
      function dragLocation(marker,markers){
         locationX= marker.getPosition().lng(); //X
          locationY= marker.getPosition().lat(); //Y 
    
             for(var i=0;i<=markers.length-2;i++){
 
             //elocationX=markers.slice([i],markers[i].getPosition().lng());
             //elocationY=markers.slice([i],markers[i].getPosition().lat());

             elocationX=markers[i].getPosition().lng();
              elocationY=markers[i].getPosition().lat();

              routeDraw(locationX,locationY, elocationX, elocationY);
              console.log("로케이션 :"+locationX+"/"+locationY);
              console.log("로케이션2 "+[i]+":"+elocationX+","+ elocationY);
              console.log("----------------------------------------");
                
             }
             map.data.forEach(function(features) {
                  map.data.remove(features);
              });
               
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

      //좌표저장
      $(function() {
        $("#routeSave").click(function() {  

            
           $.ajax({
                url : "routeSave.admin",
                type : "get",                          
                data : {
                   kml : JSON.stringify(savelocations)
                },
                success : function(data) {
                   console.log("저장잘됨?");                   
                }
             });
        });
        
        
        //파일에서 좌표 불러오기
         $("#routeRead").click(function() {
           $.ajax({
                url : "routeRead.admin",
                type : "get",
                dataType : "json",                
                success : function(data) {
                   console.log("읽어옴?");
                   console.log(data.length);
                   //파일이 읽혔으면, 읽어온 좌표들을 for문으로 마커를 생성하는 함수 호출.
                   for(var i=0; i<data.length; i++){
                      placeMarkerAndPanTo(data[i], map);      
                   } 
                }
             });
         });

        //지도 위에 그려저있는 마커, 경로 지우기
         $("#routeRemove").click(function() {           
           console.log(map.data);
           map.data.forEach(function(features) {
                 console.log(features);
                 map.data.remove(features);
              });
           for(var i=0; i<markers.length; i++){
               markers[i].setMap(null);
            }   
           for(var i=0; i<markers2.length; i++){
               markers2[i].setMap(null);
            }   
              markers.length=0;
              console.log(markers.length);
              markers2.length=0;
              console.log(markers2.length);
              marker=0;
              Dsavelocations =[];
              markers=[];
              markers2=[];
              
         });
        
        //수정 저장하기
          $("#routeEdit").click(function() {

             if (markers2.length ==0) {
                console.log("오냐")
             Dsavelocation = {
                      lng : locationX,
                      lat : locationY
                }
              Dsavelocations.push(Dsavelocation);
            
             for(var i=0;i<markers.length-1;i++){
               
                 elocationX=markers[i].getPosition().lng();
                  elocationY=markers[i].getPosition().lat();

              Dsavelocation = {
                      lng : elocationX,
                      lat : elocationY
                }
              Dsavelocations.push(Dsavelocation); 
             }

             }else {
                 Dsavelocation = {
                         lng : locationX,
                         lat : locationY
                   }
                 Dsavelocations.push(Dsavelocation);

               var smile=markers.splice(0,markers2.length);
               console.log("??:"+smile.length);
                for(var i=0;i<smile.length-1;i++){
                   
                   elocationX=smile[i].getPosition().lng();
                  elocationY=smile[i].getPosition().lat();
                  console.log("씨발???"+elocationX);
               
                 Dsavelocation = {
                         lng : elocationX,
                         lat : elocationY
                 }
                 Dsavelocations.push(Dsavelocation); 
                }
         	}
            //노선 수정 저장.
              $.ajax({
                 url : "routeEdit.admin",
                 type : "get",                          
                 data : {
                    kml : JSON.stringify(Dsavelocations)
                 },
                 success : function(data) {
                    console.log("될까??"); 
                 }
              });
              
           });
        
          $("#routeEditRead").click(function() {
              $.ajax({
                   url : "routeEditRead.admin",
                   type : "get",
                   dataType : "json",                
                   success : function(data) {
                      console.log("읽어옴?");
                      console.log(data.length);
                      //파일이 읽혔으면, 읽어온 좌표들을 for문으로 마커를 생성하는 함수 호출.
                      for(var i=0; i<data.length; i++){
                         fplaceMarkerAndPanTo(data[i], map);      
                      } 
                   }
                });
          });
      });
            
   </script>
	<!-- 구글 맵 인증키 -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiviyGXEVDNM2G1FB323aGa4kyKgVouw8&callback=initMap">    
      </script>
  </body>
</html>
