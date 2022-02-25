<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>복용 전체 목록 조회</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="/css/dose/doseListView.css" />
		
		<!-- kakao developers -->
		<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
				<div id="doseListHeader">
					<h3>복용 목록 조회</h3>
				</div>
				<div id="doseItemBox">
			  		 <c:forEach items="${doseList }" var="dose">
			   			<a href="<c:url value='/doseDetailView/${dose.ddNo}'/>">
			   				<div class="doseItem">
			   					<div class="itemBottom">
			   						${dose.ddTitle }
			   					</div>
		   					</div>
	   					</a>
			   		</c:forEach>
				</div>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>