<!-- 
   @FileName : memberinfo.jsp
   @Project   : KosBus
   @Date   : 2016. 11.17
   @Author   : 김용현
   @Discription : (관리자)회원 관리 페이지 View단
 -->



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>기사 관리</title>

<!-- Bootstrap -->
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
<!-- iCheck -->
<link
	href="${pageContext.request.contextPath}/vendors/iCheck/skins/flat/green.css"
	rel="stylesheet">
<!-- bootstrap-progressbar -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/css/bootstrap-progressbar-3.3.4.min.css"
	rel="stylesheet">
<!-- JQVMap -->
<link
	href="${pageContext.request.contextPath}/vendors/jqvmap/dist/jqvmap.min.css"
	rel="stylesheet" />
<!-- bootstrap-daterangepicker -->
<link
	href="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.css"
	rel="stylesheet">

<!-- Custom Theme Style -->
<link href="${pageContext.request.contextPath}/build/css/custom.min.css"
	rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- Editor -->
<script src="//cdn.ckeditor.com/4.5.11/standard/ckeditor.js"></script>
<!-- jQuery -->
<script
	src="${pageContext.request.contextPath}/vendors/jquery/dist/jquery.min.js">
</script>
<style type="text/css">
th {
	text-align: center;
}
ul.pagination li a.active {
    background-color: #1ABB9C;
    color: white;
}

ul.pagination li a {
    color: #73879C;
    float: left;
    padding: 8px 16px;
    text-decoration: none;
}
</style>
</head>

<body class="nav-md">
	<div class="container body">
		<div class="main_container">
			<div class="col-xs-12  col-md-3 left_col">

				<jsp:include page="/sidebar/sidebar.jsp"></jsp:include>
			</div>

			<!--상단 menu -->
			<div class="top_nav">
				<jsp:include page="/sidebar/menuHeader.jsp"></jsp:include>
			</div>

			<!-- page content -->

			<!-- modal 1  -->

			<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalLabel">
				<div class="modal-dialog" role="document">
					<form action="mailsend.htm" method="post"
						enctype="multipart/form-data">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
								<h4 class="modal-title" id="exampleModalLabel"></h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<i class="fa fa-male"></i>&nbsp;<label for="people"
										class="control-label"> 받는 사람</label> <input type="text"
										class="form-control" id="people" name="to">
								</div>

								<div class="form-group">
									<i class="fa fa-pencil-square-o"></i>&nbsp;<label for="subject"
										class="control-label"> 제목</label> <input type="text"
										class="form-control" id="subject" name="subject"
										placeholder="제목을 입력하세요">
								</div>

								<div class="form-group">
									<i class="fa fa-folder-open-o"></i>&nbsp;<label for="fattach"
										class="control-label"> 파일첨부 </label> <input type="file"
										class="form-control" id="fattach" name="filename">
								</div>

								<div class="form-group">
									<label for="message-text" class="control-label"> <span
										class="glyphicon glyphicon-envelope" aria-hidden="true"
										style="color: gray"></span> 메세지:
									</label>
									<textarea class="form-control" id="message-text" name="content"
										cols="5"></textarea>
									<script>
										CKEDITOR.replace('message-text');
									</script>
								</div>

							</div>
							<div class="modal-footer">
								<input type="submit" class="btn btn-primary" value="메세지 보내기">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>

			<!-- 모달끝1 -->

			<!--  modal2 -->
			<div class="modal fade table-responsive" id="exampleModal2"
				tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel">
			</div>


			<!-- modal2 끝 -->
			<div class="right_col" role="main">
				<div class="">
					<div class="page-title">
						<div class="title_left">
							<h3>
								<small>정보수정</small>
							</h3>
						</div>
					</div>

					<div class="clearfix"></div>

					<div class="row">
						<div class="col-md-12 col-xs-12">
							<div class="x_panel">
								<div class="x_title">
									<nav class="navbar navbar-default">
										<div class="container-fluid">
											<ul class="nav navbar-nav">
												<li><a href="membermanage.admin"><strong>회원정보</strong></a></li>
												<li><a href="joinapprove.admin">회원가입승인</a></li>
												<li><a href="#">스케줄관리</a></li>
											</ul>
										</div>
									</nav>
								</div>
								<div class="x_content table-responsive">
					
							<c:set value="${list}" var="d" />

									<!-- start project list -->
									
									<div
										class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
										<div class="input-group">
											<input type="text" class="form-control"
												placeholder="Search for..." id="search"> <span
												class="input-group-btn">
												<button class="btn btn-default" type="button" id="btnsearch">Go!</button>
											</span>
										</div>
									</div>
									<div id="another">
									<table class="table table-hover  projects"
										style="text-align: center;">
										<thead>
											<tr>
												<th style="width: 70px">번호</th>
												<th style="width: 150px">ID</th>
												<th style="width: 150px">이름</th>
												<th style="width: 150px">이메일</th>
												<th style="width: 150px">직책</th>
										
												<th style="width: 100px"></th>
											</tr>
										</thead>
									

										<c:forEach var="i" items="${d}">
											<tr>
												<td>${i.r}</td>
												<td><a href="#" onClick="smodal('${i.m_id}');">${i.m_id}</a></td>
												<td><small>${i.m_name}</small></td>
												<td><a href="#" data-toggle="modal"
													data-target="#exampleModal"
													data-whatever="${i.m_name},${i.m_email}">${i.m_email}</a></td>
												<td><small>${i.j_name}</small></td>
												
												<td style="text-align: center">
													<div class="btn btn-danger btn-xs"
														onclick="deleteMember('${i.m_id}','${i.m_name}');">
														<i class="fa fa-trash-o"></i> 삭제
													</div>
												</td>
											</tr>
										</c:forEach>
										</tbody>
									</table>
									</div>
									<!-- end project list -->

									<!-- 요기서부터 페이징처리 -->
									<c:set var="mc" value="${membercount}" />
									<c:set var="pgc" value="${pgs}" />
									<c:set var ="pagecount" value = "${pagecount}"/>

									<div style="text-align: center" id="coco">
										<ul class="pagination">

											<c:if test="${pgc > 1}">
												<li><a href="membermanage.admin?pg=${pgc-1}">Prev</a></li>
											</c:if>

											
										<c:forEach begin="1" end="${pagecount}" var="i" step = "5">
											<c:forEach begin = "${i}" end = "${i+4}" step = "1" var = "x">
												<c:if test="${x <= pagecount}">
													<c:choose>
														<c:when test="${pgc == x}">
															<li><a  class="active" href="#">${x}</a></li>
														</c:when>
														<c:when test="${pgc > i-1 && pgc < i+5 }">
															<li><a href="membermanage.admin?pg=${x}">${x}</a></li>
														</c:when>
														<c:when test ="${x == i+5}">
															<c:forEach begin = "${x}" end = "${x+4}" step = "1" var = "y">
																<li><a href="membermanage.admin?pg=${y}">${y}</a></li>
															</c:forEach>
														</c:when>
													</c:choose>
												</c:if>
												
											</c:forEach>
										</c:forEach>
											
											
											<%-- <c:forEach begin="1" end="${pagecount}" var="i" step = "1">
												<c:if test="${i==pgc}">
													<li><a  class="active" href="#">${i}</a></li>
												</c:if>
												<c:if test="${i!=pgc}">
													<li><a href="membermanage.admin?pg=${i}">${i}</a></li>
												</c:if>
											</c:forEach> --%>

											<%-- <c:forEach var="i" begin="1" end="${pagecount}" step="1">
											<li class="active"><a href="membermanage.admin?pg=${i}">${i}</a></li>
										</c:forEach> --%>

											<c:if test="${pgc < mc/10 }">
												<li><a href="membermanage.admin?pg=${pgc+1}">Next</a></li>
											</c:if>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- 비밀번호 모달 :match-pass -->
			<div class="modal fade" id="match-pass" tabindex="-1" role="dialog"
				aria-labelledby="myModalLabel" aria-hidden="true"
				style="display: none;">
				<div class="modal-dialog">
					<div class="modal-content">
						<!-- Begin # DIV Form -->
						<div id="div-forms">
							<div class="modal-header" align="center">
								<h3>비밀번호 입력</h3>
							</div>
							<!-- Begin # Login Form -->
							<form id="login-form" method="post">
								<div class="modal-body">
									<div style="text-align: center">
										<label for="m_pw">비밀번호 </label> <input type="password"
											name="m_pw" id="m_pw">
									</div>
								</div>
								<div class="modal-footer">
									<div>
										<input type="button" class="btn btn-dark" value="완료"
											id="passtrue" data-target="myModal">
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

			<!-- 수현:삭제모달    -->
			<div class="modal fade" id="myModal" role="dialog">
				<div class="modal-dialog modal-sm">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title">
								<i class="fa fa-exclamation-triangle"></i> 회원삭제
							</h4>
						</div>
						<div class="modal-body" aria-labelledby="myModalLabel"
							id="myModalLabel2"></div>

						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								data-dismiss="modal" id="cancelbutton">삭제</button>
							<button type="button" class="btn btn-default"
								data-dismiss="modal">취소</button>
							<input type="hidden" id="hvalue"> <input type="hidden"
								id="hvalue2">
						</div>
					</div>
				</div>
			</div>

			<!-- 수현:삭제모달 끝 -->

			<div class="modal fade" id="memberresrecord" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4 class="modal-title" id="resrecordtitle"></h4>
						</div>
						<div class="modal-body" aria-labelledby="myModalLabel">
							<div class="table-responsive" id="resrecordtable"></div>
						</div>
					</div>
				</div>
			</div>



			<!-- footer content -->
			<footer>
				<jsp:include page="/sidebar/footer.jsp"></jsp:include>
				<div class="clearfix"></div>
			</footer>
			<!-- /footer content -->
		</div>
	</div>

	<!-- Bootstrap -->
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath}/vendors/fastclick/lib/fastclick.js"></script>
	<!-- NProgress -->
	<script
		src="${pageContext.request.contextPath}/vendors/nprogress/nprogress.js"></script>
	<!-- Chart.js -->
	<script
		src="${pageContext.request.contextPath}/vendors/Chart.js/dist/Chart.min.js"></script>
	<!-- gauge.js -->
	<script
		src="${pageContext.request.contextPath}/vendors/gauge.js/dist/gauge.min.js"></script>
	<!-- bootstrap-progressbar -->
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap-progressbar/bootstrap-progressbar.min.js"></script>
	<!-- iCheck -->
	<script
		src="${pageContext.request.contextPath}/vendors/iCheck/icheck.min.js"></script>
	<!-- Skycons -->
	<script
		src="${pageContext.request.contextPath}/vendors/skycons/skycons.js"></script>
	<!-- Flot -->
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.pie.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.time.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.stack.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/Flot/jquery.flot.resize.js"></script>
	<!-- Flot plugins -->
	<script
		src="${pageContext.request.contextPath}/vendors/flot.orderbars/js/jquery.flot.orderBars.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/flot-spline/js/jquery.flot.spline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/flot.curvedlines/curvedLines.js"></script>
	<!-- DateJS -->
	<script
		src="${pageContext.request.contextPath}/vendors/DateJS/build/date.js"></script>
	<!-- JQVMap -->
	<script
		src="${pageContext.request.contextPath}/vendors/jqvmap/dist/jquery.vmap.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/jqvmap/dist/maps/jquery.vmap.world.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/jqvmap/examples/js/jquery.vmap.sampledata.js"></script>
	<!-- bootstrap-daterangepicker -->
	<script
		src="${pageContext.request.contextPath}/vendors/moment/min/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/vendors/bootstrap-daterangepicker/daterangepicker.js"></script>

	<!-- Custom Theme Scripts -->
	<script src="${pageContext.request.contextPath}/build/js/custom.min.js"></script>
	<script type="text/javascript">
		$(function() {

			$('#exampleModal').on(
					'show.bs.modal',
					function(event) {
						var button = $(event.relatedTarget)
						var recipient = button.data('whatever').split(',');
						$('#exampleModalLabel').html(
								"<i class='fa fa-envelope-o'></i><span class='blue'>&nbsp;"
										+ recipient[0] + '</span>님에게 보내기');
						$('#people').val(recipient[1]);
					});

			$('#exampleModal').on(
					'show.bs.modal',
					function(event) {
						var button = $(event.relatedTarget)
						var recipient = button.data('whatever').split(',');
						$('#exampleModalLabel').html(
								"<i class='fa fa-envelope-o'></i><span class='blue'>&nbsp;"
										+ recipient[0] + '</span>님에게 보내기');
						$('#people').val(recipient[1]);
					});

			$("#passtrue").click(function() {
				$.ajax({
					url : "matchpass1.admin",
					data : {
						m_pw : $("#m_pw").val()
					},
					success : function(data) {
						console.log(data.data);
						if (data.data == 'true') {
							$("#match-pass").modal("hide");
							$("#myModal").modal("show");

						} else {
							alert("비밀번호가 틀렸습니다.");
						}
					}
				});
			});

		$('#btnsearch').click(function() {
			$("#another").empty();
			$("#coco").empty();
			var param = $('#search').val();
			
			if($('#sel').val()!=""){
			var param2=$('#sel').val();
			$.ajax({
				data : {
					"search" : param,
				},
				url : "SearchMember.htm",
				type : "get",
				success : function(data) {
					console.log("날보고있다면");
					console.log(data);
					$("#another").append(data);
					
				}
			});
			}else{
				$.ajax({
					data : {"search" : param},
					url : "SearchMember.htm",
					type : "get",
					success : function(data) {
						if(data ==""){
							$("#another").append("<label>검색결과가 없습니다.</label>")
						}else{
						console.log("날보고있다면");
						console.log(data);
						$("#another").append(data);
						}
					}
				});
			}
		}); 
			
			
			$('#cancelbutton').click(function() {
				var param = $('#hvalue').val();
				console.log(param);

				$.ajax({
					url : "deleteMember.admin",
					type : "post",
					data : {
						"param" : param
					},
					success : function(data) {
						alert("삭제 완료");
						window.location.reload();

					}
				});
			});

			/*    $('#myModal').on('show.bs.modal', function (event) {
			       var button = $(event.relatedTarget) 
			       var recipient = button.data('whatever');
			       console.log(recipient);
			       var array = recipient.split(',');
			      
			       console.log($('#hvalue').val(array[1]));
			       
			       $('#myModalLabel2').html("<span class='blue'>&nbsp;"+array[0]+'</span>님을 삭제하시겠습니까?');
			     });  
			    
			
			
			
			
			
			
			     $('#cancelbutton').click(function(){
			      //console.log($('#search').val()); 
			      var param = $('#hvalue').val();
			       
			      $.ajax({
			           url:"deleteMember.admin",
			           type:"post",
			           data: {"param":param},        
			           success:function(data){
			              alert("삭제 완료");
			              window.location.reload();
			              
			           }
			        });
			      }); */

			$('#memberresrecord').on(
					'show.bs.modal',
					function(event) {
						var button = $(event.relatedTarget)
						var recipient = button.data('whatever');
						$('#resrecordtitle').html(
								"<i class='fa fa-envelope-o'></i><span class='blue'>&nbsp;"
										+ recipient + '</span>이력사항');

					});
		});

		
		function smodal(m_id) {
	         console.log(m_id);
	       
	       
	         $.ajax({
	            url : "memberdetail.admin",
	            type : "post",
	            data : {
	               "param" : m_id
	            },
	            success : function(data) {
	               $('#exampleModal2').empty();
	               $('#exampleModal2').append(data);
	               $('#exampleModal2').modal('show');
	               $.ajax({
	                  url : "memberreguloffr.htm",
	                  type : "post",
	                  data : {
	                     "param" : m_id
	                  },
	                  success : function(data1) {
	                     $('#reguloffrtable').empty();
	                     $('#reguloffrtable').append(data1);
	                     $.ajax({
	                        url : "memberresrecord.admin",
	                        type : "post",
	                        data : {
	                           "param" : m_id
	                        },
	                        success : function(data2) {
	                           $('#resrecordtable').empty();
	                           $('#resrecordtable').append(data2);
	                           }
	                        });
	                     }
	                  });
	               }
	            });
	         }
	      
				
			
 			
		 function s2modal(m_id){
			$.ajax({
				url : "memberresrecord.admin",
				type : "post",
				data : {
					"param" : m_id
				},
				success : function(data2) {
					$('#resrecordtable').empty();
					$('#resrecordtable').appnd(data2);
				}
				
			});
		}  
		
		
		/* 	function deleteMember(m_id) {
			console.log("m_id" + m_id);
			$("#match-pass").modal("show");
			$('#hvalue').val(m_id); 
			$("#myModalLabel2").empty();
			$('#myModalLabel2').html(m_id + '님을 삭제하시겠습니까?');
		}  */
		
	 	function deleteMember(m_id,m_name) {
			console.log("m_id" + m_id);
			console.log("m_name" + m_name);
			$("#match-pass").modal("show");
			$('#hvalue').val(m_id); 
			$('#hvalue2').val(m_name); 
			$("#myModalLabel2").empty();
			$('#myModalLabel2').html(m_name + '님을 삭제하시겠습니까?'); 
		}
	
		
	</script>
</body>
</html>