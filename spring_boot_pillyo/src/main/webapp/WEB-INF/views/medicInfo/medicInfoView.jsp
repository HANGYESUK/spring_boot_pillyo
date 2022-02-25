<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>의약 정보 제공 페이지</title>
		<link rel="stylesheet" href="/css/medicInfo/medicInfo.css" />
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='/js/medicInfo/medicInfo.js'/>"></script>
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
							<h2>약이란?</h2>
							<div id="aboutDrugBox" class="info">${aboutDrug }</div>
							<br>
							<h2>일반의약품 | 전문의약품 | 안전 상비 의약품</h2>
							<div id="otcEtcStcBox" class="info">${OTCETC }</div>
							<br>
							<h2>일반약의 종류</h2>
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
							<h2>어린이 약복용시 필수 인지 사항</h2>
							<div id="howToTakeMBox" class="info">${childTake }</div>
							<br>
							<h2>의약품 유효기간</h2>
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
							<h2>가글제</h2>
							<div id="gargleBox" class="info">${gargle }</div>
							<br>
							<h2>관장액</h2>
							<div id="enemaBox" class="info">${enema }</div>
							<br>
							<h2>건조시럽제</h2>
							<div id="drySyrupBox" class="info">${drySyrup }</div>
							<br>
							<h2>구강붕해정</h2>
							<div id="orodispersibleTabletsBox" class="info">${orodispersibleTablets }</div>
							<br>
							<h2>박칼정</h2>
							<div id="buccalTabletBox" class="info">${buccalTablet }</div>
							<br>
							<h2>발포정</h2>
							<div id="effervescentTabletBox" class="info">${effervescentTablet }</div>
							<br>
							<h2>비강분무제</h2>
							<div id="nasalSprayBox" class="info">${nasalSpray }</div>
							<br>
							
							<h2>산제</h2>
							<div id="powderBox" class="info">${powder }</div>
							<br>
							<h2>설하정</h2>
							<div id="sublingualTabletBox" class="info">${sublingualTablet }</div>
							<br>
							<h2>액제</h2>
							<div id="liquidBox" class="info">${liquid }</div>
							<br>
							<h2>연고 | 크림 | 로션</h2>
							<div id="oclBox" class="info">${OCL }</div>
							<br>
							<h2>점비제 (코)</h2>
							<div id="nasalDropsBox" class="info">${nasalDrops }</div>
							<br>
							<h2>점안제</h2>
							<div id="eyeDropsBox" class="info">${eyeDrops }</div>
							<br>
							<h2>점이제 (귀)</h2>
							<div id="earDropsBox" class="info">${earDrops }</div>
							<br>
							
							<h2>정제 및 캡슐제</h2>
							<div id="tcBox" class="info">${TC }</div>
							<br>
							<h2>질 좌제 (질정)</h2>
							<div id="pessaryBox" class="info">${pessary }</div>
							<br>
							<h2>츄어블정</h2>
							<div id="chewableTabletBox" class="info">${chewableTablet }</div>
							<br>
							<h2>패취제</h2>
							<div id="patchBox" class="info">${patch }</div>
							<br>
							<h2>정량식 흡입제 (Metered Dose Inhaler)</h2>
							<div id="mdiBox" class="info">${MDI }</div>
							<br>
							<h2>건조분말 흡입제 (Dry Powder Inhaler)</h2>
							<div id="dpiBox" class="info">${DPI }</div>
							<br>
							<h2>항문 좌제 (좌약)</h2>
							<div id="suppositoryBox" class="info">${suppository }</div>
						</div>
					</div>
				</div>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>