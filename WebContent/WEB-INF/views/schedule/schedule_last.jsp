<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "se" uri = "http://www.springframework.org/security/tags" %>

<!--
 * @File Name: schedule_last.jsp
 * @Author: 김수현
 * @Data: 2016. 11. 29
 * @Desc: 일정관리(최종스케줄) - 테이블
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
                <!-- <h3>Calendar <small>Click to add/edit events</small></h3> -->
              </div>

              <div class="title_right">
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
            </div>
            <div class="clearfix"></div>
            
          <!-- 본문 내용시작 -->
            	<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								<small>마을버스    시내버스     시외버스</small>
							</h3>
						</div>
					</div>
					<div class="clearfix"></div>

					<div class="row">
						<div id="showdiv">


							<div class="row">
								<div class="col-sm-12 col-xs-12">
									<div class="col-md-12 col-xs-12">
										<div class="x_panel">

											<div class="x_content" id="commutesearchstarttableinfo">
												<table style="text-align: center"
													class="table table-hover projects">	
													<thead>
														<tr>
															<th class='backslash' style='width:75px'><div>일(日)</div>이름</th>
															 <c:forEach var="i"  begin="1" end="31" step="1">
															  <%-- <c:forEach var="i" items="${list}"> --%>	
															  	<th>${i}</th>
															  </c:forEach>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="i" items="${list}">
															<tr>
																<td>${i.m_name}</td>
																
																<c:forEach var="i" items="${list}" begin="1" end="31">
									
																<td>${i.cs_stat}</td>
																</c:forEach>
															</tr>
														</c:forEach>
													</tbody>	
												</table> 
												
											</div>


										</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
            
            
						<!-- 본문 내용 끝 -->
        
          </div>
        </div>
        
        
        
        
        
        
        
        <!-- /page content -->

        <!-- footer content -->
        <footer>
          <div class="pull-right">
            Gentelella - Bootstrap Admin Template by <a href="https://colorlib.com">Colorlib</a>
          </div>
          <div class="clearfix"></div>
        </footer>
        <!-- /footer content -->
      </div>
    </div>

   
   
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
</html>