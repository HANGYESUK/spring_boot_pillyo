<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Pill-yo</title>
	</head>
	<body>
		index 페이지
		
		<!-- SECTION  -->
		<section>
			<a href="<c:url value = '/loginForm'/>">로그인</a>
			<a href="<c:url value = '/feelManageForm'/>">기분관리</a>	
			<a href="<c:url value = '/famInsertForm'/>">가족 등록 폼</a>
		</section>
		
	</body>
</html>