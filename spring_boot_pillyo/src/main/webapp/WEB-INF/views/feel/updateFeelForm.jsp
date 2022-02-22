<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>기분관리 수정 페이지</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
		
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />


		<!-- Section -- 기분관리 : 기분척도, 메모, 기록날짜, 기록시간, 가족번호 -->
		<div id="navMargin"></div>
			
			<section id="section">
		<h1>기분관리 수정</h1>
			<hr>
			<c:if test="${not empty sessionScope.sid}">
				<h3 id="UserName">${sessionScope.sid}님의 기분 기록입니다</h3>
			</c:if>
			
			<form id="updateFeelForm" method="post" action="<c:url value='/updateFeel'/>">
			기분관리번호	<input type="text" id="feelNo" name="feelNo" value="${feel.feelNo}"/><br>
			기분척도		<input type="text" id="feelScale" name="feelScale" value="${feel.feelScale}"/><br>
			기분일기		<input type="text" id="feelMemo" name="feelMemo" value="${feel.feelMemo}"/><br>
			기록날짜		<input type="text" id="feelRecordDate" name="feelRecordDate" value="${feel.feelRecordDate}"/><br>
			기록시간		<input type="date" id="bodyRecordDate" name="bodyRecordDate" value="${feel.feelRecordTime}"/><br>
			가족번호		<input type="text" id="famNo" name="famNo" value="${feel.famNo}"/><br>
			
			<input type="submit" id="send_btn" value="저장하기">
			<input type="reset" id="reset_btn" value="취소하기">
			</form>				
			
		</section>
		
		
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div> <!-- wrap -->
	
	</body>
</html>
