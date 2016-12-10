<!--
	제너용럴킹갓현  
	2016-11-17
	메인 메뉴 헤더 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
	<script src="${pageContext.request.contextPath}/NewLoader/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/NewLoader/js/jquery.oLoader.min.js"></script>
<div class="nav_menu">
	<nav>
		<div class="nav toggle">
			<a id="menu_toggle"><i class="fa fa-bars"></i></a>
		</div>

		<ul class="nav navbar-nav navbar-right">
			<li class="">
				<a href="javascript:;"
				class="user-profile dropdown-toggle" data-toggle="dropdown"
				aria-expanded="false"> 
					<se:authentication property="name" var="LoginUser" /> 
					<img alt="" id= "m_photo">
					 
					<span id = "m_name"></span>					
					<span class="fa fa-angle-down"></span>
				</a>
				
				<ul class="dropdown-menu dropdown-usermenu pull-right">
				<se:authorize access="hasRole('ROLE_USER')">
					<li><a href="ChangeForm.htm">개인정보</a></li>
				</se:authorize>
					<li><a href="${pageContext.request.contextPath}/logout"><i
							class="fa fa-sign-out pull-right"></i>로그아웃</a></li>
				</ul>
			</li>
			<se:authorize access="hasRole('ROLE_ADMIN')">
			 <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-bell-o"></i>
                    <span class="badge bg-green" id = "bell"></span>
                  </a>
                  <ul id="menu1" class="dropdown-menu list-unstyled msg_list" role="menu">
                  	
                  </ul>
                </li>
            </se:authorize>
            <se:authorize access="hasRole('ROLE_USER')">
			 <li role="presentation" class="dropdown">
                  <a href="javascript:;" class="dropdown-toggle info-number" data-toggle="dropdown" aria-expanded="false">
                    <i class="fa fa-bell-o"></i>
                    <span class="badge bg-green" id = "bell2"></span>
                  </a>
                  <ul id="menu2" class="dropdown-menu list-unstyled msg_list" role="menu">
                  	
                  </ul>
                </li>
            </se:authorize>
		</ul>
	</nav>
</div>

<script type="text/javascript">
	$(function(){
		$('body').oLoader({
			  wholeWindow: true, 
			  effect:'doornslide',
			  image: "${pageContext.request.contextPath}/images/bus03.gif",
			  hideAfter: 500
			});
		
		$.ajax({
			url:"name.htm",
			data:{"m_id":"${LoginUser}"},
			success:function(data){
				console.log(data.m_name);
				
				$("#m_name").append(data.m_name);
			}
		});
		
		$.ajax({
			url:"photo.htm",
			data:{"m_id":"${LoginUser}"},
			success:function(data){
				console.log(data.m_photo);
				console.log("????한글은 위대하다");
				$("#m_photo").attr("src", "${pageContext.request.contextPath}/join/upload/"+data.m_photo);
			}
		});
		
		bell();
		bell2();
		var Approve = setInterval(function(){ bell() }, 30000);
		
	});
	
	function bell(){
		$.ajax({
			url : "bell.htm", 
			success : function(data){
				console.log(data.appcount);
				$("#bell").empty();
				$("#menu1").empty();
				if(data.appcount > 0){
					$("#bell").append(data.appcount);
					$("#menu1").append("<li><a href = 'joinapprove.admin'><span class = 'message'><i class = 'fa fa-group'></i>&nbsp;&nbsp;가입 승인 요청이 <font color = 'green'>"+data.appcount + "</font>건 있습니다.</span></a></li>");
				
				}
			}
		});
	}
	
	 function bell2(){
		$.ajax({
			url : "bell2.htm",
			type:"post",
			data:{"m_id":"${LoginUser}"},
			success : function(data){
				console.log(data);
				console.log(data.dto);
				$("#bell2").empty();
				$("#menu2").empty();
				if(data.dto > 0){
					$("#bell2").append(data.dto);
					$("#menu2").append("<li><a href = 'joinapprove.member?m_id=${LoginUser}'><span class = 'message'><i class = 'fa fa-group'></i>&nbsp;&nbsp;휴무 변경 승인 이 <font color = 'green'>"+data.dto + "</font>건 있습니다.</span></a></li>");
				
				}
			}
		});
	} 
</script>
