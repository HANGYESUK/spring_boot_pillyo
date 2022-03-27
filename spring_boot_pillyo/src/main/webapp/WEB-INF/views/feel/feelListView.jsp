<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>기분 정보 목록</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="/css/member/myList.css" />
		
	</head>
	<body>
		<div id="wrap">
		
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />


		<!-- Section -- 기분관리 : 기분척도, 메모, 기록날짜, 기록시간, 가족번호 -->
		<div id="navMargin"></div>
			
			<section id="section">
			<div id="my_List">
			<h3>전체 기분 관리 목록</h3>
			
			<table>
		 		<tr> <th>번호</th><th>날짜</th><th>시간</th><th>기록자</th>
		 			 <th>기분점수</th><th id="feelMemo">일기</th><th>수정</th></tr>
				<c:forEach var="feel" items="${feelList}">
				<tr> <td>${feel.feelNo}</td>
		 			 <td>${feel.feelRecordDate}</td>
		 			 <td>${feel.feelRecordTime}</td>
		 			 <td>${feel.famMember}</td>
		 			 <td>${feel.feelScale}</td>
		 			 <td>${feel.feelMemo}</td>
		 			 <td>
						<a href="<c:url value='/updateFeelForm/${feel.feelNo}'/>">
							<button id="btn1">수정</button></a>
					 	<a href="javascript:deleteCheck();">
					 		<button id="btn2">삭제</button></a></td></tr>
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
