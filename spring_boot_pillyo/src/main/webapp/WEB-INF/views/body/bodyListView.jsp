<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>체형관리 전체 목록</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="/css/member/myList.css" />
		
	</head>
	<body>
		<div id="wrap">
		
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<div id="navMargin"></div>
			
			<section id="section">
			<div id="my_List">
			<h3>전체 체형 관리 목록</h3>
				<table>
		 		<tr> <th>번호</th><th>날짜</th><th>가족이름</th>
		 			 <th>키</th><th>몸무게</th><th>BMI</th><th>수정/삭제</th></tr>
			   <c:forEach items="${bodyList }" var="body">
			   <tr> <td>${body.bodyNo}</td>
			   		<td>${body.bodyRecordDate}</td>
			   		<td>${body.famMember}</td>
			   		<td>${body.height}</td>
			   		<td>${body.weight}</td>
			   		<td>${body.bmi}</td>
			   		<td>
				   	<a href="<c:url value='/updateBodyForm/${body.bodyNo}'/>">
				   		<button id="btn1">수정</button></a>
				   	<a href="javascript:deleteCheck();">
				   		<button id="btn2">삭제</button></a></td></tr>
			   </c:forEach>
			   </table>
			   	<script type="text/javascript">
					function deleteCheck(){
						var answer = confirm("선택한 체형 정보를 삭제하시겠습니까?");
						if(answer == true){
							location.href="<c:url value='/deleteBody/${body.bodyNo}' />";
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