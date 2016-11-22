<!--
	제너용럴킹갓현  
	2016-11-17
	메인 메뉴 헤더 
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="se"
	uri="http://www.springframework.org/security/tags"%>
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
					<li><a href="ChangeForm.htm">개인정보</a></li>
					<li><a href="${pageContext.request.contextPath}/logout"><i
							class="fa fa-sign-out pull-right"></i>로그아웃</a></li>
				</ul></li>


		</ul>
	</nav>
</div>

<script type="text/javascript">
	$(function(){
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
				
				$("#m_photo").attr("src", "${pageContext.request.contextPath}/join/upload/"+data.m_photo);
			}
		});
	});
</script>
