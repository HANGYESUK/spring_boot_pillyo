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
		</section>
		
	</body>
</html>