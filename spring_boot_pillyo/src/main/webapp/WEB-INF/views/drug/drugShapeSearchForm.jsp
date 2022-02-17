<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<section>
			
			<div id="drugShaptSearchForm">
				<form method="post" action="/drugShape">
					모양
						<input type="radio" name="DRUG_SHAPE" value="전체" />전체
						<input type="radio" name="DRUG_SHAPE" value="원형" />원형
						<input type="radio" name="DRUG_SHAPE" value="타원형" />타원형
						<input type="radio" name="DRUG_SHAPE" value="반원형" />반원형
						<input type="radio" name="DRUG_SHAPE" value="삼각형" />삼각형
						<input type="radio" name="DRUG_SHAPE" value="사각형" />사각형
						<input type="radio" name="DRUG_SHAPE" value="마름모" />마름모
						<input type="radio" name="DRUG_SHAPE" value="장방형" />장방형
						<input type="radio" name="DRUG_SHAPE" value="오각형" />오각형
						<input type="radio" name="DRUG_SHAPE" value="육각형" />육각형
						<input type="radio" name="DRUG_SHAPE" value="팔각형" />팔각형
						<input type="radio" name="DRUG_SHAPE" value="기타" />기타
					색상
						<input type="radio" name="COLOR_CLASS1" value="전체" />전체
						<input type="radio" name="COLOR_CLASS1" value="하양" />하양
						<input type="radio" name="COLOR_CLASS1" value="노랑" />노랑
						<input type="radio" name="COLOR_CLASS1" value="주황" />주황
						<input type="radio" name="COLOR_CLASS1" value="분홍" />분홍
						<input type="radio" name="COLOR_CLASS1" value="빨강" />빨강
						<input type="radio" name="COLOR_CLASS1" value="갈색" />갈색
						<input type="radio" name="COLOR_CLASS1" value="연두" />연두
						<input type="radio" name="COLOR_CLASS1" value="초록" />초록
						<input type="radio" name="COLOR_CLASS1" value="청록" />청록
						<input type="radio" name="COLOR_CLASS1" value="파랑" />파랑
						<input type="radio" name="COLOR_CLASS1" value="남색" />남색
						<input type="radio" name="COLOR_CLASS1" value="자주" />자주
						<input type="radio" name="COLOR_CLASS1" value="보라" />보라
						<input type="radio" name="COLOR_CLASS1" value="회색" />회색
						<input type="radio" name="COLOR_CLASS1" value="검정" />검정
						<input type="radio" name="COLOR_CLASS1" value="투명" />투명
					제형
						<input type="radio" name="FORM_CODE_NAME" value="전체" />전체
						<input type="radio" name="FORM_CODE_NAME" value="정제" />정제
						<input type="radio" name="FORM_CODE_NAME" value="경질" />경질
						<input type="radio" name="FORM_CODE_NAME" value="연질" />연질
					분할선
						<input type="radio" name="MARK_CODE_FRONT_ANAL" value="전체" />전체
						<input type="radio" name="MARK_CODE_FRONT_ANAL" value="+형" />+형
						<input type="radio" name="MARK_CODE_FRONT_ANAL" value="-형" />-형
						<input type="radio" name="MARK_CODE_FRONT_ANAL" value="기타" />기타
					
				
				</form>
			
			
			</div>
			
		
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
    	</div> <!-- wrap -->
	</body>
</html>