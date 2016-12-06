<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "se" uri = "http://www.springframework.org/security/tags" %>

<!--
 * @File Name: calendar_reguloff.jsp
 * @Author: 길한종
 * @Data: 2016. 11. 22
 * @Desc: 일정관리(정기휴무) -  풀캘린더 ui
-->
<!DOCTYPE html>
<html>
  <head>
  <style type="text/css">
  	.disabled{
  		background-color:black;
  	}
  </style>
  <se:authentication property="name" var = "LoginUser"/>
   <!-- jQuery -->
    <script src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Gentellela Alela! | </title>

    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- FullCalendar -->
    <link href="${pageContext.request.contextPath}/vendors/fullcalendar/dist/fullcalendar.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/vendors/fullcalendar/dist/fullcalendar.print.css" rel="stylesheet" media="print">

    <!-- Custom styling plus plugins -->
    <link href="${pageContext.request.contextPath}/build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
     <div class="col-md-3 left_col">
				<jsp:include page="/sidebar/sidebar2.jsp"></jsp:include>
			</div>
		
		<!--상단 menu -->
			<div class="top_nav">
				<jsp:include page="/sidebar/menuHeader.jsp"></jsp:include>
			</div>
    
        <!-- page content -->
        <div class="right_col" role="main">
          <div class="">
            <div class="page-title">
              <div class="title_left">
              </div>

              
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                  <div class="input-group">
                    <!-- <input type="text" class="form-control" placeholder="Search for..."> -->
                    <input type="hidden" id="hidden" value="${LoginUser}">
                    <span class="input-group-btn">
                      <!-- <button class="btn btn-default" type="button">Go!</button> -->
                    </span>
                  </div>
                </div>
             
            </div>

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12">
              <ul class="nav nav-tabs" style="border-bottom:0px">
  				<li role="presentation" class="active"><a href="schedule_reguloff.htm">정기휴무신청</a></li>
  				<li role="presentation"><a href="schedule_history.htm?m_id=${LoginUser}">신청내역조회</a></li>
			  </ul>
                <div class="x_panel">
                
                  <!-- <div class="x_title">
                    <h2>Calendar Events <small>Sessions</small></h2>
                    <ul class="nav navbar-right panel_toolbox">
                      <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                      </li>
                      <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                        <ul class="dropdown-menu" role="menu">
                          <li><a href="#">Settings 1</a>
                          </li>
                          <li><a href="#">Settings 2</a>
                          </li>
                        </ul>
                      </li>
                      <li><a class="close-link"><i class="fa fa-close"></i></a>
                      </li>
                    </ul>
                    <div class="clearfix"></div>
                  </div> -->
                  <div class="x_content">

                    <div id='calendar'></div>

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
        <!--   <div class="clearfix"></div> -->
        </footer>
        <!-- /footer content -->
      </div>
    </div>

    <!-- calendar modal -->
    <div id="CalenderModalNew" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="myModalLabel">일정 추가</h4>
          </div>
          <div class="modal-body">
            <div id="testmodal" style="padding: 5px 20px;">
              <form id="antoform" class="form-horizontal calender" role="form">
                <div class="form-group">
                  <label class="col-sm-3 control-label">기사 이름</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="title" name="title" readonly>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">휴무 요일</label>
                  <div class="col-sm-9">
                  	<select id="select1" class="form-control">
                  		<option value="">요일 선택</option>
                  		<option value="1">월요일</option>
                  		<option value="2">화요일</option>
                  		<option value="3">수요일</option>
                  		<option value="4">목요일</option>
                  		<option value="5">금요일</option>
                  		<option value="6">토요일</option>
                  		<option value="0">일요일</option>
                  	</select>
                
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default antoclose" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-primary antosubmit">저장</button>
          </div>
        </div>
      </div>
    </div>
    <div id="CalenderModalEdit" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">

          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <h4 class="modal-title" id="myModalLabel2">일정 수정</h4>
          </div>
          <div class="modal-body">

            <div id="testmodal2" style="padding: 5px 20px;">
              <form id="antoform2" class="form-horizontal calender" role="form">
                <div class="form-group">
                  <label class="col-sm-3 control-label">기사 이름</label>
                  <div class="col-sm-9">
                    <input type="text" class="form-control" id="title2" name="title2" readonly>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-3 control-label">휴무요일</label>
                  <div class="col-sm-9">
                    <select id="select2" class="form-control">
                  		<option value="">요일 선택</option>
                  		<option value="1">월요일</option>
                  		<option value="2">화요일</option>
                  		<option value="3">수요일</option>
                  		<option value="4">목요일</option>
                  		<option value="5">금요일</option>
                  		<option value="6">토요일</option>
                  		<option value="0">일요일</option>
                  	</select>
                  </div>
                </div>

              </form>
            </div>
          </div>
          <div class="modal-footer">
          	<button type="button" class="btn btn-default" data-dismiss="modal" id="deleteschedule">삭제</button>
            <button type="button" class="btn btn-default antoclose2" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-primary antosubmit2">저장</button>
          </div>
        </div>
      </div>
    </div>

    <div id="fc_create" data-toggle="modal" data-target="#CalenderModalNew"></div>
    <div id="fc_edit" data-toggle="modal" data-target="#CalenderModalEdit"></div>
    <!-- /calendar modal -->
        
   <script src="${pageContext.request.contextPath}/NewLoader/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/NewLoader/js/jquery.oLoader.min.js"></script>
    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
    <!-- FullCalendar -->
    <script src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/fullcalendar/dist/fullcalendar.min.js"></script>

    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>

    <!-- FullCalendar -->
    <script src="${pageContext.request.contextPath}/js/schedule_reguloff.js"></script>   
    <!-- /FullCalendar -->
  </body>
  <script type="text/javascript">
  $(function(){
	  $.oPageLoader(); 
  });
  </script>
</html>