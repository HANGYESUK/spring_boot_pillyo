<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>나의 건강관리</title>
   		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="/css/member/myHealth.css" />
    
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		<div id="navMargin"></div>
			
			<section id="section">
			<!-- 마이 페이지 메뉴 -->
				<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" flush='true' />
					
				<div id="myPageBox1">
					
					<h3>나의 건강정보</h3> <hr>
					
					<div id="myHealthBox">
						<%-- <c:if test="${not empty sessionScope.sid}">
							<h2>${sessionScope.sid} 님의 건강 리스트를 보러가시겠습니까?</h2> <br><br>
						</c:if> --%>
						
						<a href="/myListAllBody">
						<button type="button" id="bodyList_Btn" value="체형 리스트">
						<img src="/img/mH/height.png" alt="" style="width:100px; height:100px;"><br>
						<span>체형 기록</span></button></a>
						
						<a href="/myListAllFeel">
						<button type="button" id="feelList_Btn" value="기분 리스트">
						<img src="/img/mH/happy.png" alt="" style="width:100px; height:100px;"><br>
						<span>기분 기록</span></button></a>
						
						<a href="/myListAllPressure">
						<button type="button" id="pressureList_Btn" value="혈압 리스트">
						<img src="/img/mH/blood-pressure.png" alt="" style="width:100px; height:100px;"><br>
						<span>혈압 기록</span></button></a>
						
						<a href="/myListAllSugar">
						<button type="button" id="sugarList_Btn" value="혈당 리스트">
						<img src="/img/mH/sugar-blood-level.png" alt="" style="width:100px; height:100px;"><br>
						<span>혈당 기록</span></button></a>
						
					</div><!-- myHealthBox -->
				</div>
			</section>
			
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
    	</div> <!-- wrap -->
	</body>
</html>