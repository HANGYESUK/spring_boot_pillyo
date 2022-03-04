<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>혈당 전체 정보 목록</title>
		<style type="text/css">
		
		 #my_sugar{
   			text-align: center;
   			padding-top : 20px;
		 }
		 table {
		    width: 80%;
   			text-align: center;
		    border-top: 1px solid #444444;
		    border-collapse: collapse;
		    margin-left:auto; 
    		margin-right:auto;
		 }
		 th, td {
		    border-bottom: 1px solid #444444;
		    padding: 10px;
		 }
		 td{
		  	background-color : #ffffff;
		 }
		</style>
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<div id="navMargin"></div>
			
			<section id="section">
			<div id="my_sugar">
			<h3>전체 혈당 관리 목록</h3>
				 
			 <c:forEach items="${sugarList}" var="sugar">
			 		<%-- 번호 ${sugar.sugarNo}
			 		상황 ${sugar.situation}
			 		투약 ${sugar.sugarMedication}
			 		식전/식후 ${sugar.acpc}
			 		수치 ${sugar.sugarLevel}
			 		메모 ${sugar.acpcMemo}
			 		기록날짜 ${sugar.sugarRecordDate}
			 		기록시간 ${sugar.sugarRecordTime}
			 		가족번호 ${sugar.famNo}
			 		가족이름 ${sugar.famMember} --%>
		 	<table>
		 		<tr> <th>번호</th><th>날짜</th><th>시간</th><th>가족이름</th>
		 			 <th>상황</th><th>투약</th><th>식전/식후</th><th>수치</th><th>메모</th><th>수정</th></tr>
		 		<tr> <td>${sugar.sugarNo}</td>
		 			 <td>${sugar.sugarRecordDate}</td>
		 			 <td>${sugar.sugarRecordTime}</td>
		 			 <td>${sugar.famMember}</td>
		 			 <td>${sugar.situation}</td>
		 			 <td>${sugar.sugarMedication}</td>
		 			 <td>${sugar.acpc}</td>
		 			 <td>${sugar.sugarLevel}</td>
		 			 <td>${sugar.acpcMemo}</td>
		 			 <td><a href="<c:url value='/updateSugarForm/${sugar.sugarNo}'/>">혈당 정보 수정</a><br>
		 				 <a href="javascript:deleteCheck();">혈당 정보 삭제</a></td>
		 	</table>
		 		
			<script type="text/javascript">
				function deleteCheck(){
					var answer = confirm("선택한 혈당 정보를 삭제하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deleteSugar/${sugar.sugarNo}' />";
					}
				}
			</script>
		 		
		 </c:forEach>
		
		
		</div>
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
    	</div> <!-- wrap -->
	</body>
</html>