<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>기분 관리 기록 페이지</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		
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
				<h3 id="UserName">${sessionScope.sid}님의 기분 기록입니다</h3>
			</c:if>
			
			<c:forEach var="feel" items="${feelList}">
				<h4>기분척도 : ${feel.feelScale}</h4>
				<h4>기분일기 : ${feel.feelMemo}</h4>
				<h4>기록날짜 : ${feel.feelRecordDate}</h4>
				<h4>기록시간 : ${feel.feelRecordTime}</h4>
				<h4>기록자 : ${feel.famNo}</h4>
				
			<a href="<c:url value='/updateFeelForm/${feel.feelNo}'/>">혈당 정보 수정</a>
		 	<a href="javascript:deleteCheck();">기분 정보 삭제</a><br><br>

			<script type="text/javascript">
				function deleteCheck(){
					var answer = confirm("선택한 기분 정보를 삭제하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deleteFeel/${feel.feelNo}' />";
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
