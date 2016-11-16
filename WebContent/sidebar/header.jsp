<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<script>
		function main(){
			location.href = "bus.htm";
		}
	</script>
	
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
        	<input type="image" src="${pageContext.request.contextPath}/images/logo.jpg" onclick="main()">
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right">
    
            <div class="form-group" style="vertical-align: middle; margin:15px">
            <a href="login.htm" style="text-decoration:none; color: white">로그인</a>&nbsp;&nbsp;
           	<a href="join.htm" style="text-decoration:none; color: white" >회원가입</a>
            
            </div>

          </form>
        </div>
      </div>
    </nav>
    