 <!--
	제너용럴킹갓현  
	2016-11-17
	메인 사용자 사이드바 생성
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "se" uri = "http://www.springframework.org/security/tags" %>
<div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
         <!--  <img alt="" src=""> -->
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile">
              <div class="profile_pic">
                <img class="img-circle profile_img" id = "m_photo2">
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
                  <li><a><i class="fa fa-table"></i>스케줄 관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="schedule_reguloff.htm">정기휴무신청/조회</a></li>
                      <li><a href="schedule_history.htm?m_id=${LoginUser}">최종 스케줄</a></li>
                    </ul>
                  </li>
       
                  <li><a href="comsearch.member?m_id=${LoginUser}"> <i class="fa fa-list-alt"></i>출/퇴근 관리</a>
                
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
				
				$("#m_name2").append(data.m_name);
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