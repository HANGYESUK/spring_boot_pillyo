<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>title</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<section>
			<h3>가족 목록 조회</h3>
			<table>
				<tr><th>가족번호</th><th>아이디</th><th>이름</th><th>생년월일</th><th>성별</th></tr>
			   <c:forEach items="${famList }" var="fam">
			   	<tr><td><a href="<c:url value='/famDetailView/${fam.famNo}'/>">${fam.famNo }</a></td>
		   			<td>${fam.userId }</td>
		   			<td>${fam.famMember }</td>
		   			<td>${fam.famBirth }</td>
		   			<td>${fam.famGender }</td>
			   	</tr>
			   </c:forEach>
			</table>
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>