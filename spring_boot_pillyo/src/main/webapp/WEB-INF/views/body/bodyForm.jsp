<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체형 관리 정보 등록</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='bodyForm.js'/>"></script>
</head>
<body>
<div id="wrap">
			<h3>체형 관리 정보 등록</h3>
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<section>
			
			<h3>체형 등록</h3>		
			<form id="bodyForm" method="post" action="<c:url value='/insertBody'/>">

				키<input type="text" id="height" name="height"><br>
				몸무게<input type="text" name="weight"><br>
				BMI <input type="text" name="bmi"><br>
				기록날짜<input type="date" id="bodyRecordDate" name="bodyRecordDate"><br>
				<input type="hidden" name="famNo" value="${famNo}" />
				
				<input type="submit" value="등록"><input type="reset" value="취소">
		</form>
		
		</section>
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
</body>
</html>