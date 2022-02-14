<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>혈당 등록</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='sugarForm.js'/>"></script>
		
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<section>
			<form id="updateSugarForm" method="post" action="<c:url value='/updateSugar'/>">
			
			혈당관리번호<input type="text" id="sugarNo" name="sugarNo" value="${sugar.sugarNo}"/><br>
			상황<input type="text" id="situation" name="situation" value="${sugar.situation}"/><br>
			투약<input type="text" id="sugarMedication" name="sugarMedication" value="${sugar.sugarMedication}"/><br>
			
			식전<input type="radio" id="ac" name="acpc" value="식전" <c:if test='${sugar.acpc eq "식전"}'>checked="checked"</c:if>/>
			식후<input type="radio" id="pc" name="acpc" value="식후"<c:if test='${sugar.acpc eq "식후"}'>checked="checked"</c:if>/><br>
			
			혈당수치<input type="text" id="sugarLevel" name="sugarLevel" value="${sugar.sugarLevel}"/><br>
			메모<input type="text" id="acpcMemo" name="acpcMemo" value="${sugar.acpcMemo}"/><br>
			기록날짜<input type="date" id="sugarRecordDate" name="sugarRecordDate" value="${sugar.sugarRecordDate}"/><br>
			기록시간<input type="time" id="sugarRecordTime" name="sugarRecordTime" value="${sugar.sugarRecordTime}"/><br>
			
			<input type="submit"  value="등록"/>
				
			</form>
		
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>