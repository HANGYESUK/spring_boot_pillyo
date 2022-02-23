<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>title</title>
		<link rel="stylesheet" href="/css/medicInfo/medicInfo.css" />
		<link rel="stylesheet" href="/css/drug/drugShapeSearchForm.css" />
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/medicInfo/medicInfo.js'/>"></script>
		<script src="<c:url value='/js/drugShapeSearchForm.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
				<div id="dropdownInfoBox">
			
					<!-- 1 -->
					<div id="genericMedicineInfoBox">
						<div class="openBtnBox">
							<h1>1. 일반 의약품 안내</h1>
							<a href="javascript:openGMIGroup();">+</a>
						</div>
						<div id="GMIbox" class="infoBox">
							<a href="#">약이란?</a>
							<div id="aboutDrugBox" class="info">${aboutDrug }</div>
							<br>
							<a href="#">일반의약품 | 전문의약품 | 안전 상비 의약품</a>
							<div id="otcEtcStcBox" class="info">${OTCETC }</div>
							<br>
							<a href="#">일반약의 종류</a>
							<div id="typeOfDrugBox" class="info">${typeOfDrug }</div>
						</div>
						<hr>
					</div>
						
					<!-- 2 : 의약품 : medicine -->
					<div id="howToTakeMBox">
						<div class="openBtnBox">
							<h1>2. 의약품 복용법</h1>
							<a href="javascript:openHTTMGroup();">+</a>
						</div>
						<div id="HTTMbox" class="infoBox">
							<a href="#">어린이 약복용시 필수 인지 사항</a>
							<div id="howToTakeMBox" class="info">${childTake }</div>
							<br>
							<a href="#">의약품 유효기간</a>
							<div id="drugExpirationBox" class="info">${drugExpiration }</div>
						</div>
					</div>
					<hr>
					
					<!-- 3 : 외용약 : medicine for external use-->
					<div id="howToTakeMEBox">
						<div class="openBtnBox">
							<h1>3. 외용약 사용법</h1>
							<a href="javascript:openMFEUGroup();">+</a>
						</div>
						<div id="MFEUbox" class="infoBox">
							<a href="#">가글제</a>
							<div id="gargleBox" class="info">${gargle }</div>
							<br>
							<a href="#">관장액</a>
							<div id="enemaBox" class="info">${enema }</div>
							<br>
							<a href="#">건조시럽제</a>
							<div id="drySyrupBox" class="info">${drySyrup }</div>
							<br>
							<a href="#">구강붕해정</a>
							<div id="orodispersibleTabletsBox" class="info">${orodispersibleTablets }</div>
							<br>
							<a href="#">박칼정</a>
							<div id="buccalTabletBox" class="info">${buccalTablet }</div>
							<br>
							<a href="#">발포정</a>
							<div id="effervescentTabletBox" class="info">${effervescentTablet }</div>
							<br>
							<a href="#">비강분무제</a>
							<div id="nasalSprayBox" class="info">${nasalSpray }</div>
							<br>
							
							<a href="#">산제</a>
							<div id="powderBox" class="info">${powder }</div>
							<br>
							<a href="#">설하정</a>
							<div id="sublingualTabletBox" class="info">${sublingualTablet }</div>
							<br>
							<a href="#">액제</a>
							<div id="liquidBox" class="info">${liquid }</div>
							<br>
							<a href="#">연고 | 크림 | 로션</a>
							<div id="oclBox" class="info">${OCL }</div>
							<br>
							<a href="#">점비제 (코)</a>
							<div id="nasalDropsBox" class="info">${nasalDrops }</div>
							<br>
							<a href="#">점안제</a>
							<div id="eyeDropsBox" class="info">${eyeDrops }</div>
							<br>
							<a href="#">점이제 (귀)</a>
							<div id="earDropsBox" class="info">${earDrops }</div>
							<br>
							
							<a href="#">정제 및 캡슐제</a>
							<div id="tcBox" class="info">${TC }</div>
							<br>
							<a href="#">질 좌제 (질정)</a>
							<div id="pessaryBox" class="info">${pessary }</div>
							<br>
							<a href="#">츄어블정</a>
							<div id="chewableTabletBox" class="info">${chewableTablet }</div>
							<br>
							<a href="#">패취제</a>
							<div id="patchBox" class="info">${patch }</div>
							<br>
							<a href="#">정량식 흡입제 (Metered Dose Inhaler)</a>
							<div id="mdiBox" class="info">${MDI }</div>
							<br>
							<a href="#">건조분말 흡입제 (Dry Powder Inhaler)</a>
							<div id="dpiBox" class="info">${DPI }</div>
							<br>
							<a href="#">항문 좌제 (좌약)</a>
							<div id="suppositoryBox" class="info">${suppository }</div>
						</div>
					</div>
				</div>
				
				<div id="drugShapeSearchGroup">
					<div id="drugShapeSearchBox">
						<form method="post" action="/drugShapeAPI">
							<input type="text" name="itemName" id="itemName" placeholder="약모양API 검색"/>
							<input type="submit" value="전송" />
						</form>
					</div>
					
					<div id="drugShapeSearchForm">
						<form method="post" action="/drugShape">
							<table>
								<tr id="search_shape">
									<th>모양</th>
									<td>
										<div class="shapeBox">
											<label for="shapeAlll"><span class="textItem">전체</span></label>
											<input type="checkbox" id="shapeAlll" name="drug_shape" value="전체" />
										</div>
			
										<div class="shapeBox">
											<label for="shape1">
												<img src="/img/drugShape/shape/shape01.jpg" alt="원형">
												<input type="checkbox" id="shape1" name="drug_shape" value="원형" />
											</label>
										</div>
										
										<div class="shapeBox">
											<label for="shape2">
												<img src="/img/drugShape/shape/shape02.jpg" alt="타원형">
												<input type="checkbox" id="shape2" name="drug_shape" value="타원형" />
											</label>
										</div>
										
										<div class="shapeBox">
											<label for="shape3"> <img src="/img/drugShape/shape/shape03.jpg" alt="반원형">
												<input type="checkbox" id="shape3" name="drug_shape" value="반원형" />
											</label>
										</div>
										
										<div class="shapeBox">
											<label for="shape4"> <img src="/img/drugShape/shape/shape04.jpg" alt="삼각형">
												<input type="checkbox" id="shape4" name="drug_shape" value="삼각형" />
											</label>
										</div>
										
										<div class="shapeBox">
											<label for="shape5"> <img src="/img/drugShape/shape/shape05.jpg" alt="사각형">
												<input type="checkbox" id="shape5" name="drug_shape" value="사각형" />
											</label>
										</div>
										
										<div class="shapeBox">
											<label for="shape6"> <img src="/img/drugShape/shape/shape06.jpg" alt="마름모">
												<input type="checkbox" id="shape6" name="drug_shape" value="마름모" />
											</label>
										</div>
										
										<div class="shapeBox">
											<label for="shape7"> <img src="/img/drugShape/shape/shape07.jpg" alt="장방형">
												<input type="checkbox" id="shape7" name="drug_shape" value="장방형" />
											</label>
										</div>
										
										<div class="shapeBox">
											<label for="shape8"> <img src="/img/drugShape/shape/shape08.jpg" alt="오각형">
												<input type="checkbox" id="shape8" name="drug_shape" value="오각형" />
											</label>
										</div>
										
										<div class="shapeBox">
											<label for="shape9"> <img src="/img/drugShape/shape/shape09.jpg" alt="육각형">
												<input type="checkbox" id="shape9" name="drug_shape" value="육각형" />
											</label>
										</div>
										
										<div class="shapeBox">
											<label for="shape10"> <img src="/img/drugShape/shape/shape10.jpg" alt="팔각형">
												<input type="checkbox" id="shape10" name="drug_shape" value="팔각형" />
											</label>
										</div>
										
										<div class="shapeBox">
											<label for="shapeEtc"><span class="textItem">기타</span></label>
											<input type="checkbox" id="shapeEtc" name="drug_shape" value="기타" />
										</div>
									</td>
								</tr>
								<tr id="search_color">
									<th>색상</th>
									<td>
										<label for="cWhite">
											<div class="colorBox">
												<input type="checkbox" id="cWhite" name="color_class" value="하양" />
											</div>
										</label>
										
										<label for="cYellow">
											<div class="colorBox">
												<input type="checkbox" id="cYellow" name="color_class" value="노랑" />
											</div>
										</label>
										
										<label for="cOrange">
											<div class="colorBox">
												<input type="checkbox" id="cOrange" name="color_class" value="주황" />
											</div>
										</label>
										
										<label for="cPink">
											<div class="colorBox">
												<input type="checkbox" id="cPink" name="color_class" value="분홍" />
											</div>
										</label>
										
										<label for="cRed">
											<div class="colorBox">
												<input type="checkbox" id="cRed" name="color_class" value="빨강" />
											</div>
										</label>
										
										<label for="cBrown">
											<div class="colorBox">
												<input type="checkbox" id="cBrown" name="color_class" value="갈색" />
											</div>
										</label>
										
										<label for="cLightGreen">
											<div class="colorBox">
												<input type="checkbox" id="cLightGreen" name="color_class" value="연두" />
											</div>
										</label>
										
										<label for="cGreen">
											<div class="colorBox">
												<input type="checkbox" id="cGreen" name="color_class" value="초록" />
											</div>
										</label>
	
										<label for="cCyan">
											<div class="colorBox">
												<input type="checkbox" id="cCyan" name="color_class" value="청록" />
											</div>
										</label>
										
										<label for="cBlue">
											<div class="colorBox">
												<input type="checkbox" id="cBlue" name="color_class" value="파랑" />
											</div>
										</label>
										
										<label for="cNavy">
											<div class="colorBox">
												<input type="checkbox" id="cNavy" name="color_class" value="남색" />
											</div>
										</label>
										
										<label for="cPurple">
											<div class="colorBox">
												<input type="checkbox" id="cPurple" name="color_class" value="자주" />
											</div>
										</label>
										
										<label for="cViolet">
											<div class="colorBox">
												<input type="checkbox" id="cViolet" name="color_class" value="보라" />
											</div>
										</label>
										
										<label for="cGray">
											<div class="colorBox">
												<input type="checkbox" id="cGray" name="color_class" value="회색" />
											</div>
										</label>
										
										<label for="cBlack">
											<div class="colorBox">
												<input type="checkbox" id="cBlack" name="color_class" value="검정" />
											</div>
										</label>
										
										<label for="cTrans">
											<div class="colorBox">
												<input type="checkbox" id="cTrans" name="color_class" value="투명" />
											</div>
										</label>
									</td>
								</tr>
								<tr id="search_type">
									<th>제형</th>
									<td>
										<div class="typeBox">
											<label for="drugType1"> <img src="/img/drugShape/type/type01.jpg" alt="정제">
												<input type="checkbox" id="drugType1" name="form_code_name" value="정제" />
											</label>
										</div>
										
										<div class="typeBox">
											<label for="drugType2"> <img src="/img/drugShape/type/type02.jpg" alt="경질">
												<input type="checkbox" id="drugType2" name="form_code_name" value="경질" />
											</label>
										</div>
										
										<div class="typeBox">
											<label for="drugType3"> <img src="/img/drugShape/type/type03.jpg" alt="연질">
												<input type="checkbox" id="drugType3" name="form_code_name" value="연질" />
											</label>
										</div>
									</td>
								</tr>
								<tr id="search_line">
									<th>분할선</th>
									<td>
										<div class="lineBox">
											<label for="drugLine2"> <img src="/img/drugShape/line/line02.jpg" alt="+형">
												<input type="checkbox" id="drugLine2" name="line_front" value="+" />
											</label>
										</div>
										
										<div class="lineBox">
											<label for="drugLine3"> <img src="/img/drugShape/line/line03.jpg" alt="-형">
												<input type="checkbox" id="drugLine3" name="line_front" value="-" />
											</label>
										</div>
										
										<div class="lineBox lineNoneBox">
											<label for="drugLineEtc"><span class="textItem">없음</span>
												<input type="checkbox" id="drugLineEtc" name="line_front" value="기타" />
											</label>
										</div>
									</td>
								</tr>
							</table>
							<input type="submit" value="검색" />
						</form>
					</div>
				</div>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>