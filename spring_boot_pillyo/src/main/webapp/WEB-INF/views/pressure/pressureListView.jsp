<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>혈압 정보 전체 목록</title>
	</head>
	
	<body>
	
	<div id="wrap">
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
		<h1>뷰페이지</h1><br><br>
		<c:forEach var="pressureList" items="${pressureList}" varStatus="i">
			<h2>상황 : ${pressureList.situation}</h2>
			<h2>수축기 혈압 : ${pressureList.SBP}</h2>
			<h2>이완기 혈압 : ${pressureList.DBP}</h2>
			<h2>심박수 : ${pressureList.bpm}</h2>
			<h2>메모 : ${pressureList.pressureMemo}</h2>
			<h2>기록날짜 : ${pressureList.pressureRecordDate}</h2>
			<h2>기록시간 : ${pressureList.pressureRecordTime}</h2>
			<a href="<c:url value='/updatePressureForm/${pressureList.pressureNo}'/>">혈압 정보 수정</a>
		 	<p onclick="deleteCheck()">혈압 정보 삭제</p><br><br>
			<br><br><br><br>
			
			<script>
				function deleteCheck(){
					var answer = confirm("선택한 혈압 정보를 삭제하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deletePressure/${pressureList.pressureNo}' />";
					}
				}
			</script>
			
		</c:forEach>
		
		</section>
	        <!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
		
		
	</body>
</html>