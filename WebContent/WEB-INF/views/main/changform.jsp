<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>KOSBUS</title>
	    <!-- jQuery -->
	    
	    <script src="${pageContext.request.contextPath}/NewLoader/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/NewLoader/js/jquery.oLoader.min.js"></script>
   
    <!-- Bootstrap -->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link href="${pageContext.request.contextPath}/vendors/font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <!-- NProgress -->
    <link href="${pageContext.request.contextPath}/vendors/nprogress/nprogress.css" rel="stylesheet">
    <!-- bootstrap-daterangepicker -->
    <link href="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css" rel="stylesheet">
    
    <!-- Custom Theme Style -->
    <link href="${pageContext.request.contextPath}/build/css/custom.min.css" rel="stylesheet">
  </head>

  <body class="nav-md">
    <div class="container body">
      <div class="main_container">
       <div class="col-xs-12  col-md-3 left_col">

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
          <div class="">
            <div class="page-title">
              <div class="title_left">
                <h3>개인정보</h3>
              </div>

             
            </div>
            
            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  
                  <div class="x_content">
                    <div class="col-md-3 col-sm-3 col-xs-12 profile_left">
                      <div class="profile_img">
                        <div id="crop-avatar">
                          <!-- Current avatar -->
                          <img class="img-responsive avatar-view" src="${pageContext.request.contextPath}/join/upload/${dto.m_photo}" alt="Avatar" title="Change the avatar">
                        </div>
                      </div>
                      <h3>${dto.m_name}</h3>
						<br>
                      <ul class="list-unstyled user_data">
                      	<li>
                      		<i class="fa fa-openid user-profile-icon"></i>&nbsp;&nbsp;${dto.m_id}
                      	</li>
                        <li>
                          <i class="fa fa-briefcase user-profile-icon"></i>&nbsp;&nbsp;${dto.j_name}
                        </li>
						<li>
							<c:choose>
								<c:when test="${dto.m_gender == 'male'}">
									 <i class="fa fa-male user-profile-icon"></i>&nbsp;남성
								</c:when>
								<c:otherwise>
									<i class="fa fa-female user-profile-icon"></i>&nbsp;&nbsp;&nbsp;여성
								</c:otherwise>
							</c:choose>
						</li>
                        <li class="m-top-xs">
                          <i class="fa fa-external-link user-profile-icon"></i>&nbsp;&nbsp;${dto.m_email}
                        </li>
                        <li>
                        	<i class="fa fa-phone user-profile-icon"></i>&nbsp;&nbsp;&nbsp;${dto.m_phone}
                        </li> 
                        <li>
                        	<i class="fa fa-birthday-cake user-profile-icon"></i>&nbsp;&nbsp;${dto.m_birth}
                        </li>
                        <li>
                        	<i class="fa fa-map-marker user-profile-icon"></i>&nbsp;&nbsp;&nbsp;&nbsp;${dto.m_addr}
                        	<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${dto.m_daddr}
                        </li>
                        <li>
                        	<i class="fa fa-calendar user-profile-icon"></i>&nbsp;&nbsp;연차 ${dto.m_annual}일
                        </li>
                      </ul>
					
					<a class="btn btn-success" id="pass" style = "margin-top: 10px;border: 0"><i class="fa fa-edit m-right-xs"></i>&nbsp;정보수정</a> 
					<a class="btn btn-success" id="watch" style = "margin-top: 10px;background: #286090; border: 0"><i class = "fa fa-book m_right-xs"></i>&nbsp;이력보기</a>
                      
                      <br />

                      

                    </div>
                    <div class="col-md-1 col-sm-1 col-xs-1"></div>
                    <div class="col-md-8 col-sm-8 col-xs-12">
					<br>
<!--                       <div class="profile_title" style="text-align: right"> -->
                        <div>
                          <h3 style="text-align: center">출결 현황</h3>
                        </div>
           				<!-- </div>  -->           
                      
                      <!-- start of user-activity-graph -->
                      <div id="graph_bar" style="width:100%; height:290px;"></div>
                      <!-- end of user-activity-graph -->
						
                     
                    </div>
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
    </div>


<!-- BEGIN # MODAL LOGIN -->
	<div class="modal fade" id="new-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	<div class="modal-dialog">
			<div class="modal-content">      
                <!-- Begin # DIV Form -->
                <div id="div-forms">
                <div class="modal-header" align="center">
					<h3>이력보기</h3>
				</div>
                    <!-- Begin # Login Form -->
                    <form id="login-form" action="" method="post">
		                <div class="modal-body">
		                	<table class="table">
		                	<thead>
		                		<tr>
		                			<th style="width: 15%">이력구분</th>
		                			<th style="width: 20%">근무시작일</th>
		                			<th style="width: 20%">근무종료일</th>
		                			<th style="width: 20%">근무회사</th>
		                			<th style="width:25%">근무기간</th>
		                		</tr>
		                	</thead>
		                	<tbody>
		                		<c:forEach var="lists" items="${list }">
		                		<tr>
		                			<td style="width: 15%">${lists.res_name }</td>
		                			<td style="width: 20%">${lists.res_start }</td>
		                			<td style="width: 20%">${lists.res_end }</td>
		                			<td style="width: 20%">${lists.res_com }</td>
		                			<td style="width: 25%">${lists.res_period }</td>
		                		</tr>
		                		</c:forEach>		                	
		                	</tbody>
		                	
		                	</table>
				     	</div>
        		    	<div class="modal-footer">
                            <div>
                                <a href="redirect:/ChangeForm.htm"><button type="submit" class="btn btn-success" data-dismiss = "modal">완료</button></a>
                            </div>
        		    	</div>
                    </form>
                    <!-- End # Login Form -->  
                </div>
                <!-- End # DIV Form --> 
			</div>
		</div>
	</div>
	<!-- end modal -->
	
	<!-- BEGIN # MODAL LOGIN -->
	<div class="modal fade" id="pass-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	<div class="modal-dialog">
			<div class="modal-content">      
                <!-- Begin # DIV Form -->
                <div id="div-forms">
                <div class="modal-header" align="center">
					<h3>비밀번호 입력</h3>
				</div>
                    <!-- Begin # Login Form -->
                    <form id="login-form" action="updateinfo.htm" method="post">
		                <div class="modal-body">
		                	<div style = "text-align:center">
		                	<label for ="m_pw">비밀번호 </label>
		                	<input type = "password" name = "m_pw" id = "m_pw">
		                	</div>
				     	</div>
        		    	<div class="modal-footer">
                            <div>
                                <input type="submit" class="btn btn-success" value = "완료">
                                <button type="button" class="btn btn-default"
											data-dismiss="modal">닫기</button>
                            </div>
        		    	</div>
                    </form>
                    <!-- End # Login Form -->  
                </div>
                <!-- End # DIV Form --> 
			</div>
		</div>
	</div>
	<!-- end modal -->
	
	
	<script type="text/javascript">
	$(document).ready(function() {
		$('#watch').click(function(){
			$('#new-modal').modal();
		});
		
		$("#pass").click(function(){
			$("#pass-modal").modal();
		});
	});
	
	</script>







    <!-- Bootstrap -->
    <script src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- FastClick -->
    <script src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
    <!-- NProgress -->
    <script src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
    <!-- morris.js -->
    <script src="${pageContext.request.contextPath}/vendors/raphael/raphael.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/morris.js/morris.min.js"></script>
    <!-- bootstrap-progressbar -->
    <script src="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
    <!-- bootstrap-daterangepicker -->
    <script src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>
    
    <!-- Custom Theme Scripts -->
    <script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>

    <script>
      $(function() {
    			  $.oPageLoader(); 

    	  
        Morris.Bar({
          element: 'graph_bar',
          data: [
            { "period": "1월", "출근": ${list2[0]},"지각":${list2[12]} },  /// 에러 무시할것
            { "period": "2월", "출근": ${list2[1]},"지각":${list2[13]} }, 
            { "period": "3월", "출근": ${list2[2]},"지각":${list2[14]} }, 
            { "period": "4월", "출근": ${list2[3]},"지각":${list2[15]} }, 
            { "period": "5월", "출근": ${list2[4]},"지각":${list2[16]} }, 
            { "period": "6월", "출근": ${list2[5]},"지각":${list2[17]} }, 
            { "period": "7월", "출근": ${list2[6]},"지각":${list2[18]} }, 
            { "period": "8월", "출근": ${list2[7]},"지각":${list2[19]} }, 
            { "period": "9월", "출근": ${list2[8]},"지각":${list2[20]} }, 
            { "period": "10월", "출근": ${list2[9]},"지각":${list2[21]} },
            { "period": "11월", "출근": ${list2[10]},"지각":${list2[22]} },
            { "period": "12월", "출근": ${list2[11]},"지각":${list2[23]} }
            
          ],
          xkey: 'period',
          hideHover: 'auto',
          barColors: ['#26B99A', '#34495E', '#ACADAC', '#3498DB'],
          ykeys: ['출근', '지각'],
          labels: ['출근', '지각'],
          xLabelAngle: 60,
          resize: true
        });

        $MENU_TOGGLE.on('click', function() {
          $(window).resize();
        });
      });
    </script>

  </body>
</html>