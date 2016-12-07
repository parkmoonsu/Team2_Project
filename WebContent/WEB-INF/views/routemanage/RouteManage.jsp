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

<title>KOSBUS</title>

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

<style type="text/css">
.element { #map { margin-left:auto;
	margin-right: auto;
	width: 95%;
}

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
	margin: 20px; 
	overflow: hidden;
	padding: 5px 10px; 
	text-overflow: ellipsis;
	white-space: nowrap;
	width: 150px;
}
.btn{border-radius: 8px};
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
								<small>노선 관리</small>
							</h3>
						</div>

					</div>
					<!--  -->
					<div  class="x_panel" style="text-align: right">
						
					<div class="row" style="margin-bottom: 10px;text-align: right">
					<select id="selectBus">
						<option>원본</option>
						<option>all</option>
						<option>5623</option>
						<option>702</option>
						<option>9000</option>
						<option>6501</option>
					</select>
						<input type="button" id="newsave"  class="btn btn-default" value="원본저장" style="width:95px"> 
					
					<select id="selectBus2">
						<option>수정</option>
						<option>all</option>
						<option>5623</option>
						<option>702</option>
						<option>9000</option>
						<option>6501</option>
					</select>
						<input type="button" id="newsave2" class="btn btn-default" value="수정본저장">
				</div>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12">
							<div class="container" id="map"
								style="width: auto; height: 500px; border: solid black 1px; margin-left: auto; margin-right: auto;">
							</div>
						</div>
</div>
						<!-- <div class="col-sm-3"></div> -->
					</div>
					<br />
				</div>
			</div>
			<!-- /page content -->

			<!-- footer content -->
			<footer>
				<div class="pull-right">
					Gentelella - Bootstrap Admin Template by <a
						href="https://colorlib.com">Colorlib</a>
				</div>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
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
	<script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>

	<script type="text/javascript">

		var map;
		var myLatlng;
		var array=new Array();
		
		function initMap() {
			map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : new google.maps.LatLng(37.39489285215817,
						127.11115658283234)
			});

			map.addListener('click', function(e) {

				myLatlng = {
					lat : e.latLng.lat(),
					lng : e.latLng.lng()
				};
				makeInfowindow();

			});

		}
		
		

		//추가
		function makeInfowindow() {
			//var r_num="5623";
			var contentString = '<div id="content">'
			+'<button class="btn btn-default" onclick="addstop()" >정류장 추가</button><br>'
			+'<button class="btn btn-default" onclick="searchstop()">주변 정류장 찾기</button>'
				
			+'</div>';

			var infowindow = new google.maps.InfoWindow({
				content : contentString
			});

			var marker = new google.maps.Marker({
				position : myLatlng,
				map : map
			});
			
			infowindow.open(map, marker);
			/* marker.addListener('click', function() {
				infowindow.open(map, marker);
			}); */
		}
		
		function addstop(){
			alert('정류장 추가');
			
		}
		
		function searchstop(){
			
			alert('정류장 검색');
			
			$.ajax({
				type:'post',
				url:'routeRead.admin',
				data: {r_num:"5623"},
				success:function(data){
					$.each(data.list, function(index, obj){
						
						var buff=0.001; //사각형 범위
						
						var high_y=myLatlng.lat+buff;
						var low_y=myLatlng.lat-buff;
						var high_x=myLatlng.lng-buff;
						var low_x=myLatlng.lng-buff;

						if(obj.s_y<high_y && obj.s_y>low_y){
							//&& obj.s_y>low_y && obj.s_x<high_x && obj.s_x>low_x
							array.push(obj);
						}
						
					});
					console.log(array);
					
					$.each(array, function(index, obj){
						var loc={
							lat : Number(obj.s_y),
							lng : Number(obj.s_x)
						};
					
						var marker = new google.maps.Marker({
							position : loc,
							map : map,
							label : obj.rs_order
						});
						
						var contentString = '<div id="content">'
							+'정류장번호 : '+obj.s_num+
							+'</div>';

						var infowindow = new google.maps.InfoWindow({
							content : contentString
						});
						
						marker.addListener('click', function() {
							//선택했던 지점의 마커와 인포윈도우가 사라져야 한다.close()
							setMapOnAll(null);
							infowindow.open(map, marker);
						});
						
						
					});
					
				
				}
			});
			
			//배열의 각 값마다 비교
			//해서 제일 가까운 5개 뽑기
			//선택하면 노선 테이블에 등록
			
		}
		
		

		$(document).ready(function() {
			/* $('#addstop').click(function(){
				alert('정류장 추가 클릭');
			});
			$('#searchstop').click(function(){
				alert('정류장 검색 클릭');
			}); */
		});

	</script>
	<!-- 구글 맵 인증키 -->
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCiviyGXEVDNM2G1FB323aGa4kyKgVouw8&callback=initMap">    
      </script>
</body>
</html>
