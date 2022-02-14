<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>건강관리- feel Manage</title>
	</head>
	<body>
		<div id="wrap">
		
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />


		<!-- Section -- 기분관리 : 기분척도, 메모, 기록날짜, 기록시간, 가족번호 -->
		<section>
			<h1>기분관리</h1>
			<hr>
			<c:if test="${not empty sessionScope.sid}">
				<h3 id="UserName">${sessionScope.sid}님</h3>
			</c:if>
			<p>오늘의 기분을 기록해보아요 :)</p>
			
			<form id="feelRecodeForm">
				<table>
				<tr><th>기분척도</th>	<td><input type = "range" min = "1" max = "10" id = "feelScale"></td></tr>
				<tr><th>기분일기</th>	<td><input type = "text" id = "feelMemo"></td></tr>
				<tr><th>기록날짜</th>	<td><input type = "datetime-local" id = "feel-datetime"></td></tr>
				<tr><th>기록이</th>	<td><c:if test="${!empty family}" >
											<c:forEach var="family" items="${family}" varStatus="i">
											<select name = "famNo">
												<option value="">선택</option>
												<option value="${family.famNo}">${family.famNo}</option>
										</select></c:forEach></c:if></td></tr>
									<!-- family DB에 저장된 famNo 값을 셀렉트박스의 옵션으로 넣고싶음.
										만약 famNo이 2개 있으면 옵션도 2개가 나와야하고 1개 추가되면 3개가 나와야함
										db랑 연결되서 동적으로 옵션이 바뀌는 박스 만들어야하는데... 쉽지않네 -->
				</table>
			</form>
		</section>
		
		
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div> <!-- wrap -->
	</body>
</html>