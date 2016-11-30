<!--
	제너용럴킹갓현  
	2016-11-17
	메인 관리자 사이드바 생성
 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="se" uri ="http://www.springframework.org/security/tags" %>
<div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
           <a href = "main.htm">
           	<img src="" style = "width:100%">
           	kosbus
           </a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile">
              <div class="profile_pic">
                <img class="img-circle profile_img" id = "m_photo2" style="width: 60px; height: 60px;">
              </div>
              <div class="profile_info">
               <se:authentication property="name" var = "LoginUser"/>
                <span><font color = "white" id = "m_name2"></font>님<br>안전운행 합시다</span>
                
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>&nbsp;</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-edit"></i> 버스관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="busenroll.admin">버스 등록/삭제</a></li>
                      <li><a href="realTime.admin">실시간 버스 위치</a></li>
                      <li><a href="chagozi.admin">차고지 별 버스 상태</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i>기사 관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="managereguloff.admin">기사 휴무 & 스케쥴 관리</a></li>
                      <li><a href="media_gallery.html">Media Gallery</a></li>
                      <li><a href="typography.html">Typography</a></li>
                      <li><a href="icons.html">Icons</a></li>
                      <li><a href="glyphicons.html">Glyphicons</a></li>
                      <li><a href="widgets.html">Widgets</a></li>
                      <li><a href="invoice.html">Invoice</a></li>
                      <li><a href="inbox.html">Inbox</a></li>
                      <li><a href="calendar.html">Calendar</a></li>
                    </ul>
                  </li>
                  
                   <!-- 임시페이지 -->
                  <li>
                  	<a href="commutebus.admin"><i>노선별 출결관리</i></a>
                  </li>
                  
                  
                  <li><a><i class="fa fa-table"></i>노선 관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="route.admin">노선</a></li>
                      <li><a href="busStation.admin">정류장</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i>운영 관리<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="chartjs.html">Chart JS</a></li>
                      <li><a href="chartjs2.html">Chart JS2</a></li>
                      <li><a href="morisjs.html">Moris JS</a></li>
                      <li><a href="echarts.html">ECharts</a></li>
                      <li><a href="other_charts.html">Other Charts</a></li>
                    </ul>
                  </li>
                  <li><a href="membermanage.admin"><i class="fa fa-clone"></i>회원 관리</a>
                  </li>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->
          </div>
          
          
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"name.htm",
			data:{"m_id":"${LoginUser}"},
			success:function(data){
				console.log(data.m_name);
				
				$("#m_name2").prepend(data.m_name);
			}
		});
		
		$.ajax({
			url:"photo.htm",
			data:{"m_id":"${LoginUser}"},
			success:function(data){
				console.log(data.m_photo);
				
				$("#m_photo2").attr("src", "${pageContext.request.contextPath}/join/upload/"+data.m_photo);
			}
		});
	});
</script>
          