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
			<a href="crawlerView3">크롤링뷰3</a>
			<br><br>
			
			<a href="crawling3">크롤링하기3</a>
			<hr>
			
			<!-- 3 -->
			<div id="howToTakeBox">
				<h1>3. 외용약 사용법</h1>
				<div id="gargleBox">
					 <h4>가글제</h4>
					 ${gargle }
				 </div>
				 
				 <div id="enemaBox">
					 <h4>관장액</h4>
					 ${enema }
				 </div>
				 
				 <div id="drySyrupBox">
					 <h4>건조시럽제</h4>
					 ${drySyrup }
				 </div>
				 
				 <div id="orodispersibleTabletsBox">
					 <h4>구강붕해정</h4>
					 ${orodispersibleTablets }
				 </div>
				 
				 <div id="buccalTabletBox">
					 <h4>박칼정</h4>
					 ${buccalTablet }
				 </div>
				 
				 <div id="effervescentTabletBox">
					 <h4>발포정</h4>
					 ${effervescentTablet }
				 </div>
				 
				 <div id="nasalSprayBox">
					 <h4>비강분무제</h4>
					 ${nasalSpray }
				 </div>

				 <div id="powderBox">
					 <h4>산제</h4>
					 ${powder }
				 </div>
				 
				 <div id="sublingualTabletBox">
					 <h4>설하정</h4>
					 ${sublingualTablet }
				 </div>
				 
				 <div id="liquidBox">
					 <h4>액제</h4>
					 ${liquid }
				 </div>
				 
				 <div id="oclBox">
					 <h4>연고(Ointment), 크림, 로션</h4>
					 ${OCL }
				 </div>
				 
				 <div id="nasalDropsBox">
					 <h4>점비제 (코)</h4>
					 ${nasalDrops }
				 </div>
				 
				 <div id="eyeDropsBox">
					 <h4>점안제</h4>
					 ${eyeDrops }
				 </div>
				 
				 <div id="earDropsBox">
					 <h4>점이제 (귀)</h4>
					 ${earDrops }
				 </div>
		
				<div id="tcBox">
					 <h4>정제(tablet), 캡슐제(capsules)</h4>
					 ${TC }
				 </div>
				 
				 <div id="pessaryBox">
					 <h4>질 좌제 (질정)</h4>
					 ${pessary }
				 </div>
				 
				 <div id="chewableTabletBox">
					 <h4>츄어블정</h4>
					 ${chewableTablet }
				 </div>
				 
				 <div id="patchBox">
					 <h4>패취제</h4>
					 ${patch }
				 </div>
				 
				 <div id="mdiBox">
					 <h4>흡입제 (에어로졸) : 정량식흡입제(MDI, Metered Dose Inhaler)</h4>
					 ${MDI }
				 </div>
				 
				 <div id="dpiBox">
					 <h4>흡입제 (터부할러) : 건조분말흡입제(DPI, Dry Powder Inhaler)</h4>
					 ${DPI }
				 </div>
				 
				 <div id="suppositoryBox">
					 <h4>항문 좌제 (좌약)</h4>
					 ${suppository }
				 </div>
				 <hr>
			</div>
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>