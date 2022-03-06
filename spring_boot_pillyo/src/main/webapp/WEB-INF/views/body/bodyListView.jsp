<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>체형관리 전체 목록</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<style type="text/css">
		
		 #my_body{
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
			<div id="my_body">
			<h3>전체 체형 관리 목록</h3>
				<table>
		 		<tr> <th>번호</th><th>날짜</th><th>가족이름</th>
		 			 <th>키</th><th>몸무게</th><th>BMI</th><th>수정</th></tr>
			   <c:forEach items="${bodyList }" var="body">
			   <tr> <td>${body.bodyNo}</td>
			   		<td>${body.bodyRecordDate}</td>
			   		<td>${body.famMember}</td>
			   		<td>${body.height}</td>
			   		<td>${body.weight}</td>
			   		<td>${body.bmi}</td>
			   		<td>
				   	<a href="<c:url value='/updateBodyForm/${body.bodyNo}'/>">체형 관리 정보 수정</a>
				   	<a href="javascript:deleteCheck();">체형 관리 정보 삭제</a><br></td></tr>
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