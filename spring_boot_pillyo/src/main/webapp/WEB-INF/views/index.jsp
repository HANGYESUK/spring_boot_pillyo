<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>Pill-Yo - 통합 건강관리 서비스</title>
		<meta name="author" content="Alvaro Trigo Lopez" />
		<meta name="description" content="fullPage very simple demo." />
		<meta name="keywords"  content="fullpage,jquery,demo,simple" />
		
		<meta name="Resource-type" content="Document" />
	
	
		<link rel="stylesheet" href="/css/main/jquery.fullPage.css" />
		<link rel="stylesheet" href="/css/main/examples.css" />
		<link rel="stylesheet" href="/css/main/dashboard.css" />
		<link rel="stylesheet" href="/css/main/dashboard2.css" />
		<link rel="stylesheet" href="/css/main/test.css" />
		
	
		<!-- 구글폰트 -->
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
		
		<!-- 차트js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
		
		<!-- 타이핑js -->
		<script src="https://unpkg.com/typewriter-effect@latest/dist/core.js"></script>
		
		<script src="https://kit.fontawesome.com/cc2482b5e0.js" crossorigin="anonymous"></script>
		
		<!-- 제이쿼리 -->
		<script src="/js/jquery.fullPage.js"></script>
	
		<script>
			$(document).ready(function() {
				$('#fullpage').fullpage({
				autoScrolling: true,
				scrollHorizontally: true,
				lockAnchors: false,
				anchors:['first', 'second', 'third', 'fourth'],
				navigation: true,
				navigationPosition: 'right',
				navigationTooltips: ['메인', '인사', '서비스 소개'],
				// sectionsColor : ['#fffa65', '#ff9f1a', '#7d5fff', '#17c0eb'],
				showActiveTooltip: true,
				sectionSelector: '.section',
				slideSelector: '.slide',
				slideNavigation: false,
				});
			});

		</script>
	
	<style>
		.back{
	background-image: url(image/pillyo12.png);
    width: 1920px;
    height: 1200px;
    background-repeat: no-repeat;
    background-size: cover;
			}
		.back :hover{
			
		}
		.back > img{
			width:100px;
		}
		h2{
			font-size: 53px;
    height: 105px;
    padding-top: 508px;
    font-weight: 100;
		}
		
		.Union-Text2{
		    color: #444;
    padding-top: 181px;
    margin-top: -492px;
    color: black;
    border-top: 13px;
    text-align: left;
    font-size: 50px;
    margin-left: -237px;
		}
		.Union-Text2 > a{
		font-size: 21px;
    opacity: 55%;
		}
		.Union-Text3{
		color: #444;
	       padding-top: 280px;
    color: black;
    border-top: 13px;
    text-align: right;
    font-size: 50px;
    margin-right: -220px;
    margin-top: -492px;
		}
		.Union-Text3 > a{
		font-size: 21px;
    opacity: 55%;
		}
		
		.Union-Text4{
		color: #444;
		     padding-top: 900px;
    color: black;
    border-top: 13px;
    text-align: right;
    font-size: 50px;
    margin-right: -330px;
    margin-top: -435px;
		}
	</style>
	</head>
<body>

<jsp:include page="/WEB-INF/views/layout/indexTop.jsp"/>
<div id="fullpage">
	<div class="section active" id="section0">
		<div class="container1 row">
			<div class="Ellipse-1"></div>
			<div class="Ellipse-2"></div>
			<div class="Ellipse-3"></div>
	 		 <h1 style="position: absolute; ">Pill-Yo</h1>
	 		 
 		<!-- 	<div style="background-image:url(image/pillyo3.jpg);"></div> -->
 		 
			<div class="back">
			<h2>건강의 모든 것<br>
			알약요에서 쉽고 간편하게</h2>
			</div> 
		</div>
	</div>
	<div class="section" id="section1">
		<div class="container2 row">
			<div class="content-Box calum">
				<h1 class="text">가족들의 건강관리를 한번에</h1>
			</div>
		</div>
	</div>
	<div class="section low" id="section2">
		<div class="container3 row">
			<div class="content-Box row">
				<div class="Union">
					<i class="fa-solid fa-house-chimney-medical"style="color:#444"></i>
					<h2 class="Union-Title">건강관리</h2>
					<p class="Union-Text">가족들의 건강관리를 대쉬보드로 한번에</p>
				</div>
				<div class="Union">
					<i class="fa-solid fa-suitcase-medical" style="color:#444"></i>
					<h2 class="Union-Title">상비약 관리</h2>
					<p class="Union-Text">우리집에 있는 상비약의 유통기한과 위치메모</p>
				</div>
				<div class="Union">
					<i class="fa-solid fa-pills" style="color:#444"></i>
					<h2 class="Union-Title">복용관리</h2>
					<p class="Union-Text">하루의 섭취하는 약들을 관리하고 매일매일 복용 습관 만들기 </p>
				</div>
			</div>
		</div>
	</div>
	<div class="section low" id="section3">
		<div class="container3 row"style="width: 100%; margin-left: -90px;">
			<div class="content-Box row">
				<div class="Union" style="   
					width: 700px;
				    margin-top: 130px;
				    height: 640px;">
				<p class="Union-Text2">
					건강관리,<br>
					가족들의 건강까지<br>
					간편하게
				<br><a>가족들의 건강 이젠 한번에 관리하세요.</a></p>	
				</div>
				
				<div class="Union"  
			
				style="min-width: 200px;
			    width: 400px;
			    height: 400px;
			    background-image: url(image/pillyo6.png);
			    background-size: 400px 400px;
			        
        ">
					
				</div>
			</div>
		</div>
	</div>
	
	<div class="section low" id="section4" style="justify-content: right;">
		<div class="container3 row"style="    width: 100%;
    display: flex;
    margin-left: -90px;
    align-items: flex-end;
    justify-content: flex-end;">
			<div class="content-Box row" style="justify-content: right;">
				<div class="Union"  
			
	style="min-width: 200px;
    width: 400px;
    height: 400px;
        margin-top: 333px;
        background-image:url(image/pillyo7.png);
        background-size: 400px 400px;
        
        ">
					
				</div>
				<div class="Union" style="    /* float: right; */
    width: 700px;
    /* margin-left: 20px; */
    margin-top: 130px;
    height: 650px;
    margin-right: 90px;
    ">
				<p class="Union-Text3">
					상비약 관리,<br>
					우리집에 있는 상비약<br>
					유통기한, 위치메모<br>
					꼼꼼하게
					
					<br><a>집에 있는 상비약 <br>쉽고 간편하게 등록하고 관리할 수 있어요.</a>
					
					
					</p>
				</div>
				
				
			</div>
		</div>
	</div>
	
	
	
	<div class="section low" id="section4" style="justify-content: right;">
		<div class="container3 row"style="    width: 100%;
    display: flex;
    margin-left: -90px;
    align-items: flex-end;
    justify-content: flex-end;">
			<div class="content-Box row" style="justify-content: center;">
				<<!-- div class="Union"  
			
	style="min-width: 200px;
    width: 300px;
    height: 300px;
        margin-top: 333px;
        background-image:url(image/pillyo1.jpg);
        background-size: 300px 300px;
        
        ">
					
				</div> -->
				<div class="Union" style="    width: 900px;
    margin-top: 90px;
    height: 800px;">
				<p class="Union-Text4">
					복용관리,<br>
					하루 복용하는 약 관리<br>
					복용 습관 만들기까지<br>
					매일매일
					
					
					</p>
				</div>
				
				
			</div>
		</div>
	</div>		
	
	
		
	<div class="section" id="section5">
		<div class="container2 row">
			<div class="content-Box3">
				<h2 class="content-Title" style="text-weight:100;     margin-top: -500px;">건강관리의 첫걸음,<br>지금 바로 시작하세요</h2>
				<br><a href="<c:url value = '/loginForm'/>"><button class="content-Box3-Btn"><!-- ↪ -->
<!-- &#10553; -->
&#10551;
</button></a>
			</div>
		</div>
	</div>
	
	<div class="section" id="section6">
					<section>
				<a href="<c:url value = '/loginForm'/>">로그인</a>
				<a href="<c:url value = '/join'/>">회원가입</a>
				<a href="<c:url value = '/famInsertForm'/>">가족 등록 폼</a>
				<a href="<c:url value = '/famListView'/>">가족 목록 리스트</a>
				
				<br><br><br><br><br><br>
				<a href="<c:url value = '/feelManageForm'/>">기분관리</a>
				<a href="<c:url value = '/hmForm'/>">우리집 약관리</a>	
				<a href="<c:url value = '/clovaOCRForm'/>">OCR테스트</a>	
				
				<br><br><br><br><br><br>
				혈당관리
				<a href="<c:url value = '/sugarForm'/>">혈당등록</a>
				<a href="<c:url value = '/listAllSugar'/>">혈당리스트</a>
				
				<br><br><br><br><br><br>
				혈압관리
				<a href="<c:url value = '/pressureForm'/>">혈압등록</a>
				<a href="<c:url value = '/listAllPressure'/>">혈압리스트</a>
				
				<br><br>
				<a href="<c:url value = '/join'/>">회원가입</a>
	
				<a href="<c:url value = '/bodyForm'/>">체형관리정보 등록 </a>
				<a href="<c:url value = '/listAllBody'/>">체형 관리 정보 리스트</a>
				
				<br><br><br><br>
				<a href="<c:url value = '/dashboard'/>">대쉬보드</a><br>
				<a href="<c:url value = '/dashboard2'/>">대쉬보드 연습중...</a>
				<a href="<c:url value = '/dashboardtest'/>">대쉬보드 연습중...2</a>
				<a href="<c:url value = '/dashboardtest'/>">대쉬보드 연습중...2</a>

				<a href="<c:url value = '/boardList'/>">페이징 연습중</a>
				
				<br><br><br><br>
				<a href="<c:url value = '/listAllComment'/>">댓글 연습중</a>
				
				<br><br>
				<a href="<c:url value = '/pharmacy'/>">약국지도</a><br>
				<a href="<c:url value = '/pharmacySearch'/>">지역검색API</a><br>
				<a href="<c:url value = '/insertDrugList'/>">API 약 정보 db 저장</a><br>
				<a href="<c:url value = '/drugShape'/>"> 약 낱알정보 API 테스트</a><br>
				<a href="<c:url value = '/drugShapeSearchForm'/>"> 약 낱알정보 검색폼</a><br>
				<br><br><br><br>
				
				<a href="<c:url value = '/doseInsertForm'/>">복용 관리 - 등록 폼</a>
				<a href="<c:url value = '/doseListView'/>">복용 목록 조회</a>
			</section>
	</div>
</div>


<script>
// 타이핑 함수
	window.addEventListener('scroll', function(){
	 	console.log(window.scrollY)
	 });

	let text = document.getElementsByClassName('text')[0];
	
	let textArr = ['내 건강관리, 가족의 건강관리', '당신의 건강관리를 위해 꼭 필요한 서비스, Pill-Yo<br>필요와 함께라면<br> 당신의 일상이 건강해질 거예요.']
	
	let typewriter = new Typewriter(text, {
	    loop: true
	});
	
	for(let i=0; i<textArr.length; i++) {
		typewriter.typeString(textArr[i])
	    .pauseFor(600)
	    .deleteAll()
	    .start()
	}
	

</script>

</body>
</html>
