<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>혈압 등록</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/pressureForm.js'/>"></script>
		
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<section>
			<form id="pressureForm" method="post" action="<c:url value='/insertPressure'/>">
				상황<input type="text" id="situation" name="situation" placeholder="ex>아침"/><br>

				수축기 혈압<input type="text" id="SBP" name="SBP" placeholder="최고혈압"/><br>
				이완기 혈압<input type="text" id="DBP" name="DBP" placeholder="최저혈압"/><br>
				심박수<input type="text" id="bpm" name="bpm" placeholder="mg/dl"/><br>
				메모<input type="text" id="pressureMemo" name="pressureMemo" /><br>
				기록날짜<input type="date" id="pressureRecordDate" name="pressureRecordDate" /><br>
				기록시간<input type="time" id="pressureRecordTime" name="pressureRecordTime" /><br>
				
			<input type="submit"  value="등록"/>
				
			</form>
		
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>