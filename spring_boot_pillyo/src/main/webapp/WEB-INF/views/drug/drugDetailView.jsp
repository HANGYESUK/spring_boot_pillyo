<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>약 상세 정보</title>
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<section>
				<h3>약 정보 상세 조회</h3>
				
				<div class="drugImg">
					<img src="${drug.itemImage}" height="180px" onerror="this.src='/img/fill_null.png'">
				</div>
				<div class="drugName">
				<h4>제품명:</h4>	${drug.itemName} <br>
				<h4>업체명:</h4>	${drug.entpName}
				</div>
				
				<h4>효능</h4><br>  ${drug.efcyQesitm}
				<h4>사용방법</h4><br> ${drug.useMethodQesitm}
				<h4>주의사항</h4><br> ${drug.atpnQesitm}
				<h4>주의해야할 약 또는 음식</h4><br>${drug.intrcQesitm}
				<h4>이상반응</h4><br>${drug.seQesitm}
				<h4>보관방법</h4><br>${drug.depositMethodQesitm}
				
				
				
		
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
    	</div> <!-- wrap -->
	</body>
</html>