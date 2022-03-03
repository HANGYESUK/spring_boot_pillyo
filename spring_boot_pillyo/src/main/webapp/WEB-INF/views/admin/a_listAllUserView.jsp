<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>title</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
			
				 <table border="1">
				 	<tr>
				 		<td>아이디</td>
				 		<td>비밀번호</td>
				 		<td>이름</td>
				 		<td>이메일</td>
				 		<td>휴대폰번호</td>
				 		<td>우편번호</td>
				 		<td>주소</td>
				 		<td>상세주소</td>
				 		<td>가입일</td>
				 	</tr>
				 	
				 	<c:forEach items="${userList}" var="user">
				 		<tr>
				 		<td>${user.userId }</td>
				 		<td>${user.userPw }</td>
				 		<td>${user.userName }</td>
				 		<td>${user.userEmail }</td>
				 		<td>${user.userHp }</td>
				 		<td>${user.userZipcode }</td>
				 		<td>${user.userAddress1 }</td>
				 		<td>${user.userAddress2 }</td>
				 		<td>${user.joinDate }</td>
				 	</tr>
				 	
				 	</c:forEach>
				 </table>

			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>