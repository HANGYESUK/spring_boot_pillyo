<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>title</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="<c:url value='/css/admin/adminTable.css'/>">
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
				
			<div id="adminContainer">
			<jsp:include page="/WEB-INF/views/admin/adminMainMenu.jsp" flush='true' />
				
				<div id="adminTableBox">
				<h2>${userId } 님의 가족 정보입니다.</h2>
				<table class="adminTable">
				   <tr>
				   	<th>가족번호</th>
				   	<th>가족이름</th>
				   	<th>생년월일</th>
				   	<th>성별</th>
				   	<th>삭제</th>
				   </tr>
				   
				 	<c:forEach items="${famList }" var="fam">
				   		<tr>
				   			<td>${fam.famNo}</td>
				   			<td>${fam.famMember }</td>
				   			<td>${fam.famBirth }</td>
				   			<td>${fam.famGender}</td>
				   			<td><button onclick="deleteCheck('${fam.famNo}');" >삭제</button></td>
				   			</tr>
				   </c:forEach>
				   <script>
						function deleteCheck(no){
							var answer = confirm("해당 가족 구성원을 목록에서 삭제하시겠습니까?");
							if(answer == true){
								location.href="/a_famDelete/"+ no + "' />";
							}
						}
				</script>
				</table>
				</div>
				</div>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		
      </div> <!-- wrap -->
	</body>
</html>