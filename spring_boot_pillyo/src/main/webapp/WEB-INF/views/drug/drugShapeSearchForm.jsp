<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/css/drug/drugShapeSearchForm.css" />
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/drugShapeSearchForm.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<section>
		<br><br>
			약 모양  API test<br>
			
			<form method="post" action="/drugShapeAPI">
				<input type="text" name="itemName" id="itemName" placeholder="약모양API 검색"/>
				<input type="submit" value="전송" />
			</form>
		
		<br><br><br><br><br><br><br><br>
		
			
			<div id="drugShaptSearchForm">
				<form method="post" action="/drugShape">
					
				<table>
					<tr id="search_shape">
						<th>모양</th>
						<td>
							<label for="shapeAlll">전체</label>
							<input type="checkbox" id="shapeAlll" name="drug_shape" value="전체" />
							
							<!-- <label for="shape1"> -->
							<div id="shapebox">
							<img src="/img/drugShape/shape/shape01.jpg" alt="원형">
							<input type="checkbox" id="shape1" name="drug_shape" value="원형" />
							</div>
							<!-- </label> -->
							
							<label for="shape2"> <img src="/img/drugShape/shape/shape02.jpg" alt="타원형">
							<input type="checkbox" id="shape2" name="drug_shape" value="타원형" />
							</label>
							<label for="shape3"> <img src="/img/drugShape/shape/shape03.jpg" alt="반원형">
							<input type="checkbox" id="shape3" name="drug_shape" value="반원형" />
							</label>
							<label for="shape4"> <img src="/img/drugShape/shape/shape04.jpg" alt="삼각형">
							<input type="checkbox" id="shape4" name="drug_shape" value="삼각형" />
							</label>
							<label for="shape5"> <img src="/img/drugShape/shape/shape05.jpg" alt="사각형">
							<input type="checkbox" id="shape5" name="drug_shape" value="사각형" />
							</label>
							<label for="shape6"> <img src="/img/drugShape/shape/shape06.jpg" alt="마름모">
							<input type="checkbox" id="shape6" name="drug_shape" value="마름모" />
							</label>
							<label for="shape7"> <img src="/img/drugShape/shape/shape07.jpg" alt="장방형">
							<input type="checkbox" id="shape7" name="drug_shape" value="장방형" />
							</label>
							<label for="shape8"> <img src="/img/drugShape/shape/shape08.jpg" alt="오각형">
							<input type="checkbox" id="shape8" name="drug_shape" value="오각형" />
							</label>
							<label for="shape9"> <img src="/img/drugShape/shape/shape09.jpg" alt="육각형">
							<input type="checkbox" id="shape9" name="drug_shape" value="육각형" />
							</label>
							<label for="shape10"> <img src="/img/drugShape/shape/shape10.jpg" alt="팔각형">
							<input type="checkbox" id="shape10" name="drug_shape" value="팔각형" />
							</label>
							<label for="shapeEtc">기타</label>
							<input type="checkbox" id="shapeEtc" name="drug_shape" value="기타" />
							</td>
					</tr>
					<tr id="search_color">
						<th>색상</th>
						<td>
							<input type="checkbox" id="" name="color_class" value="전체" />전체
							<input type="checkbox" id="" name="color_class" value="하양" />하양
							<input type="checkbox" id="" name="color_class" value="노랑" />노랑
							<input type="checkbox" id="" name="color_class" value="주황" />주황
							<input type="checkbox" id="" name="color_class" value="분홍" />분홍
							<input type="checkbox" id="" name="color_class" value="빨강" />빨강
							<input type="checkbox" id="" name="color_class" value="갈색" />갈색
							<input type="checkbox" id="" name="color_class" value="연두" />연두
							<input type="checkbox" id="" name="color_class" value="초록" />초록
							<input type="checkbox" id="" name="color_class" value="청록" />청록
							<input type="checkbox" id="" name="color_class" value="파랑" />파랑
							<input type="checkbox" id="" name="color_class" value="남색" />남색
							<input type="checkbox" id="" name="color_class" value="자주" />자주
							<input type="checkbox" id="" name="color_class" value="보라" />보라
							<input type="checkbox" id="" name="color_class" value="회색" />회색
							<input type="checkbox" id="" name="color_class" value="검정" />검정
							<input type="checkbox" id="" name="color_class" value="투명" />투명
							</td>
					</tr>
					<tr>
						<th>
						제형
						</th>
						<td>
							<label for="drugTypeAll"> 전체
							<input type="checkbox" id="drugTypeAll" name="form_code_name" value="전체" />
							</label>
							<label for="drugType1"> <img src="/img/drugShape/type/type01.jpg" alt="정제">
							<input type="checkbox" id="drugType1" name="form_code_name" value="정제" />
							</label>
							<label for="drugType2"> <img src="/img/drugShape/type/type02.jpg" alt="경질">
							<input type="checkbox" id="drugType2" name="form_code_name" value="경질" />
							</label>
							<label for="drugType3"> <img src="/img/drugShape/type/type03.jpg" alt="연질">
							<input type="checkbox" id="drugType3" name="form_code_name" value="연질" />
							</label>
						</td>
					</tr>
					<tr>
						<th>
						분할선
						</th>
						<td>
							<input type="checkbox" id="drugLineAll" name="line_front" value="전체" />전체
							<label for="drugLineEtc"> 
							<input type="checkbox" id="drugLine3" name="line_front" value="없음" />
							</label>
							<label for="drugLine2"> <img src="/img/drugShape/line/line02.jpg" alt="+형">
							<input type="checkbox" id="drugLine2" name="line_front" value="+" />
							</label>
							<label for="drugLine3"> <img src="/img/drugShape/line/line03.jpg" alt="-형">
							<input type="checkbox" id="drugLine3" name="line_front" value="-" />
							</label>
							
						</td>
					</tr>
				</table>
					<input type="submit" value="검색" />
				</form>
			
			
			</div>
			
		
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
    	</div> <!-- wrap -->
	</body>
</html>