<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>혈압 정보 등록 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/pressureForm.js'/>"></script>
		<link rel="stylesheet" href="/css/dashboard/dashboard.css" />
		
	</head>
	<style>
		#section3 {
    margin: 0 auto;
    opacity: 100%;
    background-color: #ffffff;
    border-radius: 114px;
    padding-bottom: 1%;
    box-shadow: 0px 0px 6px #e3e3e3;
    height: 95%;
    width: 50%;
}
	</style>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<div id="navMargin"></div>
			
			<section id="section3">
		
			<h3 class="formName">혈압등록</h3>
			<form id="pressureForm" method="post" action="<c:url value='/insertPressure'/>">
				<div>
					<h3>상황</h3><input type="text" id="situation" name="situation" placeholder="ex>아침"/>
				</div>
				<div>
					<h3>수축기 혈압</h3><input type="text" id="SBP" name="SBP" placeholder="최고혈압"/>
				</div>
				<div>
					<h3>이완기 혈압</h3><input type="text" id="DBP" name="DBP" placeholder="최저혈압"/>
				</div>
				<div>
					<h3>심박수</h3><input type="text" id="bpm" name="bpm" placeholder="mg/dl"/>
				</div>
				<div>
					<h3>메모</h3><input type="text" id="pressureMemo" name="pressureMemo" />
				</div>
				<div>
					<h3>기록날짜</h3><input type="date" id="pressureRecordDate" name="pressureRecordDate" />
				</div>
				<div>
					<h3>기록시간</h3><input type="time" id="pressureRecordTime" name="pressureRecordTime" />
				</div>
				<input type="hidden" name="famNo" value="${famNo}" />
				
			<input type="submit"  value="등록"/>
				
			</form>
		
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>