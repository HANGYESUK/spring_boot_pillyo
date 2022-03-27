<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>혈당 전체 정보 목록</title>
		<link rel="stylesheet" href="/css/member/myList.css" />
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<div id="navMargin"></div>
			
			<section id="section">
			<div id="my_List">
			<h3>전체 혈당 관리 목록</h3>
				 
		 	<table>
		 		<tr> <th>번호</th><th>날짜</th><th>시간</th><th>가족이름</th>
		 			 <th>상황</th><th>투약</th><th>식전/식후</th><th>수치</th><th>메모</th><th>수정</th></tr>
	 			<c:forEach items="${sugarList}" var="sugar">
		 		<tr> <td>${sugar.sugarNo}</td>
		 			 <td>${sugar.sugarRecordDate}</td>
		 			 <td>${sugar.sugarRecordTime}</td>
		 			 <td>${sugar.famMember}</td>
		 			 <td>${sugar.situation}</td>
		 			 <td>${sugar.sugarMedication}</td>
		 			 <td>${sugar.acpc}</td>
		 			 <td>${sugar.sugarLevel}</td>
		 			 <td id="acpcMemo">${sugar.acpcMemo}</td>
		 			 <td><a href="<c:url value='/updateSugarForm/${sugar.sugarNo}'/>">
		 			 		<button id="btn1">수정</button></a>
		 				 <a href="javascript:deleteCheck();">
		 				 	<button id="btn2">삭제</button></a></td></tr>
				 </c:forEach>
		 	</table>
		 		
			<script type="text/javascript">
				function deleteCheck(){
					var answer = confirm("선택한 혈당 정보를 삭제하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deleteSugar/${sugar.sugarNo}' />";
					}
				}
			</script>
		 		
		</div>
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
    	</div> <!-- wrap -->
	</body>
</html>