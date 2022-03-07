<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>약모양 리스트</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<%-- <link rel="stylesheet" href="<c:url value='/css/admin/a_listAllDrugInfoView.css'/>"> --%>
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
			
				 <table class="adminTable">
				 	<thead>
				 	<tr>
				 		<th>약이미지</th>
				 		<th>제품명</th>
				 		<th>업체명</th>
				 		<th>품목번호</th>
				 		<th>성상</th>
				 	</tr>
				 	</thead>
				 	<c:forEach items="${shapeList}" var="shape">
				 		<tr>
				 		<td><img src="${shape.itemImage }" alt="약정보" onerror="this.src='/img/fill_null.png'" width="50px" height="25px"/></td>
				 		<td>${shape.itemName }</td>
				 		<td>${shape.entpName }</td>
				 		<td>${shape.itemSeq }</td>
				 		<td>${shape.chart }</td>
				 		
				 	</tr>
				 	
				 	</c:forEach>
				 </table>

			</div>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>