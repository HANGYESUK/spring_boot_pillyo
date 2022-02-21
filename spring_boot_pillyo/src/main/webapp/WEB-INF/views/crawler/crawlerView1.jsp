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
			<a href="crawlerView1">크롤링뷰1</a>
			<br><br>
			
			<a href="crawling1">크롤링하기1</a>
			<hr>
			
			<!-- 1 -->
			<div id="genericMedicineInfoBox">
				<h1>1. 일반 의약품 안내</h1>
				<div id="aboutDrugBox">
					 <h2>약이란?</h2>
					 ${aboutDrug }
				 </div>
				 
				 <div id="otcEtcStcBox">
					 <h2>일반의약품과 전문의약품 - (안전 상비 의약품 이전 정보 따로 분리 불가능)</h2>
					 ${OTCETC }
					 <br>
					 <h3>안전 상비 의약품 - 따로 분류 가능</h3>
					 ${STC }
				 </div>

				 <div id="typeOfDrugBox">
					 <h2>일반약의 종류</h2>
					 ${typeOfDrug }
				 </div>
				 <hr>
			</div>
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>