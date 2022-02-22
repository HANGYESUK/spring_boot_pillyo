<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>title</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<style>
			ul li{
				list-style: none;
			}
			
			.info {
				display:none;
			}
					
		</style>
		<script>
			function doDisplay(){
				var infoBox = document.getElementsByClassName("info");
				for( var i = 0; i < infoBox.length; i++ ){
					var infoItem = infoBox.item(i);
					
					if(infoItem.style.display=='block'){
						infoItem.style.display = 'none';
					}else{
						infoItem.style.display = 'block';
					}
				}
			}
		</script>
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<section>
			<a href="crawlerView">크롤링뷰</a>
			<br><br>
			
			<a href="crawling">크롤링하기</a>
			<hr>
			
			<div id="dropdownInfo">
			
				<!-- 1 -->
				<div id="genericMedicineInfoBox">
					<h1>1. 일반 의약품 안내</h1>
					<a href="javascript:doDisplay();">약이란?</a>
					<div id="aboutDrugBox" class="info">${aboutDrug }</div>
					<br>
					<a href="javascript:doDisplay();">일반의약품 | 전문의약품 | 안전 상비 의약품</a>
					<div id="otcEtcStcBox" class="info">${OTCETC }</div>
					<br>
					<a href="javascript:doDisplay();">일반약의 종류</a>
					<div id="typeOfDrugBox" class="info">${typeOfDrug }</div>
					<hr>
				</div>
					
				<!-- 2 : 의약품 : medicine -->
				<div id="howToTakeMBox">
					<h1>2. 의약품 복용법</h1>
					<a href="javascript:doDisplay();">어린이 약복용 (약물을 복용 전 반드시 알아야 하는 내용)</a>
					<div id="howToTakeMBox" class="info">${childTake }</div>
					<br>
					<a href="javascript:doDisplay();">의약품 유효기간</a>
					<div id="drugExpirationBox" class="info">${drugExpiration }</div>
				</div>
				<hr>
				
				<!-- 3 : 외용약 : medicine for external use-->
				<div id="howToTakeMEBox">
					<h1>3. 외용약 사용법</h1>
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
					<a href="javascript:doDisplay();">연고, 크림, 로션</a>
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
					
					<a href="javascript:doDisplay();">정제(tablet), 캡슐제(capsules)</a>
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
					<a href="javascript:doDisplay();">흡입제 (에어로졸) : 정량식흡입제(MDI, Metered Dose Inhaler)</a>
					<div id="mdiBox" class="info">${MDI }</div>
					<br>
					<a href="javascript:doDisplay();">흡입제 (터부할러) : 건조분말흡입제(DPI, Dry Powder Inhaler)</a>
					<div id="dpiBox" class="info">${DPI }</div>
					<br>
					<a href="javascript:doDisplay();">항문 좌제 (좌약)</a>
					<div id="suppositoryBox" class="info">${suppository }</div>
					<br>
				</div>
			</div>
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>