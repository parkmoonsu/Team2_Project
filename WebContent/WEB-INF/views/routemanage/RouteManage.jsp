 <!-- 
	@FileName : RouteManage.jsp
	@Project	: KosBus
	@Date	: 2016. 12.02
	@Author	: 김용현,김지현
	@Discription : 노선관리 페이지
 -->
 
 
 
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


<script
	src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>

<title>RoadOneBell</title>

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
<!-- iCheck -->
<link
	href="${pageContext.request.contextPath}/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">
<!-- bootstrap-progressbar -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link
	href="${pageContext.request.contextPath}/vendors/jqvmap/dist/jqvmap.min.css"
	rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/build/css/custom.min.css"
	rel="stylesheet">
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<style type="text/css">
.element { #map { margin-left:auto;
	margin-right: auto;
	width: 95%;
}

}
select#selectBus, #selectRoute, #selectBuscopy, #selectBusStopEdit {

	-webkit-appearance: button btn-sm;
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
	width: 140px;
	border-radius: 8px;
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
        <div class="row tile_count"></div>
        <div class="">
			<div class="page-title">
				<div class="title_left">
					<h3>
						<small>노선 수정&확인</small>
					</h3>
				</div>

			</div>
			<div class="x_panel">
          <div class="row" style="text-align: right">
            <div class="col-md-12 col-sm-12 col-xs-12">
            
            
            <button id="newsave" class="btn btn-default btn-sm">저장하기</button>
			<button id="busStart" class="btn btn-default btn-sm">시뮬레이션 시작</button>
			
			
			
				<select id="selectRoute">
					<option>노선종류</option>
					<c:forEach var="i" items="${list}">
					<option value="${i.bd_num}">${i.bd_name}</option>					
					</c:forEach>																	
				</select>
												
				<select id="selectBus">
					<option>노선 선택</option>									
				</select>
				
				<select id="selectBuscopy">
					<option>수정노선 선택</option>									
				</select>
				
				<select id="selectBusStopEdit">
					<option>수정정류장 선택</option>									
				</select>
										
     			<div class="container" id="map" style="width:auto;height:500px; border: solid black 1px; margin-left:auto; margin-right: auto;"></div>
            </div>
            </div>
            <div class="col-sm-3"></div>
            <div class="col-sm-6">            	
				<div id="map"></div>
            </div>
          </div>
          </div>
          <br />       
        	<!-- /page content -->

        	<!-- footer content -->
        	<footer>
				<jsp:include page="/sidebar/footer.jsp"></jsp:include>
				<div class="clearfix"></div>
			</footer>
        	<!-- /footer content -->
        </div>
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
   
   	var poly;
	
   	var BusMarker;

   	var stopSearch;
   	
    //현 기본 좌표 : 판교역
    var myLatLng = {
    	lat : 37.462050994737076,
     	lng : 126.96109771728516
    };
   
    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
           center : myLatLng,
           zoom : 11
        });                                                  
       
       	//교통 지도
       	var trafficLayer = new google.maps.TrafficLayer();
       	trafficLayer.setMap(map);
       
	   	poly = new google.maps.Polyline({ 	   	  
		    strokeOpacity: 1.0,
		    strokeWeight: 2,
	  	});
		poly.setMap(map);
    }
    
    function polyRemove(){
		if(poly !=null){
			poly.setMap(null);
		}
    }
    
    
    function loadVector(data){
     	console.log("옴?");
     	//console.log(data);
     	poly = new google.maps.Polyline({
     		editable: true,
     		path: data,
     	    strokeColor: 'red',
     	    strokeOpacity: 1.0,
     	    strokeWeight: 2,
       	});
     	poly.setMap(map);
    }
    
    function loadVector2(data){
     	console.log("옴?");
     	//console.log(data);
     	poly = new google.maps.Polyline({
     		//editable: true,     	
     		path: data,
     	    strokeColor: 'red',
     	    strokeOpacity: 1.0,
     	    strokeWeight: 2,
       	});
     	poly.setMap(map);
    }
    
    
    function movingBusMarker(data,data2,map){   
    	console.log("시뮬레이션 좌표데이터 ? 오냐");
    	//console.log(data);
    	
    	
        	 BusMarker = new google.maps.Marker({
           		map: map,
           		position:new google.maps.LatLng(data[0].r_y, data[0].r_x),
           		icon:"${pageContext.request.contextPath}/images/bus.png"
        	});
        	BusMarker.setMap(map);
        	 
        	
    		
        	var infowindow = new google.maps.InfoWindow({ maxWidth: 400 });
			if(data2 == null){
				(function (BusMarker, data2, infowindow) {
	     	        google.maps.event.addListener(BusMarker, "click", function (e) {
	     	            infowindow.setContent('<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif; color: black;"  align="left">매칭된 기사없음</p>');
	     	            infowindow.open(map, BusMarker);
	     	           
	     	        });
	     	    })(BusMarker, data2, infowindow);		
			}else{								
				(function (BusMarker, data2, infowindow) {										
	     	        	google.maps.event.addListener(BusMarker, "click", function (e) {							
	     	            	infowindow.setContent('<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif; color: black;"  align="left">' +"<b>노선번호</b>: "+ data2.r_num + "<br>"+ "<b>차량번호</b>: "+ data2.b_vehiclenum +"<br>"+ "<b>기사명</b>: "+ data2.m_name + "<br>"+'</p>');
	     	            	infowindow.open(map, BusMarker);	     	           							
	     	        	});			
	     	    })(BusMarker, data2, infowindow);				
			}		
     	    console.log("너 마커 새로 생성안함??");       		       		       		      		       
        	busmoveBus(BusMarker, map, data);
        	
        	
    }
    
    function busmoveBus(BusMarker, map, data) {
    	 var i=0;
    	copystopSearch = setInterval(function(){
    		if(i == data.length){
    			return false;
    		}else{    			
    			BusMarker.setPosition(new google.maps.LatLng(data[i].r_y, data[i].r_x));
    		}
    		i++;
    	},1000); 	
    };
	
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
	          		zindex : "1"
	       	});
	    	   
	    		
    	  	var infowindow = new google.maps.InfoWindow({ maxWidth: 400});  
    	    
    	  	(function (originalMarker, latLng, infowindow) {
    	        google.maps.event.addListener(originalMarker, "click", function (e) {
    	            infowindow.setContent('<p style="margin:7px 22px 7px 12px;font:12px/1.5 sans-serif; color: black;"  align="left">' +"<b>정류장 명</b>:"+ latLng.s_name+ "<br>"+ "<b>정차순서</b>:"+latLng.rs_order+"<br>"+ "<b>정류장번호</b>:"+ latLng.s_num + "<br>"+'</p>');    	            
    	            infowindow.open(map, originalMarker);
    	           
    	        });
    	    })(originalMarker, latLng[i], infowindow);

    	  	map.panTo(originalMarker.getPosition());
    	  	originalMarkers.push(originalMarker);
           
   		}//for문 끝
   	}
    
    $(function() {
    	
    	$("#selectBus").change(function() {
    		polyRemove();      	
        	if($("#selectBus").val() !=null){       	
        		//버스경로 읽어옴
        		$.ajax({
                   	url : "selectpath.admin",
                   	type : "get",
                   	dataType : "json",
                   	data : {r_num:$("#selectBus").val()},
                   	success : function(data) {
                    	console.log("읽어옴?");
                   			console.log(data.list.length);
                   			var datalist = data.list.length;
                   			var hell =new Array();
                   			for(var j=0;j<datalist;j++){                   				
           		      			hell.push(new google.maps.LatLng(parseFloat(data.list[j].r_y), parseFloat(data.list[j].r_x)));          		      			         		      			
                   			}    							
                        	loadVector2(hell); 
                	}	
           		});
        	}
    	});    	   		    	          

    	$("#newsave").click(function() {
    		var savelocations =new Array();
    		for(var i=0;i<poly.getPath().length;i++){
    		//var locationX = poly.getPath().getAt(i).lng();
    		//var locationY = poly.getPath().getAt(i).lat();
    			if($("#selectBus").val()=='노선 선택' && $("#selectBuscopy").val() =='수정노선 선택'){    			
    				//alert('노선을 선택하여 주십시오');
    				swal({
						  title: "",
						  text: "노선을 선택하세요.",
						  type: "info",
						  closeOnConfirm: true,
						  showLoaderOnConfirm: true,
						},
						function(){
						});
    				return false;
    			}else if($("#selectBus").val()=='노선 선택'){
    				var savelocation = {
        		        r_x : poly.getPath().getAt(i).lng(),
        	            r_y : poly.getPath().getAt(i).lat(),
        	            r_num:$("#selectBuscopy").val(), 
        	        }    		
        	    	savelocations.push(savelocation);

    			}else if($("#selectBuscopy").val() =='수정노선 선택'){
    				var savelocation = {
        		        r_x : poly.getPath().getAt(i).lng(),
        	            r_y : poly.getPath().getAt(i).lat(),
        	            r_num:$("#selectBus").val(), 
        	        }    		
        	    	savelocations.push(savelocation);
    			}else if($("#selectBus").val() !='노선 선택' && $("#selectBuscopy").val() !='수정노선 선택'){
    				//alert('둘중에 하나만 선택가능함');
    				swal({
						  title: "",
						  text: "하나만 선택하세요",
						  type: "info",
						  closeOnConfirm: true,
						  showLoaderOnConfirm: true,
						},
						function(){
						  /* setTimeout(function(){
						    swal("Ajax request finished!");
						  }, 2000); */
						});
    				return false;
    			}
    		}
    	    $.ajax({	
    	         url : "insertpath.admin",
    	         type : "get",
    	         dataType : "json",
    	         data : {
    	             data : JSON.stringify(savelocations)
    	         },
    	         success : function(data) {
    	             console.log("저장잘됨?");
    	             savelocations=[];
    	             savelocation="";
    	             polyRemove();
    	         }
    	     });
    	 }); 
    	
        $("#selectRoute").change(function(){
        	$.ajax({
                url : "RouteTypeEdit.admin",
                type : "get",
                dataType : "json",
                data : {"name":$("#selectRoute").val()},
                success : function(data) {                   	
                	console.log("노선타입 전송잘되냐?");
                	//console.log(data.nlist);
					if(data.list != null){
						$("#selectBus").empty();
						$("#selectBus").append("<option>노선 선택</option>");
						$("#selectBuscopy").empty();
						$("#selectBuscopy").append("<option>수정노선 선택</option>");
						$("#selectBusStopEdit").empty();
						$("#selectBusStopEdit").append("<option>수정정류장 선택</option>");
						
                		for(var i=0; i<data.list.length; i++){
                			console.log("여긴가..")
                			console.log(data.list[i].r_num);                			                			
                			$("#selectBus").append("<option>"+data.list[i].r_num+"</option>");
                			$("#selectBuscopy").append("<option>"+data.list[i].r_num+"</option>");
                			$("#selectBusStopEdit").append("<option>"+data.list[i].r_num+"</option>");
                		}
                	}else{
                		console.log("???????");
                		$("#selectBus").empty();
						$("#selectBus").append("<option>노선 선택</option>");
						$("#selectBuscopy").empty();
						$("#selectBuscopy").append("<option>수정노선 선택</option>");
						$("#selectBusStopEdit").empty();
						$("#selectBusStopEdit").append("<option>수정정류장 선택</option>");
                	}
                }
        	});
        });
        
        $("#selectBuscopy").change(function(){
        	//수정된 경로 를 뿌려줌
        	polyRemove();
        	$.ajax({
                url : "editpath.admin",
                type : "get",
                dataType : "json",
                data : {r_num:$("#selectBuscopy").val()},
                success : function(data) {                   	
                	console.log("노선타입 전송잘되냐?");
                	var hell =new Array();
           			for(var j=0;j<data.editlist.length;j++){          				
   		      			hell.push(new google.maps.LatLng(parseFloat(data.editlist[j].r_y), parseFloat(data.editlist[j].r_x)));  		      			
           			}    							
                	loadVector(hell);
                }
        	});        	
        	//수정된 버스정류장을 뿌려줌
        });
        
        
        $("#selectBusStopEdit").change(function(){            	
        	$.ajax({
                url : "editBusStopRead.admin",
                type : "get",
                dataType : "json",
                data : {r_num:$("#selectBusStopEdit").val()},
                success : function(data) {                   	
                	console.log("수정 정류장 잘나오냐?");
                	//console.log(data.busstopedit);
                	originalMarkerMake(data.busstopedit, map);                
                }
        	});        	       	
        });
        
        $("#busStart").click(function() {
        		$.ajax({
                    url : "editpath.admin",
                    type : "get",
                    dataType : "json",
                    data : {r_num:$("#selectBuscopy").val()},
                    success : function(data) {
                    	console.log("시뮬레이션 시작");
                    	console.log(data);
                    	
                    	if(data.businfolist.length != 0){
                    		movingBusMarker(data.editlist,data.businfolist[0],map);
                        	
                        	var k=0;
                        	stopSearch = setInterval(function(){
                    			movingBusMarker(data.editlist,data.businfolist[++k],map);	
                    		},20000);
                        	
                        	setInterval(function() {
                        		if(k == data.businfolist.length-1){
                            		console.log("현재 생성된 버스마커 외 interval 중지");
                            		clearInterval(stopSearch);
                            	}                        		
                        	}, 20000);	
                    	}else{
                    		//alert("기사가 배정되지 않았습니다");
                    		swal({
                                title: "",
                                text: "기사가 배정되지 않았습니다",
                                type: "info",
                                closeOnConfirm: true,
                                showLoaderOnConfirm: true,
                              },
                              function(){
                              });

                    		return false;
                    	}
                    	                 		                   		                 	                   		                   		
                    }
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
