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
           	<img src="images/newlogo1.png" style = "width:100%; padding-top: 20px" >          
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
                      <li><a href="busreg.admin">버스 등록/삭제</a></li>
                      <li><a href="chagozi.admin">차고지 별 버스 상태</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-desktop"></i>기사 관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">	
                      <li><a href="membermanage.admin">회원 정보 확인 & 관리</a></li>
                      <li><a href="managereguloff.admin">휴무 미신청자 배정</a></li>
                      <li><a href="gethistorycal.admin">휴무신청 승인</a></li>
                    </ul>
                  </li>
                            
                  <li><a><i class="fa fa-table"></i>노선 관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="route.admin">노선 수정 & 확인</a></li>
                      <li><a href="busStation.admin">정류장 수정 & 확인</a></li>
                      <li><a href="realTime.admin">실시간 버스 정보 확인</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i>운영 관리<span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu"> 
                      <li><a href="busenroll.admin">버스 & 기사 배정</a></li>
                      <li><a href="changehistory.admin">휴무 변경 이력</a></li>
                      <li><a href="getvirtualschedule.admin">예상 스케줄 확인</a></li>
                    </ul>
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
          