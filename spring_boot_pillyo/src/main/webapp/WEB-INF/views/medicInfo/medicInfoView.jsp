<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>title</title>
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
							<a href="javascript:doDisplay();">약이란?</a>
							<div id="aboutDrugBox" class="info">${aboutDrug }</div>
							<br>
							<a href="javascript:doDisplay();">일반의약품 | 전문의약품 | 안전 상비 의약품</a>
							<div id="otcEtcStcBox" class="info">${OTCETC }</div>
							<br>
							<a href="javascript:doDisplay();">일반약의 종류</a>
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
							<a href="javascript:doDisplay();">어린이 약복용시 필수 인지 사항</a>
							<div id="howToTakeMBox" class="info">${childTake }</div>
							<br>
							<a href="javascript:doDisplay();">의약품 유효기간</a>
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
							<a href="javascript:doDisplay();">가글제</a>
							<div id="gargleBox" class="info">${gargle }</div>
							<br>
							<a href="javascript:doDisplay();">관장액</a>
							<div id="enemaBox" class="info">${enema }</div>
							<br>
							<a href="javascript:doDisplay();">건조시럽제</a>
							<div id="drySyrupBox" class="info">${drySyrup }</div>
							<br>
							<a href="javascript:doDisplay();">구강붕해정</a>
							<div id="orodispersibleTabletsBox" class="info">${orodispersibleTablets }</div>
							<br>
							<a href="javascript:doDisplay();">박칼정</a>
							<div id="buccalTabletBox" class="info">${buccalTablet }</div>
							<br>
							<a href="javascript:doDisplay();">발포정</a>
							<div id="effervescentTabletBox" class="info">${effervescentTablet }</div>
							<br>
							<a href="javascript:doDisplay();">비강분무제</a>
							<div id="nasalSprayBox" class="info">${nasalSpray }</div>
							<br>
							
							<a href="javascript:doDisplay();">산제</a>
							<div id="powderBox" class="info">${powder }</div>
							<br>
							<a href="javascript:doDisplay();">설하정</a>
							<div id="sublingualTabletBox" class="info">${sublingualTablet }</div>
							<br>
							<a href="javascript:doDisplay();">액제</a>
							<div id="liquidBox" class="info">${liquid }</div>
							<br>
							<a href="javascript:doDisplay();">연고 | 크림 | 로션</a>
							<div id="oclBox" class="info">${OCL }</div>
							<br>
							<a href="javascript:doDisplay();">점비제 (코)</a>
							<div id="nasalDropsBox" class="info">${nasalDrops }</div>
							<br>
							<a href="javascript:doDisplay();">점안제</a>
							<div id="eyeDropsBox" class="info">${eyeDrops }</div>
							<br>
							<a href="javascript:doDisplay();">점이제 (귀)</a>
							<div id="earDropsBox" class="info">${earDrops }</div>
							<br>
							
							<a href="javascript:doDisplay();">정제 및 캡슐제</a>
							<div id="tcBox" class="info">${TC }</div>
							<br>
							<a href="javascript:doDisplay();">질 좌제 (질정)</a>
							<div id="pessaryBox" class="info">${pessary }</div>
							<br>
							<a href="javascript:doDisplay();">츄어블정</a>
							<div id="chewableTabletBox" class="info">${chewableTablet }</div>
							<br>
							<a href="javascript:doDisplay();">패취제</a>
							<div id="patchBox" class="info">${patch }</div>
							<br>
							<a href="javascript:doDisplay();">정량식 흡입제 (Metered Dose Inhaler)</a>
							<div id="mdiBox" class="info">${MDI }</div>
							<br>
							<a href="javascript:doDisplay();">건조분말 흡입제 (Dry Powder Inhaler)</a>
							<div id="dpiBox" class="info">${DPI }</div>
							<br>
							<a href="javascript:doDisplay();">항문 좌제 (좌약)</a>
							<div id="suppositoryBox" class="info">${suppository }</div>
						</div>
					</div>
				</div>
				<div>
					
				</div>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>