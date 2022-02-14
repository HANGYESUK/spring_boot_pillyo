<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>혈당 등록</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='pressureForm.js'/>"></script>
		
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<section>
			<form id="updatePressureForm" method="post" action="<c:url value='/updatePressure'/>">
			혈압관리번호<input type="text" id="pressureNo" name="pressureNo" value="${pressure.pressureNo}"/><br>
			상황<input type="text" id="situation" name="situation" value="${pressure.situation}"/><br>
			수축기 혈압<input type="text" id="SBP" name="SBP" value="${pressure.SBP}"/><br>
			이완기 혈압<input type="text" id="DBP" name="DBP" value="${pressure.DBP}"/><br>
			심박수 <input type="text" id="bpm" name="bpm" value="${pressure.bpm}"/><br>
			메모<input type="text" id="pressureMemo" name="pressureMemo" value="${pressure.pressureMemo}"/><br>
			기록날짜<input type="date" id="pressureRecordDate" name="pressureRecordDate" value="${pressure.pressureRecordDate}"/><br>
			기록시간<input type="time" id="pressureRecordTime" name="pressureRecordTime" value="${pressure.pressureRecordTime}"/><br>
			가족번호<input type="text" id="famNo" name="famNo" value="${pressure.famNo}"/><br>
			
			<input type="submit"  value="등록"/>
				
			</form>
		
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>