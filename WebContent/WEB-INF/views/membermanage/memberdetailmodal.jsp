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

            <div class="col-sm-6 col-md-6">
               <div class="thumbnail">
                  <img
                     src="<%=request.getServletContext().getContextPath()%>/join/upload/${dto.m_photo}"
                     alt="...">
                  <div class="caption">
                     <h3></h3>
                     <p>...</p>
                     <p>
                        <a href="#" class="btn btn-default btn-sm" role="button">사진변경</a>
                        <a href="#" class="btn btn-default btn-sm" role="button">경력조회</a>
                     </p>
                  </div>
               </div>
            </div>
            
            <label class="control-label col-md-1 col-sm-2 col-xs-1">이름</label> 
             <div class="col-md-5 col-sm-4 col-xs-12 form-group has-feedback">
               <input type="text" class="form-control has-feedback-left"
                  id="inputSuccess2" value="${mjdrodto.m_name }" readonly> <span
                  class="fa fa-user form-control-feedback left" aria-hidden="true"></span>
            </div> 
            
           <label class="control-label col-md-1 col-sm-2 col-xs-1">ID</label> 
            <div class="col-md-5 col-sm-4 col-xs-12 form-group has-feedback">
               <input type="text" class="form-control" id="inputSuccess3"
                  value="${mjdrodto.m_name }" readonly> 
            </div>

            <label class="control-label col-md-1 col-sm-2 col-xs-1">우편번호</label> 
            <div class="col-md-5 col-sm-4 col-xs-12 form-group has-feedback">
               <input type="text" class="form-control has-feedback-left"
                  id="inputSuccess4" value="${mjdrodto.m_addr }" readonly> <span
                  class="fa fa-envelope form-control-feedback left"
                  aria-hidden="true"></span>
            </div>

            <label class="control-label col-md-1 col-sm-2 col-xs-1">상세주소</label> 
            <div class="col-md-5 col-sm-4 col-xs-12 form-group has-feedback">
               <input type="text" class="form-control" id="inputSuccess5"
                  value="${mjdrodto.m_daddr }" readonly> <span
                  class="fa fa-phone form-control-feedback right" aria-hidden="true"></span>
            </div>
            
            <br>
            <br>
            
             <!-- 방금추가 -->
            <div class="form=group">
            <div class="col-sm-6  ">
            <br>
            <br>
            </div>
            </div> 
            
            
               
               <div class="form-group">
                 <label class="control-label col-md-1 col-sm-1 col-xs-1">등급</label> 
                     <div class="col-md-4 col-sm-4 col-xs-12">
                        <input type="text" class="form-control" value="${mjdrodto.j_name }" readonly>
               </div>
               
               
               <label class="control-label col-md-1 col-sm-1 col-xs-1">Email</label> 
               <div class="col-md-4 col-sm-4 col-xs-12">
                     <input type="text" class="form-control" value="${mjdrodto.m_email }" readonly>
               </div>
               </div>
            
         
            <div class="form-group">
               <label class="control-label col-md-1 col-sm-1 col-xs-1">면허증</label>
                  <div class="col-md-4 col-sm-4 col-xs-12">
                    <a href="download.admin?folder=upload&filename=${mjdrodto.m_license}">${mjdrodto.m_license}</a>
               </div>
               <label class="control-label col-md-1 col-sm-1 col-xs-1">생년월일</label>
               <div class="col-md-4 col-sm-4 col-xs-12">
                  <input class="form-control" required="required" type="text"
                     value="${mjdrodto.m_birth }" readonly>
               </div>
               </div>

            
            <div class="form-group">
               <label class="control-label col-md-1 col-sm-1 col-xs-1">이력서</label>
               <div class="col-md-4 col-sm-4 col-xs-12">
                  <a href="download.admin?folder=upload&filename=${mjdrodto.m_resume }">${mjdrodto.m_resume }</a>
               </div>
            <label class="control-label col-md-1 col-sm-1 col-xs-1">정기휴무</label>
               <div class="col-md-4 col-sm-4 col-xs-122">
                  <input class="form-control" required="required" type="text"
                    value="${mjdrodto.o_date }" readonly>
               </div>
               </div>
            
            
            
            <div class="form-group">
               <div class="table-responsive" id="reguloffrtable"
                  data-example-id="simple-table"></div>
            </div>

         </form>

      </div>
      <div class="modal-footer">
         <button type="button" class="btn btn-success" data-toggle="modal" data-target="#memberresrecord" data-whatever="${mjdrodto.m_name }">확인</button>
      </div>

   </div>

</div>

