<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="se" uri="http://www.springframework.org/security/tags"%>
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

<title>노선관리</title>

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
	<!--  -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="js/jquery.easydropdown.js" type="text/javascript"></script>
	 <link rel="stylesheet" type="text/css" href="themes/easydropdown.css"/>

	
<style type="text/css">
.element { #map { margin-left:auto;
	margin-right: auto;
	width: 95%;
}}

footer {
	margin-left: 0px;
}
select#selectBus, select#selectBus2 {
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
	margin: 7px; 
	overflow: hidden;
	padding: 5px 10px; 
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 150px;
}
.btn{border-radius: 8px};

#inputBusStop {
    padding: 12px 20px;
    margin: 8px 0;
    box-sizing: border-box;
    border-radius: 8px;
}
</style>
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				<c:choose>
					<c:when test="${jobname == '기사'}">
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
				<!--  -->
				<!-- top tiles -->
				<div class="row tile_count"></div>
				<!-- /top tiles -->

				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								<small>정류장 수정 & 확인</small>
							</h3>
						</div>

					</div>
					<!--  -->
					<div class="x_panel">
					<div class="row" style="text-align: right">
						<!-- <input type="button" id="newsave" value="원본좌표저장" class="btn btn-default">
						<input type="button" id="newsave2" value="수정좌표저장" class="btn btn-default"> -->
						<input type="button" id="busLoad" value="버스 보기" class="btn btn-default"zdddd>
					
					
					<select id="selectBus" style="margin:5px" >
						<option>원본</option>
						<c:forEach var="i" items="${list}">
							<option>${i.r_num}</option>
						</c:forEach>												
					</select>
					
					<select id="selectBus2" >
						<option>수정</option>
						<c:forEach var="i" items="${list}">
							<option>${i.r_num}</option>
						</c:forEach>											
					</select>				
					
					<span>
					<input type="text" style="width:210px; height:34px; padding: 12px 20px; 
    					   border-radius: 8px;" id="inputBusStop" placeholder="&nbsp;노선번호를 입력해주세요">
					<input type="button" class="btn btn-default" id="sendBusStop" value="정류장저장"></span>
					
					
					</div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="container" id="map"
								style="width: auto; height: 500px; border: solid black 1px; ">
							</div>
						</div>

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
		<div class="modal fade" id="pass-modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Begin # DIV Form -->
					<div id="div-forms">
						<div class="modal-header" align="center">
							<h3>순번정하기</h3>
						</div>
						<!-- Begin # Login Form -->
						<div class="modal-body">
							<div style="text-align: center">
								<label for="m_pw">정류장 순서는? </label> <input type="text" name="m_pw"
									id="end">
							</div>
							<div style="text-align: center">
								<label for="m_pq">정류장 번호는? </label> <input type="text" name="m_pq"
									id="snum" readonly>
							</div>
							<div style="text-align: center">
								<label for="m_pe">정류장 이름은? </label> <input type="text" name="m_pe"
									id="sname">	
							</div>
						</div>
						<div class="modal-footer">
							
								<button class="btn btn-default" data-dismiss="modal"
									aria-hidden="true" id="shy">완료</button>
							
								<button class="btn btn-default" data-dismiss="modal"
									aria-hidden="true">취소</button>
							
						</div>
						<!-- End # Login Form -->
					</div>
					<!-- End # DIV Form -->
				</div>
			</div>
		</div>
		<div class="modal fade" id="new-modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Begin # DIV Form -->
					<div id="div-forms">
						<div class="modal-header" align="center">
							<h3>지우시겠습니까?</h3>
						</div>
						<!-- Begin # Login Form -->
						<div class="modal-body">
							<div id="deleteinfo" style="text-align: center">
								<div>
								<label for="stopn">정류소 이름 </label> <input type="text" name="stopn"
									id="stopn" readonly>
								</div>
								<div>
								<label for="stopno">정류소 번호 </label> <input type="text" name="stopno"
									id="stopno" readonly>
								</div>
								
							</div>
						</div>
						<div class="modal-footer">
							<div>
								<button class="btn btn-default" data-dismiss="modal"
									aria-hidden="true" id="what">삭제</button>
								<button class="btn btn-default" data-dismiss="modal"
									aria-hidden="true">취소</button>
							</div>
						</div>
						<!-- End # Login Form -->
					</div>
					<!-- End # DIV Form -->
				</div>
			</div>
		</div>
		
		<div class="modal fade" id="modify-modal" tabindex="-1" role="dialog"
			aria-labelledby="myModalLabel" aria-hidden="true"
			style="display: none;">
			<div class="modal-dialog">
				<div class="modal-content">
					<!-- Begin # DIV Form -->
					<div id="div-forms">
						<div class="modal-header" align="center">
							<h3>정류장 위치를 변경하시겠습니까?</h3>
						</div>
						<!-- Begin # Login Form -->
						<div class="modal-body">
							<div id="modify" style="text-align: center">
								<div>
								<label for="stopno1">정류소 번호 </label> <input type="text" name="stopno1"
									id="stopno1" readonly>
								</div>
								<div>
								<label for="stopn1">정류소 이름 </label> <input type="text" name="stopn1"
									id="stopn1" readonly>
								</div>
								<div>
								<label for="stopn2">변경 후 정류소 이름 </label> <input type="text" name="stopn1"
									id="stopn2">
								</div>
								<input type="hidden" id="ms_x">
								<input type="hidden" id="ms_y">
							</div>
						</div>
						<div class="modal-footer">
							<div>
								<button class="btn btn-default" data-dismiss="modal"
									aria-hidden="true" id="modifywhat">이동</button>
								<button class="btn btn-default" data-dismiss="modal"
									aria-hidden="true" id="cancel">취소</button>
							</div>
						</div>
						<!-- End # Login Form -->
					</div>
					<!-- End # DIV Form -->
				</div>
			</div>
		</div>

		<!-- Bootstrap -->
		<script
			src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
		<!-- FastClick -->
		<script
			src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
		<!-- NProgress -->
		<script
			src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
		<!-- Chart.js -->
		<script
			src="${pageContext.request.contextPath}/vendors/Chart.js/dist/Chart.min.js"></script>
		<!-- gauge.js -->
		<script
			src="${pageContext.request.contextPath}/vendors/gauge.js/dist/gauge.min.js"></script>
		<!-- bootstrap-progressbar -->
		<script
			src="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
		<!-- iCheck -->
		<script
			src="${pageContext.request.contextPath}/vendors/iCheck/icheck.min.js"></script>
		<!-- Skycons -->
		<script
			src="${pageContext.request.contextPath}/vendors/skycons/skycons.js"></script>
		<!-- Flot -->
		<script
			src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.js"></script>
		<script
			src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.pie.js"></script>
		<script
			src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.time.js"></script>
		<script
			src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.stack.js"></script>
		<script
			src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.resize.js"></script>
		<!-- Flot plugins -->
		<script
			src="${pageContext.request.contextPath}/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
		<script
			src="${pageContext.request.contextPath}/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/vendors/flot.curvedlines/curvedLines.js"></script>
		<!-- DateJS -->
		<script
			src="${pageContext.request.contextPath}/vendors/DateJS/build/date.js"></script>
		<!-- JQVMap -->
		<script
			src="${pageContext.request.contextPath}/vendors/jqvmap/dist/jquery.vmap.js"></script>
		<script
			src="${pageContext.request.contextPath}/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
		<script
			src="${pageContext.request.contextPath}/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
		<!-- bootstrap-daterangepicker -->
		<script
			src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
		<script
			src="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

		<!-- Custom Theme Scripts -->
		<script
			src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>
		<script type="text/javascript">
   
   //구글 지도 전역변수
    var map;
    
    //출발 좌표 변수
    var locationX;
    var locationY;
                    
  
    //경로 를 그리기 위해 지도위에 찍었던 마커들을 배열에 담아 파일에 저장하기위한 변수
    var savelocations = new Array();
    var savelocation;
    
    //addgeojason 해서 지도위에 경로를 그리고 , 노선을 수정할때 바로 전에 경로를 지워주기 위해 전역변수로 뺌. 
    var features;
    
    var dataArray = new Array();
   
    var stopSearch;
    //원본 정류장 좌표 로 부터 새로 저장한후 불러올떄 좌표들을 저장할 배열변수\
    var copyMarker;
    
    var BusMarker;
    
    var copyMarkers= new Array();
   
   
    var dragendY1;
    var dragendX1;
       //마커의 번호를 부여하기 위한 변수.
    var as=0;
    
      
    //지도 기본 위치 , 마커 기본위치 가 됨.  
    //현 기본 좌표 : 판교역
    var myLatLng = {
    	lat : 37.48085213924345,
     	lng : 126.91500663757324
    };
    
    var er;
    
    var fr;
    function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
           center : myLatLng,
           zoom : 15
        });
        //지도 를 마우스를 클릭시 마커를 생성하는 함수 호출.      
          map.addListener('click', function(e) {
             $.ajax({ //정류장 번호 랜덤 값으로 생성
            	url:"getrandomsnum.admin",
            	type:"post",
            	success:function(data){
            		console.log(data.s_num);
            		$('#snum').val(data.s_num);
            		console.log($('#snum').val());
            		
            	}
             });
             $("#pass-modal").modal(); 
             er=e;
        });                                                    
            
       //교통 지도
       var trafficLayer = new google.maps.TrafficLayer();
       trafficLayer.setMap(map);
    }
    //버스 정류장 수동 생성 db 변경
    function copyMarkerMakess(latLng, map){
    	console.log(latLng);
    	var num =$("#end").val();
    	var s_num = $('#snum').val();
    	var s_name = $('#sname').val();
    	console.log("알고싶어정류번호"+s_num);
    	console.log("알고싶어 정류장 이름 "+s_name);
    	console.log("알고싶어넘버"+num);
    	console.log('as'+as); 
    	if(num==0){ //번호가 만약 0이면 
    		console.log("?여기??"+num);
       		var copyMarker = new google.maps.Marker({
             	position: latLng,        
                map: map,
                label : as.toString(),
                animation: google.maps.Animation.DROP,
                draggable : true
          	});    
       		copyMarkers.push(copyMarker);
          	as++;
    	}else{ //노선값과 배차 순서 rs_order보내기
    		var r_num = $('#selectBus').val();
    		var param = {"r_num":r_num,"s_num":s_num,"s_name":s_name,"rs_order":num,"s_x":latLng.lng(),"s_y":latLng.lat()};
    		$.ajax({
    			url : "editordernumber.admin",
    			type : "post",
    			data : param,
    			success:function(data){
    				alert(data.alert);
    				deleteRout();
    				$.each(data.rssdto,function(index,obj){
    					copyMarkerMakes(obj,map);
    				});
    			}
    		});
    	}
    }
   
 
	//db에서 불러오기
     function copyMarkerMakes(latLng, map) {
       		
      //요기욕
        console.log(latLng);
               	
        	var what={
        		lat:parseFloat(latLng.s_y), 
        		lng:parseFloat(latLng.s_x)
        	}
        
    		var num =$("#end").val();
    		console.log("알고싶어넘버"+num);
    		console.log("순서 보여주세여"+latLng.rs_order);
   			if(num==""){
      			console.log("?여기??"+num);
       			var copyMarker = new google.maps.Marker({
             		title : latLng.s_name,
             		s_num : latLng.s_num,
       				position: what,        
                	map: map,
                	label : latLng.rs_order,
                	animation: google.maps.Animation.DROP,
                	draggable : true
          		});    
       			copyMarkers.push(copyMarker);
          		as++;
   			}else{
         	 	console.log("오너라오너라:"+num);
         		var copyMarker = new google.maps.Marker({
                	position: new google.maps.LatLng(latLng.s_y, latLng.s_x),        
                   	map: map,
                   	label : as.toString(),
                   	animation: google.maps.Animation.DROP,
                   	draggable : true
             	});    
            	copyMarkers.splice(parseInt(num),0,copyMarker);
            	console.log(copyMarkers);
           		as++;
           		num=0;
           		$("#end").val('');
           		console.log($("#end").val()); 
      		 }
   			copyMarker.addListener('dragstart',function(){
   				 dragendY1= copyMarker.getPosition().lat;
        		 dragendX1= copyMarker.getPosition().lng;
   			});
   		
          	//마커 드래그 끝났을떄
            	copyMarker.addListener('dragend', function() {
                	alert('hi');
            		//마커 라벨을 얻어와 담을 변수
            		var markerLabel = copyMarker.getLabel();
                	var stopnum = copyMarker.s_num;
                	var stopname = copyMarker.title;
            		//마커를 드래그후 마커의 좌표를 담기위한 변수
            		var dragendY= copyMarker.getPosition().lat;
            		var dragendX= copyMarker.getPosition().lng;
                  		console.log('정류장번호'+stopnum);
               			console.log(copyMarker.getLabel());
            		/* for(var i=0; i<copyMarkers.length;i++){
                		// console.log(copyMarkers.length);
                		//console.log("bmarker ? "+copyMarkers[i]);                 
                		if(copyMarkers[i].getLabel() == markerLabel){
                    		copyMarkers[i].getPosition().lat = dragendX;
                    		copyMarkers[i].getPosition().lng = dragendY;
                          
                		}
            		} */
            		$('#stopno1').val('');
            		$('#stopn1').val('');
            		$('#stopn2').val('');
            		$('#stopno1').val(stopnum);
            		$('#stopn1').val(stopname);
            		$('#ms_x').val(dragendX);
            		$('#ms_y').val(dragendY);
            		$('#modify-modal').modal();
        		});//drag
          
            //마커의 라벨 이름을 알기위해 적용. 추후삭제 할것
            copyMarker.addListener('click', function() {
            	//console.log(copyMarkers[i].getLabel());
               	//console.log(copyMarker.getLabel());
               	console.log(copyMarker.getLabel());
                fr=copyMarker.getLabel(); //삭제시 라벨번호
                $("#new-modal").modal(); 
                $('#stopn').val('');
                $('#stopno').val('');
                $('#stopn').val(copyMarker.title);
                $('#stopno').val(copyMarker.s_num);
                //$('#stopn').val();
            });
           
         
	}
           
    function copymovingBusMarker(latLng, map){
       	console.log(latLng);    
       	BusMarker = new google.maps.Marker({
            position: new google.maps.LatLng(latLng[0].s_y, latLng[0].s_x),
            map: map,
            icon:"${pageContext.request.contextPath}/images/bus.png"
        });
       
       copymoveBus(BusMarker, map, latLng);
    }
    
    function copymoveBus(BusMarker, map, latLng) {
       	var i=0;
       	stopSearch = setInterval(function(){
        	if(i == latLng.length){
            	return false;
        	}else{
            	console.log(latLng[i]);
            	BusMarker.setPosition(new google.maps.LatLng(latLng[i].s_y, latLng[i].s_x));
        	}
        	i++;
       	},1000);    
    };
    
    function deleteBusMarker(){
    	clearInterval(stopSearch);
    	if(BusMarker !=null){
			BusMarker.setMap(null);
		}
    };
    function deleteRout(){      	
  		if(copyMarkers !=null){ 		
  			originaldelet();   		
  		}      	    	      	
  	}
  
  	function originaldelet(){
  		map.data.forEach(function(features) {           
   			map.data.remove(features);
   		});
   
   		for(var i=0; i<copyMarkers.length; i++){
   			copyMarkers[i].setMap(null);
   		}
   		copyMarkers=[];
   		copyMarkers.length = 0;
   		as=0;
   		
  	}
    $(function() {
      
       	$("#selectBus").change(function(){
   			deleteRoute();
   			
   			deleteBusMarker();
   			if($("#selectBus").val() !=null){     		
       			/* $.ajax({
                   	url : "busStopOriginalRead.admin",
                   	type : "get",
                   	dataType : "json",
                   	data : {busNo:$("#selectBus").val()},
                   	success : function(data) {
                      	console.log("읽어옴?");
                      	console.log(data);
                      	console.log(data.length);                                                                   	                       
                      
                      	if(data.length == 4){
                   			console.log("4개 노선");
                   			console.log(data.length);
                   			for(var j=0;j<data.length;j++){
                   				var f=data[0].msgBody.latLng[j].gpsY;
                       			var d=data[0].msgBody.latLng[j].gpsX;
                   				var what=f+","+d;
                   				copyMarkerMakes(new google.maps.LatLng(f,d),map);
                   			}
                   	
                			for(var j=0;j<data.length;j++){
                   				var f=data[1].msgBody.latLng[j].gpsY;
                       			var d=data[1].msgBody.latLng[j].gpsX;
                   				var what=f+","+d;
                   				copyMarkerMakes(new google.maps.LatLng(f,d),map);
                   			}
		                	for(var j=0;j<data.length;j++){
		                   		var f=data[2].msgBody.latLng[j].gpsY;
		                       	var d=data[2].msgBody.latLng[j].gpsX;
		                   		var what=f+","+d;
		                   		copyMarkerMakes(new google.maps.LatLng(f,d),map);
		                   	}
		                	for(var j=0;j<data.length;j++){
		                   		var f=data[3].msgBody.latLng[j].gpsY;
		                       	var d=data[3].msgBody.latLng[j].gpsX;
		                   		var what=f+","+d;
		                   		copyMarkerMakes(new google.maps.LatLng(f,d),map);
		                   	}
                      	}else{
                   	   		console.log("1개 노선");
                   			console.log(data.length);
                   			for(var j=0;j<data.msgBody.length;j++){
                   				var f=parseFloat(data.msgBody[j].gpsY);
                       			var d=parseFloat(data.msgBody[j].gpsX);
                   				var what=f+","+d;
                   				console.log(what);    
                   				copyMarkerMakes(new google.maps.LatLng(f,d),map);
                      		}         
                   		}
                	}
   				}); */
       		
       		 
       			$.ajax({
                	url : "busStopRoad.admin",
                	type : "get",
                	dataType : "json",
                	data : {r_num:$("#selectBus").val()},
                	success : function(data) {
                   		console.log("읽어옴?");
                   		console.log(data);                  		                                                                  	                       
                  		console.log(data);
                      	console.log("1개 노선");        
                      	 for(var i=0; i<data.length; i++){
                      		copyMarkerMakes(data[i], map);     
                      	 }
             		}
				});
   			}
    	});
       
       	/* $("#selectBus2").change(function(){
			deleteRoute();
			if($("#selectBus").val() !=null){
  				$.ajax({
            		url : "busStoplocationEditRead.admin",
              		type : "get",
              		dataType : "json",
              		data : {busNo:$("#selectBus2").val()},
              		success : function(data) {
                 		console.log("읽어옴?");
                 		console.log(data);
                 		console.log(data.length);                                                                   	                       
                 
              	   		console.log("1개 노선");
              			console.log(data.length);
              			for(var j=0;j<data.length;j++){
              				var f=parseFloat(data[j].lat);
                  			var d=parseFloat(data[j].lng);
              				var what=f+","+d;
              				copyMarkerMakes(new google.maps.LatLng(f,d),map);
                 		}                       
           			}
				});   	    	         
			}
  		}); */
       $("#cancel").click(function(){
		var rs_order=fr;
        
      	var r_num = $('#selectBus').val();
      	$.ajax({
      		url : "cancelaftermodify.admin",
      		type : "post",
      		data : {"r_num":r_num},
      		success : function(data){
      			alert($('#stopn1').val()+' 정류장 변경을 취소 하셨습니다.');
      			deleteRoute();
      			$.each(data.rssdto,function(index,obj){
      				copyMarkerMakes(obj, map);   
      			});
      		}
      	});  	
       });
  		$('#selectBus2').change(function(){
  			$.ajax({
  				url : "getaftermodify.admin",
  				type : "post",
  				data : {"r_num":$('#selectBus2').val()},
  				success : function(data){
  					alert('수정 저장본 불러오기');
  					deleteRoute();
  	      			$.each(data.rssdto,function(index,obj){
  	      				copyMarkerMakes(obj, map);   
  	      			});
  				}
  			});
  			
  		});
  		
       	$('#shy').click(function(){
          	//console.log(e.latLng);
            console.log('하이');
            copyMarkerMakess(er.latLng, map);            
            console.log('하이1');
             
        });
       
       	$('#what').click(function(){
           	var rs_order=fr;
          
          	var r_num = $('#selectBus').val();
          	$.ajax({
          		url : "deleteroutestop.admin",
          		type : "post",
          		data : {"r_num":r_num,"s_num":$('#stopno').val(),"rs_order":rs_order},
          		success : function(data){
          			alert(data.alert);
          			deleteRoute();
          			$.each(data.rssdto,function(index,obj){
          				copyMarkerMakes(obj, map);   
          			});
          		}
          	});
       	});
          	
          	$('#modifywhat').click(function(){
               	var rs_order=fr;
              
              	var r_num = $('#selectBus').val();
              	$.ajax({
              		url : "modifyroutestop.admin",
              		type : "post",
              		data : {"r_num":r_num,"s_num":$('#stopno1').val(),"s_name":$('#stopn2').val(),"s_x":$('#ms_x').val(),"s_y":$('#ms_y').val()},
              		success : function(data){
              			alert(data.alert);
              			deleteRoute();
              			$.each(data.rssdto,function(index,obj){
              				copyMarkerMakes(obj, map);   
              			});
              		}
              	});  	
            /* for(var j=0;j<copyMarkers.length;j++){
                if(d==copyMarkers[j].getLabel()){
                  copyMarkers[j].setMap(null);
                  copyMarkers[j].length=0;
                  copyMarkers.splice(j,1);
                } */
            //}  
        });
       	
        //새로운 좌표 저장
        /* function BusEditSave() {
           	
              	//새로 변경된 좌표들을 파일에 저장하기 위해 
              	//for문을 돌리면서 editX 에 lng , editY 에 lat 좌표를 담고
              	//savelocation 에 lng, lat 키 로하고,  editX ,editY 변수를 값으로 한다. 
           	
           var editX;
           var editY;
           for(var i=0;i<copyMarkers.length;i++){//현재 원본 좌표
              editX = copyMarkers[i].getPosition().lng();
              editY = copyMarkers[i].getPosition().lat();
              savelocation = {
                    lng : editX,
                    lat : editY
               };
              savelocations.push(savelocation);
            
           }
           console.log(savelocations.length);
           $.ajax({
                url : "busStoplocationEdit.admin", //원본을 수정 파일에 저장
                type : "get",                          
                data : {
                    kml : JSON.stringify(savelocations),
                    busNo:$("#selectBus").val()
                },
                success : function(data) {
                    console.log("저장잘됨?");
                }
            });
          } */
          
        /* function BusEditSave2() { //수정한 것을 저장한다.
            
               	//새로 변경된 좌표들을 파일에 저장하기 위해 
               //for문을 돌리면서 editX 에 lng , editY 에 lat 좌표를 담고
               	//savelocation 에 lng, lat 키 로하고,  editX ,editY 변수를 값으로 한다. 
            
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
            console.log(savelocations.length);
            $.ajax({
                 url : "busStoplocationEdit.admin",
                 type : "get",                          
                 data : {
                     kml : JSON.stringify(savelocations),
                     busNo:$("#selectBus2").val()
                 },
                 success : function(data) {
                     console.log("저장잘됨?");
                 }
             });
           } */
       
      	$("#newsave").click(function() {
         	//BusEditSave();        
      	});
           
      	$("#newsave2").click(function() {
          	//BusEditSave2();         
       	});
                 
      	/*$("#busLoad").click(function() {
         	copymovingBusMarker(dataArray, map);
      	}); */
      
      	function deleteRoute(){      	
      		if(copyMarkers !=null){ 		
      			originaldelete();   		
      		}      	    	      	
      	}
      
      	function originaldelete(){
      		map.data.forEach(function(features) {           
       			map.data.remove(features);
       		});
       
       		for(var i=0; i<copyMarkers.length; i++){
       			copyMarkers[i].setMap(null);
       		}
       		copyMarkers=[];
       		copyMarkers.length = 0;
       		as=0;
       		
      	}
      
      	$("#sendBusStop").click(function(){    	
      		if($("#inputBusStop").val() !=null){		
      			$.ajax({
                  	url : "routeidSearch.admin",
                  	type : "get",
                  	dataType : "text",
                  	data : {r_num:$("#inputBusStop").val()},
                  	success : function(data) {
                     	console.log("DB저장잘됨?");
                     	console.log(data);
                     	alert(data);
                  	}        		
      			});       		     		
      		}
  		}); 
    });
    
      
   		 
    
   
   </script>
		<!-- 구글 맵 인증키 -->
		<script async defer
			src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiviyGXEVDNM2G1FB323aGa4kyKgVouw8&callback=initMap">    
      </script>
</body>
</html>
