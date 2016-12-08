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
   
   var arr0 = new Array();
   var arr1 = new Array();
   var arr2 = new Array();
   var arr3 = new Array();
   var arr4 = new Array();
   var arr5 = new Array();
   var arr6 = new Array();
   
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
       
               /*    var year=new Date().getFullYear();
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
                  
                  var inter0=0;
                  var inter1=0;
                  var inter2=0;
                  var inter3=0;
                  var inter4=0;
                  var inter5=0;
                  var inter6=0;
                  
                  var hi0;
                  var hi1;
                  var hi2;
                  var hi3;
                  var hi4;
                  var hi5;
                  var hi6;
                  
                  var bye0;
                  var bye1;
                  var bye2;
                  var bye3;
                  var bye4;
                  var bye5;
                  var bye6;
                  
                  var interval=0;
                   */
                  for(var i=0;i<7;i++){
                	  
                	  
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
                       
                       var inter0=0;
                       var inter1=0;
                       var inter2=0;
                       var inter3=0;
                       var inter4=0;
                       var inter5=0;
                       var inter6=0;
                       
                       var hi0;
                       var hi1;
                       var hi2;
                       var hi3;
                       var hi4;
                       var hi5;
                       var hi6;
                       
                       var bye0;
                       var bye1;
                       var bye2;
                       var bye3;
                       var bye4;
                       var bye5;
                       var bye6;
                       
                       var interval=0;
                       
                	  
                	  
                  $.each(data.mjrolist, function(index, obj) {
                
                	  
                	 if(Number(obj.o_code)!=i){
                	  
                      var time00=date+" "+obj.r_start;  //time2 = "2016-12-7 05:30:00" ->첫차시간
                      var time01=new Date(time00);  //time3 = Wed Dec 07 2016 05:30:00  ->(대한민국 표준시)
                      var time02=new Date(time00);  //time4 = Wed Dec 07 2016 05:30:00  ->(대한민국 표준시)
            
                      var time10=date+" "+obj.r_start; 
                      var time11=new Date(time10);  
                      var time12=new Date(time10);  

                      var time20=date+" "+obj.r_start;  
                      var time21=new Date(time20);  
                      var time22=new Date(time20); 

                      var time30=date+" "+obj.r_start;  
                      var time31=new Date(time30);
                      var time32=new Date(time30);  
         
                      var time40=date+" "+obj.r_start;  
                      var time41=new Date(time40);  
                      var time42=new Date(time40); 
           
                      var time50=date+" "+obj.r_start; 
                      var time51=new Date(time50);  
                      var time52=new Date(time50); 
               
                      
                      var time60=date+" "+obj.r_start; 
                      var time61=new Date(time60);  
                      var time62=new Date(time60);
                  
                      interval=Number(obj.r_interval);
                      
       
                      var dayoff=obj.o_code;  //휴무요일
                  
                  
                      time01.setMinutes(time01.getMinutes()+inter0);
                      time02.setMinutes(time02.getMinutes()+interval+inter0)   
                      starttime0=time01.getHours().toString()+":"+time01.getMinutes().toString();      
                      endtime0=  time02.getHours().toString()+":"+time02.getMinutes().toString();       
                      inter0+=interval;           
                    
                      
                      hi1=time11.setMinutes(time11.getMinutes()+inter1);
                      bye1=time12.setMinutes(time12.getMinutes()+interval+inter1)   
                      starttime1=time11.getHours().toString()+":"+time11.getMinutes().toString();      
                      endtime1=  time12.getHours().toString()+":"+time12.getMinutes().toString();       
                      inter1+=interval;           
                     
                      
                      hi2=time21.setMinutes(time21.getMinutes()+inter2);
                       bye2=time22.setMinutes(time22.getMinutes()+interval+inter2)   
                      starttime2=time21.getHours().toString()+":"+time21.getMinutes().toString();      
                      endtime2=  time22.getHours().toString()+":"+time22.getMinutes().toString();       
                      inter2+=interval;         
                     
                      
                      hi3=time31.setMinutes(time31.getMinutes()+inter3);
                      bye3=time32.setMinutes(time32.getMinutes()+interval+inter3)   
                      starttime3=time31.getHours().toString()+":"+time31.getMinutes().toString();      
                      endtime3=  time32.getHours().toString()+":"+time32.getMinutes().toString();       
                      inter3+=interval;            
                    
                      
                      hi4=time41.setMinutes(time41.getMinutes()+inter4);
                      bye4=time42.setMinutes(time42.getMinutes()+interval+inter4)   
                      starttime4=time41.getHours().toString()+":"+time41.getMinutes().toString();      
                      endtime4=  time42.getHours().toString()+":"+time42.getMinutes().toString();      
                      inter4+=interval;         
                      
                      
                      hi5=time51.setMinutes(time51.getMinutes()+inter5);
                      bye5=time52.setMinutes(time52.getMinutes()+interval+inter5)   
                      starttime5=time51.getHours().toString()+":"+time51.getMinutes().toString();     
                      endtime5=  time52.getHours().toString()+":"+time52.getMinutes().toString();       
                      inter5+=interval;           
                     
                      
                      hi6=time61.setMinutes(time61.getMinutes()+inter6);
                      bye6=time62.setMinutes(time62 .getMinutes()+interval+inter6)   
                      starttime6=time61.getHours().toString()+":"+time61.getMinutes().toString();      
                      endtime6=  time62.getHours().toString()+":"+time62.getMinutes().toString();      
                      inter6+=interval;          
                      
                	 
  
                     
                    switch(dayoff){
                   
                     case "0":
                   //  dowarray=[1, 2, 3, 4, 5, 6]; 
            
                  Start=starttime0;
                  End=endtime0;
                  break;
                     
                     case "1":
                    // dowarray=[0, 2, 3, 4, 5, 6]; 
     
                        Start=starttime1;
                  End=endtime1;
                  break;
                  
                     case "2":
                     //  dowarray=[0, 1, 3, 4, 5, 6]; 
               
                        Start=starttime2;
                       End=endtime2;
                  break;
                  
                     case "3":
                     //  dowarray=[0, 1, 2, 4, 5, 6]; 
                    
                        Start=starttime3;
                  End=endtime3;
                  break;
                  
                     case "4":
                     //dowarray=[0, 1, 2, 3, 5, 6]; 
                  
                        Start=starttime4;
                  End=endtime4;
                  break;
                  
                     case "5":
                    //  dowarray=[0, 1, 2, 3, 4, 6]; 
                      
                        Start=starttime5;
                  End=endtime5;
                  break;
                  
                     case "6":
                     // dowarray=[0, 1, 2, 3, 4, 5]; 
                       
                    Start=starttime6;
                  End=endtime6;
                  break;
                     
                     }  //휴무요일에 따라서 근무 요일 지정
                     
                	 
                	
                     
                     var item = {
                        title : obj.m_name,
                       id : obj.m_id,
                        start : Start,
                        end:  End,
                        dow :[i]
                     };
                     array.push(item);
                     console.log('item : '+item);
                	 
                	 }
          /////////////////////뀨
          
          
          
                   
                  });
                  }///for문
                 
            
                 
                
                  
                  
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
            events :  array 

      
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