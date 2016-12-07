<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
   uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--
 * @File Name: calendar_reguloff.jsp
 * @Author: 김수현
 * @Data: 2016. 12. 01
 * @Desc: 일정관리(실행될스케줄) -  풀캘린더 ui
-->
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.disabled {
   background-color: black;
}
</style>
<se:authentication property="name" var="LoginUser" />
<!-- jQuery -->
<script
   src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>최종 예상 스케줄</title>

<!-- Bootstrap -->

<script src="${pageContext.request.contextPath}/NewLoader/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/NewLoader/js/jquery.oLoader.min.js"></script>
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
<!-- FullCalendar -->
<link
   href="${pageContext.request.contextPath}/vendors/fullcalendar/dist/fullcalendar.css"
   rel="stylesheet">
<link
   href="${pageContext.request.contextPath}/vendors/fullcalendar/dist/fullcalendar.print.css"
   rel="stylesheet" media="print">

<!-- Custom styling plus plugins -->
<link href="${pageContext.request.contextPath}/build/css/custom.min.css"
   rel="stylesheet">
<style>
#wrap {
   width: 100%;
   margin: 0 auto;
}

#external-events hr {
   color: red;
   border: thin;
}

#external-events {
   margin-left: 65%;
   width: 10%;
   padding: 0 1%;
   border: 1% solid #ccc;
   background: #eee;
   text-align: left;
   position: fixed;
   font-size: 100%;
   top: 30%;
   text-align: center;
}

#external-events h4 {
   font-size: 16px;
   margin-top: 0;
   padding-top: 1em;
}

#external-events .fc-event {
   margin: 10px 0;
   cursor: pointer;
}

#external-events p {
   margin: 1.5em 0;
   font-size: 11px;
   color: #666;
}

#external-events select {
   width: 100%;
}

#external-events p input {
   margin: 0;
   vertical-align: middle;
}

#calendar {
   float: left;
   width: 80%;
}

select#selectedrnum {
   -webkit-appearance: button;
   -webkit-border-radius: 2px;
   -webkit-box-shadow: 0px 1px 3px rgba(0, 0, 0, 0.1);
   -webkit-padding-end: 10px;
   -webkit-padding-start: 2px;
   -webkit-user-select: none;
   background-image: url(http://i62.tinypic.com/15xvbd5.png),
      -webkit-linear-gradient(#FAFAFA, #F4F4F4 40%, #E5E5E5);
   background-position: 97% center;
   background-repeat: no-repeat;
   border: 1px solid #AAA;
   color: #555;
   font-size: inherit;
   overflow: hidden;
   padding: 5px 10px; 
   text-overflow: ellipsis;
   white-space: nowrap;
   width: 150px;
}
</style>

</head>
<script>
   
</script>

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
            <div class="">
               <div class="page-title">
                  <div class="title_left">
                     <h3>
                         예상 스케줄 <i class="fa fa-calendar"></i>
                     </h3>
                  </div>

               </div>

               <div class="clearfix"></div>

               <div class="row">
                  <div class="col-md-12">
                     <div class="x_panel">
                        <div class="x_title">
                           <h2>
                              <select id="selectedrnum">
                                 <option value="0">노선선택</option>
                                 <c:forEach var="rlist" items="${routelist}">
                                    <option value="${rlist.r_num}">${rlist.r_num}</option>
                                 </c:forEach>
                              </select>
                              <!--  <small>Sessions</small> -->

                           </h2>
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

                           <div id='wrap'>


                              <div id='calendar2'>
                                 <div id='calendar'></div>
                              </div>
                              <div style='clear: both'></div>

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

   <!-- calendar modal -->
   <!-- /calendar modal -->
   <script>
   var array = new Array();
   var dowarray = new Array();
      $(function() {
       
         //rlist.r_num
         
         $('#selectedrnum').change(function() {
            array = [];
            console.log('선택한 노선번호(r_num): ' + $('#selectedrnum').val());
            var param = $('#selectedrnum').val();
            var view = "";
            $.ajax({
               url : "lastpredictschedule.admin",
               type : "post",
               data : {
                  "r_num" : param
               },
               success : function(data) {
                  
                  
                  
                  var year=new Date().getFullYear();
                  var month=new Date().getMonth()+1;
                  var day=new Date().getDate();
                  var date=year.toString()
                     +"-"+month.toString()
                     +"-"+day.toString();
                  
                  var test=0;
                  var ocode="";
                  var ocode2="";
                  
                  var Start="";
                  var End="";
                  
                  var starttime0="";
                  var starttime1="";
                  var starttime2="";
                  var starttime3="";
                  var starttime4="";
                  var starttime5="";
                  var starttime6="";
                  
                  var endtime0="";
                  var endtime1="";
                  var endtime2="";
                  var endtime3="";
                  var endtime4="";
                  var endtime5="";
                  var endtime6="";
                  
                  var inter0;
                  var inter1;
                  var inter2;
                  var inter3;
                  var inter4;
                  var inter5;
                  var inter6;
                  
                  var interval=0;
                  
                  $.each(data.mjrolist, function(index, obj) {
                     
                     var dayoff=obj.o_code;  //휴무요일
                     interval=Number(obj.r_interval);
                    
                     starttime0=obj.r_start+inter0;    			 // o_code가 "0"일때 첫차 시간 
                     endtime0=starttime0+interval; 	             // o_code가 "0"일때 첫차 + r_interval
                     inter0+=Number(obj.r_interval); 		     //배차간격
                     
                     starttime1=obj.r_start+inter1;    			 // o_code가 "1"일때 첫차 시간 
                     endtime1=starttime1+interval; 	             // o_code가 "1"일때 첫차 + r_interval
                     inter1 +=Number(obj.r_interval); 				     //배차간격
                     
                     starttime2=obj.r_start+inter2;    			 // o_code가 "2"일때 첫차 시간 
                     endtime2=starttime2+interval; 	             // o_code가 "2"일때 첫차 + r_interval
                     inter2+=Number(obj.r_interval);			     //배차간격
                     
                     starttime3=obj.r_start+inter3;    			 // o_code가 "3"일때 첫차 시간 
                     endtime3=starttime3+interval; 	             // o_code가 "3"일때 첫차 + r_interval
                     inter3+=Number(obj.r_interval);				     //배차간격
                     
                     starttime4=obj.r_start+inter4;    			 // o_code가 "4"일때 첫차 시간 
                     endtime4=starttime4+interval; 	             // o_code가 "4"일때 첫차 + r_interval
                     inter4+=Number(obj.r_interval); 				     //배차간격
                     
                     starttime5=obj.r_start+inter5;    			 // o_code가 "5"일때 첫차 시간 
                     endtime5=starttime5+interval; 	             // o_code가 "5"일때 첫차 + r_interval
                     inter5+=Number(obj.r_interval); 				     //배차간격
                     
                     starttime6=obj.r_start+inter6;    			 // o_code가 "6"일때 첫차 시간 
                     endtime6=starttime6+interval; 	             // o_code가 "6"일때 첫차 + r_interval
                     inter6+=Number(obj.r_interval); 	 		 //배차간격
                                      
                     switch(dayoff){
                   
                     case "0":
                        dowarray=[1, 2, 3, 4, 5, 6]; 
						Start=starttime0;
						End=endtime0;
						break;
                     case "1":
                        dowarray=[0, 2, 3, 4, 5, 6]; break;
                        Start=starttime1;
						End=endtime1;
                     case "2":
                        dowarray=[0, 1, 3, 4, 5, 6]; break;
                        Start=starttime2;
						End=endtime2;
                     case "3":
                        dowarray=[0, 1, 2, 4, 5, 6]; break;
                        Start=starttime3;
						End=endtime3;
                     case "4":
                        dowarray=[0, 1, 2, 3, 5, 6]; break;
                        Start=starttime4;
						End=endtime4;
                     case "5":
                        dowarray=[0, 1, 2, 3, 4, 6]; break;
                        Start=starttime5;
						End=endtime5;
                     case "6":
                        dowarray=[0, 1, 2, 3, 4, 5]; break;
                        Start=starttime6;
						End=endtime6;
                     
                     }  //휴무요일에 따라서 근무 요일 지정
                     
                     
                     var time2=date+" "+obj.r_start;
                     console.log('time2 : '+time2);
                     var time3=new Date(time2);
                     console.log('time3 :'+time3);
                     var time4=new Date(time2);
                     console.log('time4 : '+time4);
                     time3.setMinutes(time3.getMinutes()+test);
                     var starttime=time3.getHours().toString()+":"+time3.getMinutes().toString(); //time2.time();
                     console.log('starttime : '+starttime);
                     time4.setMinutes(time3.getMinutes()+10);
                     var endtime=time4.getHours().toString()+":"+time4.getMinutes().toString();
                     console.log('endtime : '+endtime);
         		     var st=starttime+":00";
         		    console.log('st: '+st);
                     var et=endtime+":00";
                     console.log('et : '+et);
                    
                     
                     
                     var item = {
                        title : obj.m_name,
                        id : obj.m_id,
                        start : Start,
                        end:   End,
                        dow : dowarray 
                     };
                     console.log('item : '+item); 
                     array.push(item);
                  //   interval.push(obj.r_interval);
                
                    
                     
                   
                  });
                 
            
                 

                  
                  
               }
            });
         });//change
      });//ready
      $(document).ajaxStop(function(){
         $('#calendar2').empty();
         $('#calendar2').append('<div id="calendar"></div>');
         $('#calendar').fullCalendar({
            defaultView:'agendaWeek',
            header : {
               left : 'prev,next today',
               center : 'title',
               right : 'agendaWeek,agendaDay'
            },

            slotDuration : '00:10:00',
            buttonIcons : false, // show the prev/next text
            weekNumbers : true,
            navLinks : true, // can click day/week names to navigate views
            editable : true,
            eventLimit : true, // allow "more" link when too many events
            events : array

      
         });
      });
         

      
   </script>
   <!-- Bootstrap -->
   <script
      src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
   <!-- FastClick -->
   <script
      src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
   <!-- NProgress -->
   <script
      src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
   <!-- FullCalendar -->
   <script
      src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
   <script
      src="${pageContext.request.contextPath}/vendors/fullcalendar/dist/fullcalendar.min.js"></script>

   <script
      src="${pageContext.request.contextPath}/vendors/fullcalendar/dist/jquery-ui.min.js"></script>

   <!-- Custom Theme Scripts -->
   <script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>

   <!-- FullCalendar -->
   <script
      src="${pageContext.request.contextPath }/js/schedule_managereguloff.js"></script>
</body>
</html>