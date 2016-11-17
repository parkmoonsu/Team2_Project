<!--
	제너용럴킹갓현  
	2016-11-17
	메인 사용자 사이드바 생성
 -->








<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
           <img src="${pageContext.request.contextPath}/images/logo.jpg" style="width:100%;height:60px">
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile">
              <div class="profile_pic">
                <img src="${pageContext.request.contextPath}/images/logo2.png" class="img-circle profile_img">
              </div>
              <div class="profile_info">
                <span>환영합니다</span>
                <se:authentication property="name" var = "LoginUser"/>
                <h2>${LoginUser}</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <h3>사용자</h3>
                <ul class="nav side-menu">
                  <li><a><i class="fa fa-table"></i>스케줄 관리 <span class="fa fa-chevron-down"></span></a>
                    <ul class="nav child_menu">
                      <li><a href="tables.html">정기 휴무</a></li>
                      <li><a href="tables_dynamic.html">교대 신청/조회</a></li>
                      <li><a href="tables_dynamic.html">최종 스케줄</a></li>
                    </ul>
                  </li>
                  <li><a><i class="fa fa-bar-chart-o"></i>출/퇴근 조회</a>
                  </li>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->
          </div>