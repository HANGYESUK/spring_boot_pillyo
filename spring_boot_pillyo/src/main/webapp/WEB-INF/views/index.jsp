<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="EUC-KR">
		<title>Pill-yo</title>
	</head>
	<body>
		index 페이지
		
		<!-- SECTION  -->
		<section>
			<a href="<c:url value = '/loginForm'/>">로그인</a>
			<a href="<c:url value = '/famInsertForm'/>">가족 등록 폼</a>
			<a href="<c:url value = '/feelManageForm'/>">기분관리</a>	
			
			<br><br><br><br><br><br><br><br><br><br><br><br>
			혈당관리
			<a href="<c:url value = '/sugarForm'/>">혈당등록</a>
			<a href="<c:url value = '/listAllSugar'/>">혈당리스트</a>
			
			
			<br><br>
						<a href="<c:url value = '/join'/>">회원가입</a>
			
		</section>
		
	</body>
</html>