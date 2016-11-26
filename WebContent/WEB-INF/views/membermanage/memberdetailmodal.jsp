<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal-dialog modal-lg" role="document">

   <div class="modal-content">
      <div class="modal-header">
         <button type="button" class="close" data-dismiss="modal"
            aria-label="Close">
            <span aria-hidden="true">&times;</span>
         </button>
         <h4 class="modal-title" id="exampleModalLabel1"></h4>
      </div>
      <div class="modal-body">


         <br />
         <form class="form-horizontal form-label-left input_mask">
          <div class="col-sm-2 col-md-2">
          </div>
            <div class="col-sm-4 col-md-4 col-xs-5" >
               <div class="thumbnail">
                  <img
                     src="<%=request.getServletContext().getContextPath()%>/join/upload/${dto.m_photo}"
                     alt="...">
               <!--    <div class="caption">
                     <h3></h3>
                     <p>^_^</p>
                     <p>
                        <a href="#" class="btn btn-default btn-sm" role="button">
                        <i class="fa fa-floppy-o">
                                       </i>download</a>
                        <a href="#" class="btn btn-default btn-sm" role="button">
                           <i class="fa fa-file-text-o"></i>
                      <br>
                      <br>
                      <br>                   경력조회</a>
                     </p>
                  </div> -->
                  <a href="download.admin?folder=upload&filename=${mjdrodto.m_photo}">
                  <i class="fa fa-floppy-o">save</i></a>
           
               </div>
            </div>
        
           
              <label class="control-label col-md-1 col-sm-2 col-xs-2">이름</label> 
             <div class="col-md-5 col-sm-4 col-xs-4 form-group has-feedback">
               <input type="text" class="form-control has-feedback-left"
                  id="inputSuccess2" value="${ mjdrodto.m_name }" readonly> <span
                  class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
            </div> 
          
    
           
    
         <!--   <div class="control-label col-md-2 col-sm-2 col-xs-1">
           </div> -->
        
        
           <label class="control-label col-md-1 col-sm-2 col-xs-2">ID</label> 
            <div class="col-md-5 col-sm-4 col-xs-4 form-group has-feedback">
               <input type="text" class="form-control has-feedback-left"
               id="inputSuccess3" value="${mjdrodto.m_id }" readonly> 
               <span class="fa fa-qq form-control-feedback left" aria-hidden="true"></span>
            </div>
       
             
         
         
            <label class="control-label col-md-1 col-sm-2 col-xs-2">우편번호</label> 
            <div class="col-md-5 col-sm-4 col-xs-4 form-group has-feedback">
               <input type="text" class="form-control has-feedback-left"
                  id="inputSuccess4" value="${mjdrodto.m_addr }" readonly> 
                  <span  class="fa fa-spinner form-control-feedback left"  aria-hidden="true"></span>
            </div>

            <label class="control-label col-md-1 col-sm-2 col-xs-2">상세주소</label> 
            <div class="col-md-5 col-sm-4 col-xs-4 form-group has-feedback">
               <input type="text" class="form-control has-feedback-left"
                id="inputSuccess5" value="${mjdrodto.m_daddr }" readonly> 
                 <span
                  class="fa fa-bank form-control-feedback left"
                  aria-hidden="true"></span>            </div>
            
            <br>
            <br>
            
             <!-- 방금추가 -->
            <div class="form=group">
            <div class="col-sm-6 col-xs-6 ">
            <br>
            <br>
            </div>
            </div> 
            
        
               <div class="form-group">
                 <label class="control-label col-md-2 col-sm-2 col-xs-2">등급</label> 
                     <div class="col-md-4 col-sm-4 col-xs-3">
                        <input type="text" class="form-control has-feedback-left" value="${mjdrodto.j_name }" readonly>
                   <span class="fa fa-bus form-control-feedback left" aria-hidden="true"></span>
               </div>
               
              
               <label class="control-label col-md-1 col-sm-2 col-xs-2">Email</label> 
               <div class="col-md-5 col-sm-4 col-xs-4">
                     <input type="text" class="form-control has-feedback-left" value="${mjdrodto.m_email }" readonly>
             <span class=" fa fa-envelope-o form-control-feedback left" aria-hidden="true"></span>  
               </div>
               </div>
            
         
            <div class="form-group">
               <label class="control-label col-md-2 col-sm-2 col-xs-2">면허증</label>
                  <div class="col-md-4 col-sm-4 col-xs-3">
                    <a href="download.admin?folder=upload&filename=${mjdrodto.m_license}">${mjdrodto.m_license}</a>
               </div>
               <label class="control-label col-md-1 col-sm-2 col-xs-2">생년월일</label>
               <div class="col-md-5 col-sm-4 col-xs-4">
                  <input class="form-control has-feedback-left" required="required" type="text"
                     value="${mjdrodto.m_birth }" readonly>
                     <span class="fa fa-birthday-cake form-control-feedback left" aria-hidden="true"></span>
               </div>
               </div>

            
            <div class="form-group">
               <label class="control-label col-md-2 col-sm-2 col-xs-2">이력서</label>
               <div class="col-md-4 col-sm-4 col-xs-3">
                  <a href="download.admin?folder=upload&filename=${mjdrodto.m_resume }">${mjdrodto.m_resume }</a>
               </div>
            <label class="control-label col-md-1 col-sm-2 col-xs-2">정기휴무</label>
               <div class="col-md-5 col-sm-4 col-xs-4">
                  <input class="form-control has-feedback-left" required="required" type="text"
                    value="${mjdrodto.o_date }" readonly>
           <span class="fa fa-gamepad form-control-feedback left" aria-hidden="true"></span>         
               </div>
               </div>
            
            
            <div class="form-group">
               <div class="table-responsive" id="reguloffrtable"
                  data-example-id="simple-table"></div>
            </div>

         </form>

      </div>
      <div class="modal-footer">
       <a href="#" class="btn btn-default btn-sm" role="button" data-toggle="modal" data-target="#memberresrecord" data-whatever="${mjdrodto.m_name }"> <i class="fa fa-file-text-o"></i>경력조회</a>
       <button type="button" class="btn btn-success btn-sm" >확인</button>
      </div>

   </div>

</div>