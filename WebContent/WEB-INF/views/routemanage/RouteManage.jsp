<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%
   request.getCharacterEncoding();
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0">
<meta charset="utf-8">
<style type="text/css">
html, body {
   height: 100%;
   margin: 0;
   padding: 0;
}

#map {
   height: 80%;
}
</style>
<!-- <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script> -->
</head>
<!-- Bootstrap -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Font Awesome -->
<link
	href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css"
	rel="stylesheet">
<!-- NProgress -->
<link
	href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/build/css/custom.min.css"
	rel="stylesheet">

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/bootstrap-3.3.7/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<link
	href="${pageContext.request.contextPath}/bootstrap-3.3.7/assets/css/ie10-viewport-bug-workaround.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/bootstrap-3.3.7/assets/css/carousel/carousel.css"
	rel="stylesheet">

<!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
<!--[if lt IE 9]><script src="../../assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
<script
	src="${pageContext.request.contextPath}/bootstrap-3.3.7/assets/js/ie-emulation-modes-warning.js"></script>


<!-- jQuery -->
		<script
			src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
		<!-- Bootstrap -->
		<script
			src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
		<!-- FastClick -->
		<script
			src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
		<!-- NProgress -->
		<script
			src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
		<!-- jQuery Smart Wizard -->
		<script
			src="${pageContext.request.contextPath}/vendors/jQuery-Smart-Wizard/js/jquery.smartWizard.js"></script>
		<!-- Custom Theme Scripts -->
		<script
			src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>
<body>
	<header>
		<jsp:include page="/sidebar/header.jsp" />
	</header>
   <div id="map"></div>
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
            fuck(marker,markers);          
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
              fuck(marker,markers);          
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
         console.log("개좆나");
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
      function fuck(marker,markers){
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
   <script
      async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiviyGXEVDNM2G1FB323aGa4kyKgVouw8&callback=initMap">    
      </script>
   <input type="button" id="routeSave" value="좌표저장">
   <input type="button" id="routeRead" value="저장된 경로 불러오기">
   <input type="button" id="routeRemove" value="경로 지우기">
   <input type="button" id="routeEdit" value="경로 수정">
   <input type="button" id="routeEditRead" value="수정 경로 불러오기">
   <div>
      <input id="address" type="text" placeholder="장소명을 입력해주세요">
      <input id="submit" type="button" value="Geocode">
    </div>
    <div id="map"></div>
    
    
    <footer>
		<jsp:include page="/sidebar/footer.jsp" />
	</footer>
</body>
</html>