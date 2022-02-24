<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>약 낱알 식별 검색</title>
		<link rel="stylesheet" href="/css/drug/drugShapeSearchForm.css" />
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/drugShapeSearchForm.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
				<div id="drugShapeSearchForm">
					<form method="post" action="/drugShape">
						<table>
							<tr id="search_shape">
								<th>모양</th>
								<td>
									<div class="shapeBox">
										<label for="shapeAlll"><span class="textItem">전체</span>
											<input type="checkbox" id="shapeAlll" name="drug_shape" class="sBox" value="전체" checked />
										</label>
									</div>
		
									<div class="shapeBox">
										<label for="shape1">
											<img src="/img/drugShape/shape/shape01.jpg" alt="원형">
											<input type="checkbox" id="shape1" name="drug_shape" class="sBox" value="원형" />
										</label>
									</div>
									
									<div class="shapeBox">
										<label for="shape2">
											<img src="/img/drugShape/shape/shape02.jpg" alt="타원형">
											<input type="checkbox" id="shape2" name="drug_shape" class="sBox" value="타원형" />
										</label>
									</div>
									
									<div class="shapeBox">
										<label for="shape3"> <img src="/img/drugShape/shape/shape03.jpg" alt="반원형">
											<input type="checkbox" id="shape3" name="drug_shape" class="sBox" value="반원형" />
										</label>
									</div>
									
									<div class="shapeBox">
										<label for="shape4"> <img src="/img/drugShape/shape/shape04.jpg" alt="삼각형">
											<input type="checkbox" id="shape4" name="drug_shape" class="sBox" value="삼각형" />
										</label>
									</div>
									
									<div class="shapeBox">
										<label for="shape5"> <img src="/img/drugShape/shape/shape05.jpg" alt="사각형">
											<input type="checkbox" id="shape5" name="drug_shape" class="sBox" value="사각형" />
										</label>
									</div>
									
									<div class="shapeBox">
										<label for="shape6"> <img src="/img/drugShape/shape/shape06.jpg" alt="마름모">
											<input type="checkbox" id="shape6" name="drug_shape" class="sBox" value="마름모" />
										</label>
									</div>
									
									<div class="shapeBox">
										<label for="shape7"> <img src="/img/drugShape/shape/shape07.jpg" alt="장방형">
											<input type="checkbox" id="shape7" name="drug_shape" class="sBox" value="장방형" />
										</label>
									</div>
									
									<div class="shapeBox">
										<label for="shape8"> <img src="/img/drugShape/shape/shape08.jpg" alt="오각형">
											<input type="checkbox" id="shape8" name="drug_shape" class="sBox" value="오각형" />
										</label>
									</div>
									
									<div class="shapeBox">
										<label for="shape9"> <img src="/img/drugShape/shape/shape09.jpg" alt="육각형">
											<input type="checkbox" id="shape9" name="drug_shape" class="sBox" value="육각형" />
										</label>
									</div>
									
									<div class="shapeBox">
										<label for="shape10"> <img src="/img/drugShape/shape/shape10.jpg" alt="팔각형">
											<input type="checkbox" id="shape10" name="drug_shape" class="sBox" value="팔각형" />
										</label>
									</div>
									
									<div class="shapeBox">
										<label for="shapeEtc"><span class="textItem">기타</span>
											<input type="checkbox" id="shapeEtc" name="drug_shape" class="sBox" value="기타" />
										</label>
									</div>
								</td>
							</tr>
							<tr id="search_color">
								<th>색상</th>
								<td>
									<label for="cWhite">
										<div class="colorBox">
											<input type="checkbox" id="cWhite" name="color_class" class="cBox" value="하양" checked/>
										</div>
									</label>
									
									<label for="cYellow">
										<div class="colorBox">
											<input type="checkbox" id="cYellow" name="color_class" class="cBox" value="노랑" />
										</div>
									</label>
									
									<label for="cOrange">
										<div class="colorBox">
											<input type="checkbox" id="cOrange" name="color_class" class="cBox" value="주황" />
										</div>
									</label>
									
									<label for="cPink">
										<div class="colorBox">
											<input type="checkbox" id="cPink" name="color_class" class="cBox" value="분홍" />
										</div>
									</label>
									
									<label for="cRed">
										<div class="colorBox">
											<input type="checkbox" id="cRed" name="color_class" class="cBox" value="빨강" />
										</div>
									</label>
									
									<label for="cBrown">
										<div class="colorBox">
											<input type="checkbox" id="cBrown" name="color_class" class="cBox" value="갈색" />
										</div>
									</label>
									
									<label for="cLightGreen">
										<div class="colorBox">
											<input type="checkbox" id="cLightGreen" name="color_class" class="cBox" value="연두" />
										</div>
									</label>
									
									<label for="cGreen">
										<div class="colorBox">
											<input type="checkbox" id="cGreen" name="color_class" class="cBox" value="초록" />
										</div>
									</label>

									<label for="cCyan">
										<div class="colorBox">
											<input type="checkbox" id="cCyan" name="color_class" class="cBox" value="청록" />
										</div>
									</label>
									
									<label for="cBlue">
										<div class="colorBox">
											<input type="checkbox" id="cBlue" name="color_class" class="cBox" value="파랑" />
										</div>
									</label>
									
									<label for="cNavy">
										<div class="colorBox">
											<input type="checkbox" id="cNavy" name="color_class" class="cBox" value="남색" />
										</div>
									</label>
									
									<label for="cPurple">
										<div class="colorBox">
											<input type="checkbox" id="cPurple" name="color_class" class="cBox" value="자주" />
										</div>
									</label>
									
									<label for="cViolet">
										<div class="colorBox">
											<input type="checkbox" id="cViolet" name="color_class" class="cBox" value="보라" />
										</div>
									</label>
									
									<label for="cGray">
										<div class="colorBox">
											<input type="checkbox" id="cGray" name="color_class" class="cBox" value="회색" />
										</div>
									</label>
									
									<label for="cBlack">
										<div class="colorBox">
											<input type="checkbox" id="cBlack" name="color_class" class="cBox" value="검정" />
										</div>
									</label>
									
									<label for="cTrans">
										<div class="colorBox">
											<input type="checkbox" id="cTrans" name="color_class" class="cBox" value="투명" />
										</div>
									</label>
								</td>
							</tr>
							<tr id="search_type">
								<th>제형</th>
								<td>
									<div class="typeBox">
										<label for="drugType1"> <img src="/img/drugShape/type/type01.jpg" alt="정제">
											<input type="checkbox" id="drugType1" name="form_code_name" class="tBox" value="정제" checked/>
										</label>
									</div>
									
									<div class="typeBox">
										<label for="drugType2"> <img src="/img/drugShape/type/type02.jpg" alt="경질">
											<input type="checkbox" id="drugType2" name="form_code_name" class="tBox" value="경질" />
										</label>
									</div>
									
									<div class="typeBox">
										<label for="drugType3"> <img src="/img/drugShape/type/type03.jpg" alt="연질">
											<input type="checkbox" id="drugType3" name="form_code_name" class="tBox" value="연질" />
										</label>
									</div>
								</td>
							</tr>
							<tr id="search_line">
								<th>분할선</th>
								<td>
									<div class="lineBox">
										<label for="drugLine2"> <img src="/img/drugShape/line/line02.jpg" alt="+형">
											<input type="checkbox" id="drugLine2" name="line_front" class="lBox" value="+" checked/>
										</label>
									</div>
									
									<div class="lineBox">
										<label for="drugLine3"> <img src="/img/drugShape/line/line03.jpg" alt="-형">
											<input type="checkbox" id="drugLine3" name="line_front" class="lBox" value="-" />
										</label>
									</div>
									
									<div class="lineBox lineNoneBox">
										<label for="drugLineEtc"><span class="textItem">없음</span>
											<input type="checkbox" id="drugLineEtc" name="line_front" class="lBox" value="기타" />
										</label>
									</div>
								</td>
							</tr>
							<tr><td colspan="2"><input type="submit" id="DSSbtn" value="검색" /></td></tr>
						</table>
					</form>
				</div>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
	<script type="text/javascript">
		// 기본으로 체크되어있는 값 테두리 설정
		/* $(document).ready(function() {
			if($('input[type=checkbox]').is(':checked')){
				$(this).parent().parent().css('border', '4px solid #697fba');
			}
		}); */

		//	모양 선택
		$('.sBox').change(function(){
			$('.sBox').parent().parent().css('border', 'none');
			
			if($(this).is(':checked')){
				$(this).parent().parent().css('border', '4px solid #697fba');
			}
		    else{
				$(this).parent().parent().css('border', 'none');
			}
		});
		
		// 색상 선택
		$('.cBox').change(function(){
			$('.cBox').parent().parent().css('border', 'none');
			
			if($(this).is(':checked')){
				$(this).parent().parent().css('border', '4px solid #697fba');
			}
		    else{
				$(this).parent().parent().css('border', 'none');
			}
		});
		
		// 제형 선택
		$('.tBox').change(function(){
			$('.tBox').parent().parent().css('border', 'none');
			
			if($(this).is(':checked')){
				$(this).parent().parent().css('border', '4px solid #697fba');
			}
		    else{
				$(this).parent().parent().css('border', 'none');
			}
		});
		
		// 분할선 선택
		$('.lBox').change(function(){
			$('.lBox').parent().parent().css('border', 'none');
			
			if($(this).is(':checked')){
				$(this).parent().parent().css('border', '4px solid #697fba');
			}
		    else{
				$(this).parent().parent().css('border', 'none');
			}
		});
	</script>
</html>