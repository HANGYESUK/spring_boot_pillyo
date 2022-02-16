<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>약리스트</title>
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<section>
				<h3>약 검색 결과</h3>
				<small>총 <fmt:formatNumber value="${fn:length(druglist)}" pattern="#,###" /> 건</small>
				<hr />
				
		<c:choose>
	    	 <c:when test="${fn:length(druglist) == 0}">
	       		 조회결과가 없습니다.
			 </c:when>
		     <c:otherwise>
				<div id="searchResult">
				
					<c:forEach items="${druglist}" var="drug" >
							<div class="drugBox">
								<img src="${drug.itemImage}" width="200" height="100">
								<a href="<c:url value='/drugDetailView/${drug.drugInfoNo}'/>">${drug.itemName}</a>
								${drug.entpName}
							</div>
					</c:forEach>
					
				</div>
			   </c:otherwise> 
			</c:choose>
			
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
    	</div> <!-- wrap -->
	</body>
</html>