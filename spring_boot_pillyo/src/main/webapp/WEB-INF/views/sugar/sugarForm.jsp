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
			<form id="sugarForm" method="post" action="<c:url value='/insertSugar'/>">
				
				상황<input type="text" id="situation" name="situation" placeholder="ex>아침"/><br>
				투약<input type="text" id="sugarMedication" name="sugarMedication" placeholder="ex> 인슐린 지속형 10단위"/><br>
				식전<input type="radio" id="ac" name="acpc" value="식전"/>식후<input type="radio" id="pc" name="acpc" value="식후"/><br>
				혈당수치<input type="text" id="sugarLevel" name="sugarLevel" placeholder="mg/dl"/><br>
				메모<input type="text" id="acpcMemo" name="acpcMemo" /><br>
				기록날짜<input type="date" id="sugarRecordDate" name="sugarRecordDate" /><br>
				기록시간<input type="time" id="sugarRecordTime" name="sugarRecordTime" /><br>
				
			<input type="submit"  value="등록"/>
				
			</form>
		
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>