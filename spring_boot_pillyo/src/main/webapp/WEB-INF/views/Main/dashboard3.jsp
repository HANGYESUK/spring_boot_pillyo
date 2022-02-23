<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HealthList</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	
</head>
<body>
			가족 목록(dashboard3으로 페이지 다시 호출(ajax는 아님.))<br>
			<c:forEach items="${famList}" var="fam">
				<a href="<c:url value='/dashboard3/${fam.famNo}'/>">${fam.famMember} </a><br>
			</c:forEach>
			<br><br>
			
			<h3>${famMember} 님의 건강관리 입니다.</h3>
			
			
			<h3>전체 혈당 관리 목록</h3>
			
			<a href="<c:url value='/sugarForm/${famNo}'/>">혈당등록</a><br>
			<a href="<c:url value='/bodyForm/${famNo}'/>">체형등록</a><br>
			<a href="<c:url value='/insertPressure/${famNo}'/>">혈압등록</a><br>
			<a href="<c:url value='/feelForm/${famNo}'/>">기분등록</a><br>
			
			
			
			<c:forEach items="${sugarList}" var="sugar">
		 		번호 ${sugar.sugarNo}
		 		상황 ${sugar.situation}
		 		투약 ${sugar.sugarMedication}
		 		식전/식후 ${sugar.acpc}
		 		수치 ${sugar.sugarLevel}
		 		메모 ${sugar.acpcMemo}
		 		기록날짜 ${sugar.sugarRecordDate}
		 		기록시간 ${sugar.sugarRecordTime}
		 		가족번호 ${sugar.famNo}
		 		
		 		<a href="<c:url value='/updateSugarForm/${sugar.sugarNo}'/>">혈당 정보 수정</a>
		 		<a href="javascript:deleteCheck();">혈당 정보 삭제</a><br><br>
		 			 		
			<script type="text/javascript">
				function deleteCheck(){
					var answer = confirm("선택한 혈당 정보를 삭제하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deleteSugar/${sugar.sugarNo}' />";
					}
				}
			</script>		
		<br>
		 </c:forEach>

			<h3>전체 체형 관리 목록</h3>
			
			   <c:forEach items="${bodyList }" var="body">
		   			체형관리 번호 ${body.bodyNo}
		   			키 ${body.height}
		   			몸무게 ${body.weight}
		   			BMI ${body.bmi}
		   			기록날짜 ${body.bodyRecordDate}
		   			가족 번호 ${body.famNo}

			   	<a href="<c:url value='/updateBodyForm/${body.bodyNo}'/>">체형 관리 정보 수정</a>
			   	<a href="javascript:deleteCheck();">체형 관리 정보 삭제</a><br>
			   	
			   	<script type="text/javascript">
					function deleteCheck(){
						var answer = confirm("선택한 체형 정보를 삭제하시겠습니까?");
						if(answer == true){
							location.href="<c:url value='/deleteBody/${body.bodyNo}' />";
						}
					}
				</script>
 		 <br>
			   </c:forEach>
		<h3>전체 혈압 관리 목록</h3>

			   <c:forEach items="${pressureList }" var="pressure">
		   			상황 : ${pressure.situation}
					수축기 혈압 : ${pressure.SBP}
					이완기 혈압 : ${pressure.DBP}
					심박수 : ${pressure.bpm}
					메모 : ${pressure.pressureMemo}
					기록날짜 : ${pressure.pressureRecordDate}
					기록시간 : ${pressure.pressureRecordTime}

			   	<a href="<c:url value='/updatePressureForm/${pressure.pressureNo}'/>">혈압 관리 정보 수정</a>
			   	<a href="javascript:deleteCheck();">혈압 관리 정보 삭제</a><br>
			   	
			   	<script type="text/javascript">
					function deleteCheck(){
						var answer = confirm("선택한 혈압 정보를 삭제하시겠습니까?");
						if(answer == true){
							location.href="<c:url value='/deleteBody/${body.bodyNo}' />";
						}
					}
				</script>
 		<br>
			   </c:forEach>
			   
			<h3>전체 기분 관리 목록</h3>
			<c:if test="${not empty sessionScope.sid}">
				<h5 id="UserName">${sessionScope.sid}님의 기분 기록입니다</h5>
			</c:if>
			
			<c:forEach var="feel" items="${feelList}">
				기분척도 : ${feel.feelScale}
				기분일기 : ${feel.feelMemo}
				기록날짜 : ${feel.feelRecordDate}
				기록시간 : ${feel.feelRecordTime}
				기록자 : ${feel.famNo}
				
			<a href="<c:url value='/updateFeelForm/${feel.feelNo}'/>">기분 정보 수정</a>
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
			
</body>
</html>