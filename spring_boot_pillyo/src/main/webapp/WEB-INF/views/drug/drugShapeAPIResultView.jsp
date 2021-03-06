<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>낱알 약물 검색 결과</title>
		<link rel="stylesheet" href="<c:url value='/css/drug/drugShape.css'/>">	
	</head>
	<body>
		<div id="search_result_container">
			
				<h3>약모양 검색 결과</h3>
				<small>총 <fmt:formatNumber value="${fn:length(shapeList)}" pattern="#,###" /> 건</small>
				<hr />
				
		<c:choose>
	    	 <c:when test="${fn:length(shapeList) == 0}">
	       		 조회결과가 없습니다.
			 </c:when>
		     <c:otherwise>
				<div id="searchResult">
				
					<c:forEach items="${shapeList}" var="shape" >
							<div class="drugShapeBox">
								<a href="<c:url value='/drugDetailView/${shape.itemSeq}'/>">
									<img src="${shape.itemImage}" class="drugShapeImg" onerror="this.src='/img/fill_null.png'">
									<div class="drugShapeInfo">
										<span class="itemName">${shape.itemName}</span>
										<span class="shapeInfo">${shape.entpName}</span>
										<span class="shapeInfo">${shape.chart}</span>
										<span class="shapeInfo">${shape.print_front}</span>
										<span class="shapeInfo">${shape.drug_shape}</span>
										<span class="shapeInfo">${shape.color_class}</span>
										<span class="shapeInfo">${shape.form_code_name}</span>
										<span class="shapeInfo">${shape.class_name}</span>
									</div>
								</a>
							</div>
					</c:forEach>
					
				</div>
			   </c:otherwise> 
			</c:choose>
			
		
    	</div> <!-- searchResult_container -->
	</body>
</html>