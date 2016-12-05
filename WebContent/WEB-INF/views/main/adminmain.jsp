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


</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-md-3 left_col">
				
						<jsp:include page="/sidebar/sidebar.jsp"></jsp:include>

			</div>

			<!--상단 menu -->

			<div class="top_nav">
				<jsp:include page="/sidebar/menuHeader.jsp"></jsp:include>
			</div>
			<!-- page content -->
			<div class="right_col" role="main">
				<div class="row">
					<!-- Moris -->
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="x_panel">
							<div class="x_title">
								<h2>버스(대)</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false"><i
											class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Settings 1</a></li>
											<li><a href="#">Settings 2</a></li>
										</ul></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a>
									</li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<div id="graph_bar" style="width: 100%; height: 240px;"></div>
							</div>
						</div>
					</div>


					<!-- 도넛 -->
					<div class="col-md-4 col-sm-4 col-xs-12">
						<div class="x_panel tile fixed_height_320 overflow_hidden">
							<div class="x_title">
								<h2>버스</h2>
								<ul class="nav navbar-right panel_toolbox">
									<li><a class="collapse-link"><i
											class="fa fa-chevron-up"></i></a></li>
									<li class="dropdown"><a href="#" class="dropdown-toggle"
										data-toggle="dropdown" role="button" aria-expanded="false"><i
											class="fa fa-wrench"></i></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="#">Settings 1</a></li>
											<li><a href="#">Settings 2</a></li>
										</ul></li>
									<li><a class="close-link"><i class="fa fa-close"></i></a>
									</li>
								</ul>
								<div class="clearfix"></div>
							</div>
							<div class="x_content">
								<table class="" style="width: 100%">
									<tr>
										<th style="width: 37%;">
											<p>Top 5</p>
										</th>
										<th>
											<div class="col-lg-7 col-md-7 col-sm-7 col-xs-7">
												<p class="">Device</p>
											</div>
											<div class="col-lg-5 col-md-5 col-sm-5 col-xs-5">
												<p class="">Progress</p>
											</div>
										</th>
									</tr>
									<tr>
										<td>
											<canvas id="canvas1" height="140" width="140"
												style="margin: 15px 10px 10px 0"></canvas>
										</td>
										<td>
											<table class="tile_info">
												<tr>
													<td>
														<p>
															<i class="fa fa-square blue"></i>IOS
														</p>
													</td>
													<td>40%</td>
												</tr>
												<tr>
													<td>
														<p>
															<i class="fa fa-square green"></i>Android
														</p>
													</td>
													<td>10%</td>
												</tr>
												<tr>
													<td>
														<p>
															<i class="fa fa-square purple"></i>Blackberry
														</p>
													</td>
													<td>20%</td>
												</tr>
												<tr>
													<td>
														<p>
															<i class="fa fa-square aero"></i>Symbian
														</p>
													</td>
													<td>15%</td>
												</tr>
												<tr>
													<td>
														<p>
															<i class="fa fa-square red"></i>Others
														</p>
													</td>
													<td>30%</td>
												</tr>
											</table>
										</td>
									</tr>
								</table>
							</div>
						</div>
					</div>


					<div class="col-md-4 col-sm-4 col-xs-12">
								<div class="x_panel">
									<div class="x_title">
										<h2>날씨</h2>
										<ul class="nav navbar-right panel_toolbox">
											<li><a class="collapse-link"><i
													class="fa fa-chevron-up"></i></a></li>
											<li class="dropdown"><a href="#" class="dropdown-toggle"
												data-toggle="dropdown" role="button" aria-expanded="false"><i
													class="fa fa-wrench"></i></a>
												<ul class="dropdown-menu" role="menu">
													<li><a href="#">Settings 1</a></li>
													<li><a href="#">Settings 2</a></li>
												</ul></li>
											<li><a class="close-link"><i class="fa fa-close"></i></a>
											</li>
										</ul>
										<div class="clearfix"></div>
									</div>
									<div class="x_content">
										<div class="row">
											<div class="col-sm-12">
												<div class="temperature" id = "w_title">
													
												</div>
												
											</div>
										</div>
										<div class="row">
											<div class="col-sm-4">
												<div class="weather-icon">
													<canvas id = 'todayweath' width='84' height = '84'></canvas>
												</div>
											</div>
											<div class="col-sm-8">
												<div class="weather-text">
													<h2 id = "tweath">
														서울<br><br>&nbsp;
													</h2>
												</div>
											</div>
										</div>
										<div class="col-sm-12">
											<div class="weather-text pull-right">
												<h3 class="degrees" id = "w_title_degree"></h3>
												<h3 class="degrees" id = "w_title_degree2"></h3>
												
											</div>
										</div>

										<div class="clearfix"></div>

										<div class="row weather-days">
											<div class="col-sm-2">
												<div class="daily-weather">
													<h2 class="day" id = "ndate"></h2>
													<h5 class="degrees" id = "ntemp"></h5>
													<canvas id="nweath" width="32" height="32"></canvas>
													
												</div>
											</div>
											<div class="col-sm-2">
												<div class="daily-weather">
													<h2 class="day" id ="n2date"></h2>
													<h5 class="degrees" id ="n2temp"></h5>
													<canvas height="32" width="32" id="n2weath"></canvas>
													
												</div>
											</div>
											<div class="col-sm-2">
												<div class="daily-weather">
													<h2 class="day" id ="n3date"></h2>
													<h5 class="degrees" id = "n3temp"></h5>
													<canvas height="32" width="32" id="n3weath"></canvas>
													
												</div>
											</div>
											<div class="col-sm-2">
												<div class="daily-weather">
													<h2 class="day" id = "n4date"></h2>
													<h5 class="degrees" id = "n4temp"></h5>
													<canvas height="32" width="32" id="n4weath"></canvas>
													
												</div>
											</div>
											<div class="col-sm-2">
												<div class="daily-weather">
													<h2 class="day" id ="n5date"></h2>
													<h5 class="degrees" id = "n5temp"></h5>
													<canvas height="32" width="32" id="n5weath"></canvas>
													
												</div>
											</div>
											<div class="col-sm-2">
												<div class="daily-weather">
													<h2 class="day" id = "n6date"></h2>
													<h5 class="degrees" id = "n6temp"></h5>
													<canvas height="32" width="32" id="n6weath"></canvas>
													
												</div>
											</div>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>

							</div>

				</div>


				<div class="row">
					<div class="col-md-8 col-sm-8 col-xs-12">
						<div class="row">
							<!-- start of weather widget -->
							
							
						</div>
					</div>
				</div>
				<!-- end of weather widget -->
				
				<!-- flot -->
				<div class="row">
					 <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                  	<div class ="col-sm-8">
                  	  <h2>노선-정류장 시간대별 승객 수</h2>
                   	</div>
					<div>
						<select id ="flotyear">
							<option>연도</option>
							<option>2015</option>
							<option>2016</option>
						</select>
										
						&nbsp;
						<select id = "flotmonth">
							<option>월</option>
							<option>01</option>
							<option>02</option>
							<option>03</option>
							<option>04</option>
							<option>05</option>
							<option>06</option>
							<option>07</option>
							<option>08</option>
							<option>09</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>								
						</select>
									
									
						&nbsp;
						<select id = "flotroute">
							<option>노선</option>
						</select>
						&nbsp;
									
						<select id =flotstop style = "width : 100px">
							<option>정류장</option>
								
						</select>
									
					</div>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">

                    <div id="echart_line" style="height:400px;"></div>

                  </div>
                </div>
              </div>
			
				</div>
			</div>
		</div>
		<!-- /page content -->

		<!-- footer content -->
		<footer>
			<jsp:include page="/sidebar/footer.jsp"></jsp:include>
			<div class="clearfix"></div>
		</footer>
		<!-- /footer content -->
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
	<!-- ECharts -->
    <script src="${pageContext.request.contextPath}/vendors/echarts/dist/echarts.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/echarts/map/js/world.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>
	<!-- morris.js -->
	<script
		src="${pageContext.request.contextPath}/vendors/raphael/raphael.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/morris.js/morris.min.js"></script>

	<script type="text/javascript">
	// moris 시작
	Morris.Bar({ //// 엑박 무시하세요~
	element : 'graph_bar',
	data : [ 
		{device : '미정', geekbench : ${no}},

	
		{device : '간선버스',geekbench : ${m}},
		{device : '지선버스',geekbench : ${n}}, 
		{device : '순환버스',geekbench : ${w}},
		{device : '광역버스',geekbench : ${g}},
		
		{device : '전체버스',geekbench : ${m+n+w+g+no}} 

	],
	xkey : 'device',
	ykeys : [ 'geekbench' ],
	labels : [''],
	barRatio : 0.4,
	barColors : [ '#26B99A', '#34495E', '#ACADAC', '#3498DB' ],
	xLabelAngle : 35,
	hideHover : 'auto',
	resize : true
});
	//moris 종료
	
	
	
	
	Date.prototype.format = function(f) {
	    if (!this.valueOf()) return " ";
	 
	    var weekName = ["일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"];
	    var d = this;
	     
	    return f.replace(/(yyyy|yy|MM|dd|E|hh|mm|ss|a\/p)/gi, function($1) {
	        switch ($1) {
	            case "yyyy": return d.getFullYear();
	            case "yy": return (d.getFullYear() % 1000).zf(2);
	            case "MM": return (d.getMonth() + 1).zf(2);
	            case "dd": return d.getDate().zf(2);
	            case "E": return weekName[d.getDay()];
	            case "HH": return d.getHours().zf(2);
	            case "hh": return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case "mm": return d.getMinutes().zf(2);
	            case "ss": return d.getSeconds().zf(2);
	            case "a/p": return d.getHours() < 12 ? "오전" : "오후";
	            default: return $1;
	        }
	    });
	};
	
	String.prototype.string = function(len){var s = '', i = 0; while (i++ < len) { s += this; } return s;};
	String.prototype.zf = function(len){return "0".string(len - this.length) + this;};
	Number.prototype.zf = function(len){return this.toString().zf(len);};
		
	var tmfc;
	var tdate = new Date();
	var nextDate=new Date();
	nextDate.setDate(nextDate.getDate()+1);
	var next2Date=new Date();
	next2Date.setDate(next2Date.getDate()+2);
	var next3Date = new Date();
	next3Date.setDate(next3Date.getDate()+3);
	var next4Date = new Date();
	next4Date.setDate(next4Date.getDate()+4);
	var next5Date = new Date();
	next5Date.setDate(next5Date.getDate()+5);
	var next6Date = new Date();
	next6Date.setDate(next6Date.getDate()+6);
	
	var t = Number(tdate.format("hh"));
	
	
	/// Echart 테마 시작
	 var theme = {
          color: [
              '#26B99A', '#34495E', '#BDC3C7', '#3498DB',
              '#9B59B6', '#8abb6f', '#759c6a', '#bfd3b7'
          ],

          title: {
              itemGap: 8,
              textStyle: {
                  fontWeight: 'normal',
                  color: '#408829'
              }
          },

          dataRange: {
              color: ['#1f610a', '#97b58d']
          },

          

          tooltip: {
              backgroundColor: 'rgba(0,0,0,0.5)',
              axisPointer: {
                  type: 'line',
                  lineStyle: {
                      color: '#408829',
                      type: 'dashed'
                  },
                  crossStyle: {
                      color: '#408829'
                  },
                  shadowStyle: {
                      color: 'rgba(200,200,200,0.3)'
                  }
              }
          },

          dataZoom: {
              dataBackgroundColor: '#eee',
              fillerColor: 'rgba(64,136,41,0.2)',
              handleColor: '#408829'
          },
          grid: {
              borderWidth: 0
          },

          categoryAxis: {
              axisLine: {
                  lineStyle: {
                      color: '#408829'
                  }
              },
              splitLine: {
                  lineStyle: {
                      color: ['#eee']
                  }
              }
          },

          valueAxis: {
              axisLine: {
                  lineStyle: {
                      color: '#408829'
                  }
              },
              splitArea: {
                  show: true,
                  areaStyle: {
                      color: ['rgba(250,250,250,0.1)', 'rgba(200,200,200,0.1)']
                  }
              },
              splitLine: {
                  lineStyle: {
                      color: ['#eee']
                  }
              }
          },
          timeline: {
              lineStyle: {
                  color: '#408829'
              },
              controlStyle: {
                  normal: {color: '#408829'},
                  emphasis: {color: '#408829'}
              }
          },

          k: {
              itemStyle: {
                  normal: {
                      color: '#68a54a',
                      color0: '#a9cba2',
                      lineStyle: {
                          width: 1,
                          color: '#408829',
                          color0: '#86b379'
                      }
                  }
              }
          },
         
          force: {
              itemStyle: {
                  normal: {
                      linkStyle: {
                          strokeColor: '#408829'
                      }
                  }
              }
          },
          chord: {
              padding: 4,
              itemStyle: {
                  normal: {
                      lineStyle: {
                          width: 1,
                          color: 'rgba(128, 128, 128, 0.5)'
                      },
                      chordStyle: {
                          lineStyle: {
                              width: 1,
                              color: 'rgba(128, 128, 128, 0.5)'
                          }
                      }
                  },
                  emphasis: {
                      lineStyle: {
                          width: 1,
                          color: 'rgba(128, 128, 128, 0.5)'
                      },
                      chordStyle: {
                          lineStyle: {
                              width: 1,
                              color: 'rgba(128, 128, 128, 0.5)'
                          }
                      }
                  }
              }
          },
         
          textStyle: {
              fontFamily: 'Arial, Verdana, sans-serif'
          }
      };
	
	// echart 테마 끝
	 var echartLine = echarts.init(document.getElementById('echart_line'), theme);

		      echartLine.setOption({
		        title: {
		          text: '',
		          subtext: ''
		        },
		        tooltip: {
		          trigger: 'axis'
		        },
		        legend: {
		          x: 220,
		          y: 40,
		          data: ['승차', '하차']
		        },
		        calculable: true,
		        xAxis: [{
		          type: 'category',
		          boundaryGap: false,
		          data: ['0','1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23']
		        }],
		        yAxis: [{
		          type: 'value'
		        }],
		        series: [
		         {
		          name: '승차',
		          type: 'line',
		          smooth: true,
		          itemStyle: {
		            normal: {
		              areaStyle: {
		                type: 'default'
		              }
		            }
		          },
		          data: [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
		        }, {
		          name: '하차',
		          type: 'line',
		          smooth: true,
		          itemStyle: {
		            normal: {
		              areaStyle: {
		                type: 'default'
		              }
		            }
		          },
		          data:  [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]
		        }]
		      });
		      
		    // echart 끝  
	
	
		$(function(){
			$.ajax({
				url : "route.htm",
				success : function(data){
					console.log("r_num" + data.rlist.length);
					for(var i = 0 ; i < data.rlist.length ; i++){
						$("#flotroute").append("<option>" + data.rlist[i].r_num + "</option>");
					}
				}
			});				
							
			$("#flotroute").change(function(){
				$.ajax({
					url : "busstop.htm",
					data : {flotyear : $("#flotyear").val() , flotmonth : $("#flotmonth").val() , flotroute : $("#flotroute").val()},
					success : function(data){
						for(var i = 0 ; i < data.jroute.CardBusTimeNew.row.length ; i++){
							$("#flotstop").append("<option>" + data.jroute.CardBusTimeNew.row[i].BUS_STA_NM + "</option>");
						}
					}
					
				});
				
			});	
			
			$("#flotstop").change(function(){
				$.ajax({
					url : "busstop.htm",
					data : {flotyear : $("#flotyear").val() , flotmonth : $("#flotmonth").val() , flotroute : $("#flotroute").val()},
					success : function(data){
						d1 = [];
						for(var i = 0 ; i < data.jroute.CardBusTimeNew.row.length ; i++){
							
							if($("#flotstop").val() == data.jroute.CardBusTimeNew.row[i].BUS_STA_NM){
								console.log("1시에 탄사람 : " + data.jroute.CardBusTimeNew.row[i].ONE_RIDE_NUM);
								
								/* d1.push(['0',data.jroute.CardBusTimeNew.row[i].MIDNIGHT_RIDE_NUM]);
								d1.push(['1',data.jroute.CardBusTimeNew.row[i].ONE_RIDE_NUM]);
								d1.push(['2',data.jroute.CardBusTimeNew.row[i].TWO_RIDE_NUM]);
								d1.push(['3',data.jroute.CardBusTimeNew.row[i].THREE_RIDE_NUM]);
								d1.push(['4',data.jroute.CardBusTimeNew.row[i].FOUR_RIDE_NUM]);
								d1.push(['5',data.jroute.CardBusTimeNew.row[i].FIVE_RIDE_NUM]);
								d1.push(['6',data.jroute.CardBusTimeNew.row[i].SIX_RIDE_NUM]);
								d1.push(['7',data.jroute.CardBusTimeNew.row[i].SEVEN_RIDE_NUM]);
								d1.push(['8',data.jroute.CardBusTimeNew.row[i].EIGHT_RIDE_NUM]);
								d1.push(['9',data.jroute.CardBusTimeNew.row[i].NINE_RIDE_NUM]);
								d1.push(['10',data.jroute.CardBusTimeNew.row[i].TEN_RIDE_NUM]);
								d1.push(['11',data.jroute.CardBusTimeNew.row[i].ELEVEN_RIDE_NUM]);
								d1.push(['12',data.jroute.CardBusTimeNew.row[i].TWELVE_RIDE_NUM]);
								d1.push(['13',data.jroute.CardBusTimeNew.row[i].THIRTEEN_RIDE_NUM]);
								d1.push(['14',data.jroute.CardBusTimeNew.row[i].FOURTEEN_RIDE_NUM]);
								d1.push(['15',data.jroute.CardBusTimeNew.row[i].FIFTEEN_RIDE_NUM]);
								d1.push(['16',data.jroute.CardBusTimeNew.row[i].SIXTEEN_RIDE_NUM]);
								d1.push(['17',data.jroute.CardBusTimeNew.row[i].SEVENTEEN_RIDE_NUM]);
								d1.push(['18',data.jroute.CardBusTimeNew.row[i].EIGHTEEN_RIDE_NUM]);
								d1.push(['19',data.jroute.CardBusTimeNew.row[i].NINETEEN_RIDE_NUM]);
								d1.push(['20',data.jroute.CardBusTimeNew.row[i].TWENTY_RIDE_NUM]);
								d1.push(['21',data.jroute.CardBusTimeNew.row[i].TWENTY_ONE_RIDE_NUM]);
								d1.push(['22',data.jroute.CardBusTimeNew.row[i].TWENTY_TWO_RIDE_NUM]);
								d1.push(['23',data.jroute.CardBusTimeNew.row[i].TWENTY_THREE_RIDE_NUM]); */
								
								 echartLine.setOption({
								        title: {
								          text: $("#flotroute").val() + "번",
								          subtext: data.jroute.CardBusTimeNew.row[i].BUS_STA_NM
								        },
								        tooltip: {
								          trigger: 'axis'
								        },
								        legend: {
								          x: 220,
								          y: 40,
								          data: ['승차', '하차']
								        },
								        calculable: true,
								        xAxis: [{
								          type: 'category',
								          boundaryGap: false,
								          data: ['0시','1시', '2시', '3시', '4시', '5시', '6시', '7시', '8시', '9시', '10시', '11시', '12시', '13시', '14시', '15시', '16시', '17시', '18시', '19시', '20시', '21시', '22시', '23시']
								        }],
								        yAxis: [{
								          type: 'value'
								        }],
								        series: [
								         {
								          name: '승차',
								          type: 'line',
								          smooth: true,
								          itemStyle: {
								            normal: {
								              areaStyle: {
								                type: 'default'
								              }
								            }
								          },
								          data: [data.jroute.CardBusTimeNew.row[i].MIDNIGHT_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].ONE_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].TWO_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].THREE_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].FOUR_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].FIVE_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].SIX_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].SEVEN_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].EIGHT_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].NINE_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].TEN_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].ELEVEN_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].TWELVE_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].THIRTEEN_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].FOURTEEN_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].FIFTEEN_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].SIXTEEN_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].SEVENTEEN_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].EIGHTEEN_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].NINETEEN_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].TWENTY_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].TWENTY_ONE_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].TWENTY_TWO_RIDE_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].TWENTY_THREE_RIDE_NUM]
								        }, {
								          name: '하차',
								          type: 'line',
								          smooth: true,
								          itemStyle: {
								            normal: {
								              areaStyle: {
								                type: 'default'
								              }
								            }
								          },
								          data: [data.jroute.CardBusTimeNew.row[i].MIDNIGHT_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].ONE_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].TWO_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].THREE_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].FOUR_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].FIVE_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].SIX_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].SEVEN_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].EIGHT_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].NINE_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].TEN_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].ELEVEN_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].TWELVE_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].THIRTEEN_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].FOURTEEN_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].FIFTEEN_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].SIXTEEN_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].SEVENTEEN_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].EIGHTEEN_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].NINETEEN_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].TWENTY_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].TWENTY_ONE_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].TWENTY_TWO_ALIGHT_NUM,
								        	  data.jroute.CardBusTimeNew.row[i].TWENTY_THREE_ALIGHT_NUM]
								        }]
								      });
							}
						}
					
					
					}
				});
			});
			
			
		     
	
			var icons = new Skycons({
				"color" : "#73879C"
			});
			
			//console.log("#####" + Number(tdate.format("hh")) + Number("12"));
			$.ajax({
				url : "weather.htm",
				success : function(data){
					
					console.log("tmap####");
					console.log(data.day6.weather.forecast6days[0].sky);
					
					/// 오늘 날짜 , 날씨 , 온도
					$("#w_title").append("<b>"+tdate.format("E")+"("+tdate.format("dd일") +")</b>");
					
					 if(data.temp.weather.summary[0].today.sky.code == "SKY_D01"){
						 if(tdate.format("a/p") == "오전" && Number(tdate.format("hh")) >= 6
								 || tdate.format("a/p") == "오후" && t==12 || (t+12) < 18){
						 	icons.add("todayweath", Skycons.CLEAR_DAY);
						 }else{
							 icons.add("todayweath", Skycons.CLEAR_NIGHT);
						 }
						 $("#tweath").append("맑음");
						 
					}else if(data.temp.weather.summary[0].today.sky.code == "SKY_D05"){
						icons.add("todayweath", Skycons.RAIN);
						 $("#tweath").append("비");
						 
					}else if(data.temp.weather.summary[0].today.sky.code == "SKY_D02"){
						if(tdate.format("a/p") == "오전" && Number(tdate.format("hh")) >= 6
								 || tdate.format("a/p") == "오후" && t==12 || (t+12) < 18){
							icons.add("todayweath", Skycons.PARTLY_CLOUDY_DAY);
						 }else{
							 icons.add("todayweath", Skycons.PARTLY_CLOUDY_NIGHT);
						 }
						
						$("#tweath").append("구름 조금");
						
					}else if(data.temp.weather.summary[0].today.sky.code == "SKY_D03"){
						icons.add("todayweath", Skycons.CLOUDY);
						$("#tweath").append("구름 많음");
						
					}else if(data.temp.weather.summary[0].today.sky.code == "SKY_D04"){
						icons.add("todayweath", Skycons.FOG);
						$("#tweath").append("흐림");
						
					}else if(data.temp.weather.summary[0].today.sky.code == "SKY_D06" ||
							data.temp.weather.summary[0].today.sky.code == "SKY_D07"){
						icons.add("todayweath", Skycons.SNOW);
						$("#tweath").append("눈");
					}
					
			
					$("#w_title_degree").append("<span><font size = '3'>최고</font>&nbsp;&nbsp;"+data.temp.weather.summary[0].today.temperature.tmax.split(".")[0] + "</span>");
					$("#w_title_degree2").append("<span><font size = '3'>최저</font>&nbsp;&nbsp;"+data.temp.weather.summary[0].today.temperature.tmin	.split(".")[0] + "</span>");
					
						
					//내일 날짜 / 온도 / 날씨
					
					$("#ntemp").append("<span>"+data.temp.weather.summary[0].tomorrow.temperature.tmax.split(".")[0]+
							"/"+ data.temp.weather.summary[0].tomorrow.temperature.tmin.split(".")[0]+ "</span>");
							
					
						 
					if(data.temp.weather.summary[0].tomorrow.sky.code == "SKY_M01"){	
						icons.add("nweath", Skycons.CLEAR_DAY);
							
					}else if(data.temp.weather.summary[0].tomorrow.sky.code == "SKY_M05"){
						icons.add("nweath", Skycons.RAIN);
						 
					}else if(data.temp.weather.summary[0].tomorrow.sky.code == "SKY_M02"){
						icons.add("nweath", Skycons.PARTLY_CLOUDY_DAY);
							
					}else if(data.temp.weather.summary[0].tomorrow.sky.code == "SKY_M03"){
						icons.add("nweath", Skycons.CLOUDY);

					}else if(data.temp.weather.summary[0].tomorrow.sky.code == "SKY_M04"){
						icons.add("nweath", Skycons.FOG);
							
					}else if(data.temp.weather.summary[0].tomorrow.sky.code == "SKY_M06" ||
							data.temp.weather.summary[0].tomorrow.sky.code == "SKY_M07"){
						icons.add("nweath", Skycons.SNOW);
						
					}
						
					//이틀후 날짜 / 날씨 / 온도
					
					$("#n2temp").append("<span>"+data.temp.weather.summary[0].dayAfterTomorrow.temperature.tmax.split(".")[0]+
							"/"+ data.temp.weather.summary[0].dayAfterTomorrow.temperature.tmin.split(".")[0]+ "</span>");
								
					if(data.temp.weather.summary[0].dayAfterTomorrow.sky.code == "SKY_M01"){	
						icons.add("n2weath", Skycons.CLEAR_DAY);
								
					}else if(data.temp.weather.summary[0].dayAfterTomorrow.sky.code == "SKY_M05"){
						icons.add("n2weath", Skycons.RAIN);
							 
					}else if(data.temp.weather.summary[0].dayAfterTomorrow.sky.code == "SKY_M02"){
						icons.add("n2weath", Skycons.PARTLY_CLOUDY_DAY);
								
					}else if(data.temp.weather.summary[0].dayAfterTomorrow.sky.code == "SKY_M03"){
						icons.add("n2weath", Skycons.CLOUDY);

					}else if(data.temp.weather.summary[0].dayAfterTomorrow.sky.code == "SKY_M04"){
						icons.add("n2weath", Skycons.FOG);
								
					}else if(data.temp.weather.summary[0].dayAfterTomorrow.sky.code == "SKY_M06" ||
							data.temp.weather.summary[0].dayAfterTomorrow.sky.code == "SKY_M07"){
						icons.add("n2weath", Skycons.SNOW);
							
					}
						
					//3일 후 날짜/날씨/온도
					$("#n3temp").append("<span>"+data.day6.weather.forecast6days[0].temperature.tmax4day+
							"/"+ data.day6.weather.forecast6days[0].temperature.tmin4day+ "</span>");
						
					if(data.day6.weather.forecast6days[0].sky.pmCode4day == "SKY_W01"){	
						icons.add("n3weath", Skycons.CLEAR_DAY);
						
					}else if(data.day6.weather.forecast6days[0].sky.pmCode4day == "SKY_W02"){
						icons.add("n3weath", Skycons.PARTLY_CLOUDY_DAY);
								
					}else if(data.day6.weather.forecast6days[0].sky.pmCode4day == "SKY_W03"){
						icons.add("n3weath", Skycons.CLOUDY);

					}else if(data.day6.weather.forecast6days[0].sky.pmCode4day == "SKY_W04"){
						icons.add("n3weath", Skycons.FOG);
								
					}else if(data.day6.weather.forecast6days[0].sky.pmCode4day == "SKY_W07" ||
							data.day6.weather.forecast6days[0].sky.pmCode4day == "SKY_W09" ||
							data.day6.weather.forecast6days[0].sky.pmCode4day == "SKY_W10"){
						icons.add("n3weath", Skycons.RAIN);
							 
					}else if(data.day6.weather.forecast6days[0].sky.pmCode4day == "SKY_W11" ||
							data.day6.weather.forecast6days[0].sky.pmCode4day == "SKY_W12" ||
							data.day6.weather.forecast6days[0].sky.pmCode4day == "SKY_W13"){
						icons.add("n3weath", Skycons.SNOW);
							
					}
					
					// 4일 후 날짜 / 날씨 / 온도
					$("#n4temp").append("<span>"+data.day6.weather.forecast6days[0].temperature.tmax5day+
							"/"+ data.day6.weather.forecast6days[0].temperature.tmin5day+ "</span>");
						
					if(data.day6.weather.forecast6days[0].sky.pmCode5day == "SKY_W01"){	
						icons.add("n4weath", Skycons.CLEAR_DAY);
						
					}else if(data.day6.weather.forecast6days[0].sky.pmCode5day == "SKY_W02"){
						icons.add("n4weath", Skycons.PARTLY_CLOUDY_DAY);
								
					}else if(data.day6.weather.forecast6days[0].sky.pmCode5day == "SKY_W03"){
						icons.add("n4weath", Skycons.CLOUDY);

					}else if(data.day6.weather.forecast6days[0].sky.pmCode5day == "SKY_W04"){
						icons.add("n4weath", Skycons.FOG);
								
					}else if(data.day6.weather.forecast6days[0].sky.pmCode5day == "SKY_W07" ||
							data.day6.weather.forecast6days[0].sky.pmCode5day == "SKY_W09" ||
							data.day6.weather.forecast6days[0].sky.pmCode5day == "SKY_W10"){
						icons.add("n4weath", Skycons.RAIN);
							 
					}else if(data.day6.weather.forecast6days[0].sky.pmCode5day == "SKY_W11" ||
							data.day6.weather.forecast6days[0].sky.pmCode5day == "SKY_W12" ||
							data.day6.weather.forecast6days[0].sky.pmCode5day == "SKY_W13"){
						icons.add("n4weath", Skycons.SNOW);
							
					}
					
					//5일후 날씨 / 날짜 / 온도
					$("#n5temp").append("<span>"+data.day6.weather.forecast6days[0].temperature.tmax6day+
							"/"+ data.day6.weather.forecast6days[0].temperature.tmin6day+ "</span>");
						
					if(data.day6.weather.forecast6days[0].sky.pmCode6day == "SKY_W01"){	
						icons.add("n5weath", Skycons.CLEAR_DAY);
						
					}else if(data.day6.weather.forecast6days[0].sky.pmCode6day == "SKY_W02"){
						icons.add("n5weath", Skycons.PARTLY_CLOUDY_DAY);
								
					}else if(data.day6.weather.forecast6days[0].sky.pmCode6day == "SKY_W03"){
						icons.add("n5weath", Skycons.CLOUDY);

					}else if(data.day6.weather.forecast6days[0].sky.pmCode6day == "SKY_W04"){
						icons.add("n5weath", Skycons.FOG);
								
					}else if(data.day6.weather.forecast6days[0].sky.pmCode6day == "SKY_W07" ||
							data.day6.weather.forecast6days[0].sky.pmCode6day == "SKY_W09" ||
							data.day6.weather.forecast6days[0].sky.pmCode6day == "SKY_W10"){
						icons.add("n5weath", Skycons.RAIN);
							 
					}else if(data.day6.weather.forecast6days[0].sky.pmCode6day == "SKY_W11" ||
							data.day6.weather.forecast6days[0].sky.pmCode6day == "SKY_W12" ||
							data.day6.weather.forecast6days[0].sky.pmCode6day == "SKY_W13"){
						icons.add("n5weath", Skycons.SNOW);
							
					}
					
					//6일후 날씨/ 날짜 /온도
					$("#n6temp").append("<span>"+data.day6.weather.forecast6days[0].temperature.tmax7day+
							"/"+ data.day6.weather.forecast6days[0].temperature.tmin7day+ "</span>");
						
					if(data.day6.weather.forecast6days[0].sky.pmCode7day == "SKY_W01"){	
						icons.add("n6weath", Skycons.CLEAR_DAY);
						
					}else if(data.day6.weather.forecast6days[0].sky.pmCode7day == "SKY_W02"){
						icons.add("n6weath", Skycons.PARTLY_CLOUDY_DAY);
								
					}else if(data.day6.weather.forecast6days[0].sky.pmCode7day == "SKY_W03"){
						icons.add("n6weath", Skycons.CLOUDY);

					}else if(data.day6.weather.forecast6days[0].sky.pmCode7day == "SKY_W04"){
						icons.add("n6weath", Skycons.FOG);
								
					}else if(data.day6.weather.forecast6days[0].sky.pmCode7day == "SKY_W07" ||
							data.day6.weather.forecast6days[0].sky.pmCode7day == "SKY_W09" ||
							data.day6.weather.forecast6days[0].sky.pmCode7day == "SKY_W10"){
						icons.add("n6weath", Skycons.RAIN);
							 
					}else if(data.day6.weather.forecast6days[0].sky.pmCode7day == "SKY_W11" ||
							data.day6.weather.forecast6days[0].sky.pmCode7day == "SKY_W12" ||
							data.day6.weather.forecast6days[0].sky.pmCode7day == "SKY_W13"){
						icons.add("n6weath", Skycons.SNOW);
							
					}
					
					
					
					$("#ndate").append(nextDate.format("E").trim().substr(0,1));
					$("#n2date").append(next2Date.format("E").trim().substr(0,1));
					$("#n3date").append(next3Date.format("E").trim().substr(0,1));
					$("#n4date").append(next4Date.format("E").trim().substr(0,1));
					$("#n5date").append(next5Date.format("E").trim().substr(0,1));
					$("#n6date").append(next6Date.format("E").trim().substr(0,1));
					icons.play();
				}
			});
			
			
			//도넛 시작
			var options = {
					legend : false,
					responsive : false
				};

				new Chart(document.getElementById("canvas1"), {
					type : 'doughnut',
					tooltipFillColor : "rgba(51, 51, 51, 0.55)",
					data : {
						labels : [ "Symbian", "Blackberry", "Other",
								"Android", "IOS" ],
						datasets : [ {
							data : [ 15, 20, 30, 10, 30 ],
							backgroundColor : [ "#BDC3C7", "#9B59B6",
									"#E74C3C", "#26B99A", "#3498DB" ],
							hoverBackgroundColor : [ "#CFD4D8", "#B370CF",
									"#E95E4F", "#36CAAB", "#49A9EA" ]
						} ]
					},
					options : options
				});
			//도넛 종료
			
		});
	
	</script>
</body>
</html>
