<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>기분 정보 등록 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
		
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />


		<!-- Section -- 기분관리 : 기분척도, 메모, 기록날짜, 기록시간, 가족번호 -->
		<div id="navMargin"></div>
			
			<section id="section">
			<h1>기분관리</h1>
			<hr>
			<c:if test="${not empty sessionScope.sid}">
				<h3 id="UserName">${sessionScope.sid}님</h3>
			</c:if>
			<p>오늘의 기분을 기록해보아요 :)</p>
			
			<form id="feelRecodeForm" method="post" action="<c:url value='/insertFeel'/>">
				<h4>기분척도</h4>
				<input type="range" name="feelScale" for="result" min="1" max="10" step="1" list="feelScaleMarks" id="feelScale" oninput="result.value=feelScale.value">
				<input class="result" name="result" for="feelScale" oninput="feelScale.value=result.value">
					<datalist id="feelScaleMarks">
						<option value="1"></option>
						<option value="2"></option>
						<option value="3"></option>
						<option value="4"></option>
						<option value="5"></option>
						<option value="6"></option>
						<option value="7"></option>
						<option value="8"></option>
						<option value="9"></option>
						<option value="10"></option>
					</datalist>
					
				<h4>기분일기</h4>
				<textarea name="feelMemo" rows="10" cols="50" placeholder="내용을 입력하세요" style="resize: none;"></textarea>
				
				<h4>기록날짜</h4>
				<input type="date" name="feelRecordDate">
				
				<h4>기록시간</h4>
				<input type="time" name="feelRecordTime">
				
				<h4>기록자</h4>
				<input type="hidden" name="famNo" value="${famNo}" />
				<input type="submit" id="send_btn" value="저장하기">
				<input type="reset" id="reset_btn" value="취소하기">
			</form>
		</section>
		
		
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div> <!-- wrap -->
	</body>
</html>