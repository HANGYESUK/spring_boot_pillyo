<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	
	<body>
		<script>
        	console.log(pressureList)
		</script>
		<h1>뷰페이지</h1><br><br>
		<c:forEach var="pressureList" items="${pressureList}" varStatus="i">
			<h2>상황 : ${pressureList.situation}</h2>
			<h2>수축기 혈압 : ${pressureList.SBP}</h2>
			<h2>이완기 혈압 : ${pressureList.DBP}</h2>
			<h2>심박수 : ${pressureList.bpm}</h2>
			<h2>메모 : ${pressureList.pressureMemo}</h2>
			<h2>기록날짜 : ${pressureList.pressureRecordDate}</h2>
			<h2>기록시간 : ${pressureList.pressureRecordTime}</h2>
			<br><br><br><br>
		</c:forEach>
	</body>
</html>