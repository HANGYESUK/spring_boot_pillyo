<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>혈당 뷰</title>
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<div id="navMargin"></div>
			
			<section id="section">
			<h3>혈당 뷰페이지</h3>
				 
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
		
		</table>
		
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
    	</div> <!-- wrap -->
	</body>
</html>