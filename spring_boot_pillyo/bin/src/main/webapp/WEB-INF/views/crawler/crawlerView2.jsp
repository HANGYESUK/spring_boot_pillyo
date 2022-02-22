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
			<a href="crawlerView2">크롤링뷰2</a>
			<br><br>
			
			<a href="crawling2">크롤링하기2</a>
			<hr>
			
			<!-- 2 -->
			<div id="howToTakeBox">
				<h1>2. 의약품 복용법</h1>
				<div id="childTakeBox">
					 <h2>어린이 약복용 (약물을 복용 전 반드시 알아야 하는 내용)</h2>
					 ${childTake }
				 </div>
				 
				<div id="drugExpirationBox">
					 <h2>의약품 유효기간</h2>
					 ${drugExpiration }
				 </div>
				 <hr>
			</div>
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>