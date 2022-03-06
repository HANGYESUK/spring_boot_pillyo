<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>혈압 정보 전체 목록</title>
		<style type="text/css">
		
		 #pressure{
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
			<div id="pressure">
			<h3>전체 혈압 관리 목록</h3>
		
			<table>
		 		<tr> <th>번호</th><th>날짜</th><th>시간</th><th>가족이름</th>
		 			 <th>상황</th><th>수축기 혈압</th><th>이완기 혈압</th><th>심박수</th><th>메모</th><th>수정</th></tr>
				<c:forEach items="${pressureList}" var="pressure"  varStatus="i">
		 		<tr> <td>${pressure.pressureNo}</td>
		 			 <td>${pressure.pressureRecordDate}</td>
		 			 <td>${pressure.pressureRecordTime}</td>
		 			 <td>${pressure.famMember}</td>
		 			 <td>${pressure.situation}</td>
		 			 <td>${pressure.SBP}</td>
		 			 <td>${pressure.DBP}</td>
		 			 <td>${pressure.bpm}</td>
		 			 <td>${pressure.pressureMemo}</td>
		 			 <td><a href="<c:url value='/updatePressureForm/${pressure.pressureNo}'/>">혈당 정보 수정</a><br>
		 				 <a href="javascript:deleteCheck();">혈당 정보 삭제</a></td>
				</c:forEach>
		 	</table>
			
			<script type="text/javascript">
				function deleteCheck(){
					var answer = confirm("선택한 혈압 정보를 삭제하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deletePressure/${pressure.pressureNo}' />";
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