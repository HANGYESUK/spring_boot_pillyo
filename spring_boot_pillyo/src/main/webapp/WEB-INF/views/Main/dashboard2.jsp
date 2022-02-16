<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>페이지명</title>
	</head>
	<body>
		<h1>건강관리</h1>
			<c:if test="${not empty sessionScope.sid}">
				<h3 id="UserName">${sessionScope.sid}님</h3><hr>
			</c:if>
			
			<%-- <c:forEach items="${body}" var="body">
		  		키 ${body.height}<br>
		  		몸무게 ${body.weight}<br>
		  		BMI ${body.bmi}<br>
		   	 </c:forEach>
   	    --%>
   	    	<h3>체형관리</h3>
   	    		키 ${body.height}<br>
		  		몸무게 ${body.weight}<br>
		  		BMI ${body.bmi}<br><hr>
		  	
		  	<h3>기분관리</h3>
		  		기분척도 ${feel.feelScale}<br>
		  		기분일기 ${feel.feelMemo}<br>
		  		기록날짜 ${feel.feelRecordDate}<br>
		  		기록시간 ${feel.feelRecordTime}<br><hr>
		  		
		  	<h3>혈압관리</h3>
		  		상황 ${pressure.situation}<br>
		  		수축기 혈압 ${pressure.SBP}<br>
		  		이완기 혈압 ${pressure.DBP}<br>
		  		심박수 ${pressure.bpm}<br>
		  		메모 ${pressure.pressureMemo}<br>
		  		기록날짜 ${pressure.pressureRecordDate}<br>
		  		기록시간 ${pressure.pressureRecordTime}<br><hr>
   	   		
		  	<h3>혈당관리</h3>
		  		상황 ${sugar.situation}<br>
		  		투약 ${sugar.sugarMedication}<br>
		  		식전/식후 선택 ${sugar.acpc}<br>
		  		혈당수치 ${sugar.sugarLevel}<br>
		  		식전/식후 메모 ${sugar.acpcMemo}<br>
		  		기록날짜 ${sugar.sugarRecordDate}<br>
		  		기록시간 ${sugar.sugarRecordTime}<br><hr>
   	   		
	</body>
</html>
