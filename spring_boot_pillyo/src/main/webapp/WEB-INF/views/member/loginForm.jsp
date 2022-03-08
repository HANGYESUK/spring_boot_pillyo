<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Pill-Yo - 로그인</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/login.js'/>"></script>
		<link rel="stylesheet" href="<c:url value='/css/member/loginForm.css'/>">
	</head>
	
	<style>
		hr{
		background-color: #fff2f2;
    	height: 1px
		}
		#adminLogin{
		position: absolute;	
		}
	</style>
	
	
	
	
	<body>
		<div id="wrap">
		<div id="adminLogin"><a href="/adminloginForm">관리자 로그인</a></div>
	<div id="section2">
			<!-- TOP -->
		<%-- <jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' /> --%>
			
			<div id="navMargin"></div>
			
			<section id="section3">
			
		<!--  로그인 폼  -->
		<div id="loginContainer">
		<br>
	        <h1 id="title">로그인</h1>
	        <br>
	        
        <div id="loginTopBox">
	        <div id="loginBox">
		        <form id="loginForm" name="loginForm">
		        
		          
		          <div id="idBox"> <input type="text" id="id" name="id" placeholder="아이디"></div>
		           <div id="pwBox"> <input type="password" id="pw" name="pw" placeholder="비밀번호"></div>
		                  <button type="submit" id="login_btn">로그인</button>
	        	</form>	
       		</div><br>
       		<div class="forgetMsg">
       		 	<a href="#">아이디/비밀번호 찾기</a>  &nbsp;&nbsp;|&nbsp;&nbsp;   <a href="<c:url value='/join'/>">회원가입</a>
       		</div><br><br>
       	</div>
       		
       	<div id="loginBottomBox">	
	     		 <div class="box">
                   	<div class="socialLoginBox">
                   		<h1>소셜 로그인</h1>
                        <ul class="socialLoginList">
                            <li><button class="kakaoLoginButton"><span>KakaoTalk ID 로그인</span></button></li>
                            <li><button class="googleLoginButton"><span>Google ID 로그인</span></button></li>  
                            <li><button class="naverLoginButton"><span>Naver ID 로그인</span></button></li>  
                        </ul>
                   	</div>
                 </div>
               </div>
         </div>
        </section>
        </div>
		<!-- BOTTOM  -->
<%-- 		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
 --%>		
      </div> <!-- wrap -->
	</body>
</html>
