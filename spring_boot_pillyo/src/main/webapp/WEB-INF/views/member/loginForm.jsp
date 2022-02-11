<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 페이지</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/login.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<!--  로그인 폼  -->
		<section>
	        <h1 id="title">로그인</h1>
	        <hr>
	        <form id="loginForm" name="loginForm">
	          <table>
	            <tr><th>아이디</th><td><input type="text" id="id" name="id" ></td></tr>
	            <tr><th>비밀번호</th><td><input type="password" id="pw" name="pw"></td></tr>
	             <tr><th></th>
	                <td align="center" id="button"> <br>
	                    <input type="submit" id="login_btn"value="로그인">
	                    <input type="reset" value="취소">
	                </td>
	            </tr>             
	            </table>
	        </form>	
	        
	        <input type="submit" id="join_btn" value="회원가입">
	        <input type="submit" id="ID/PW_btn" value="ID/PW찾기">
	        
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>
