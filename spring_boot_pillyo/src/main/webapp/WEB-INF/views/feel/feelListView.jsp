<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>기분 정보 목록</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<style type="text/css">
		
		 #my_feel{
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


		<!-- Section -- 기분관리 : 기분척도, 메모, 기록날짜, 기록시간, 가족번호 -->
		<div id="navMargin"></div>
			
			<section id="section">
			<div id="my_feel">
			<h3>전체 기분 관리 목록</h3>
			
			<table>
		 		<tr> <th>번호</th><th>날짜</th><th>시간</th><th>기록자</th>
		 			 <th>기분점수</th><th>일기</th><th>수정</th></tr>
				<c:forEach var="feel" items="${feelList}">
				<tr> <td>${feel.feelNo}</td>
		 			 <td>${feel.feelRecordDate}</td>
		 			 <td>${feel.feelRecordTime}</td>
		 			 <td>${feel.famMember}</td>
		 			 <td>${feel.feelScale}</td>
		 			 <td>${feel.feelMemo}</td>
		 			 <td>
						<a href="<c:url value='/updateFeelForm/${feel.feelNo}'/>">혈당 정보 수정</a>
					 	<a href="javascript:deleteCheck();">기분 정보 삭제</a></td></tr>
				</c:forEach>
		 			 
	 		</table>
	 		
			<script type="text/javascript">
				function deleteCheck(){
					var answer = confirm("선택한 기분 정보를 삭제하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deleteFeel/${feel.feelNo}' />";
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
