<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>

</head>
<body>
		<section>
			<h3>체형관리 수정</h3>
				<form id="updateBodyForm" method="post" action="<c:url value='/updateBody'/>">
						체형관리번호<input type="text" id="bodyNo" name="bodyNo" value="${body.bodyNo}"/><br>
						키<input type="text" id="height" name="height" value="${body.height}"/><br>
						몸무게<input type="text" id="weight" name="weight" value="${body.weight}"/><br>
						BMI<input type="text" id="bmi" name="bmi" value="${body.bmi}"/><br>
						기록날짜<input type="date" id="bodyRecordDate" name="bodyRecordDate" value="${body.bodyRecordDate}"/><br>
						가족번호<input type="text" id="famNo" name="famNo" value="${body.famNo}"/><br>
						
						<input type="submit"  value="등록"/>
							
						</form>				
		</section>
		
</body>
</html>