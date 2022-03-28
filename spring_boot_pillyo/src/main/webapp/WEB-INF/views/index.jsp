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
				anchors:['first', 'second', 'third', 'fourth', 'five'],
				navigation: true,
				navigationPosition: 'right',
				navigationTooltips: ['메인', '건강관리', '상비약 관리', '복용관리', '시작하기'],
				/* sectionsColor : ['#e94848', '#F4EEE7', '#F4EEE7', '#F4EEE7'], */
				showActiveTooltip: true,
				sectionSelector: '.section',
				slideSelector: '.slide',
				slideNavigation: false,
				});
			});

		</script>
		<style>
			.main-Content {
				margin: 15px;
			    padding: 10px;
			    display: flex;
			    color: black;
			    border-radius: 30px;
			    cursor: pointer;
			    text-align: center;
			}
			 
			.main-Text {
			    font-size: 25px;
			    text-align: left;
			    line-height: 60px;
			    color: #464646;
			}
			
			.main-Text h3 {
				    font-size: 40px;
    text-align: left;
    font-weight: 500;
    line-height: 75px;
    color: #333;
			}
			
			.content-Img {
			    width: 637px;
			    margin-top: 130px;
			    height: 585px;
/* 			    margin: 15px;
			    padding: 10px; */
			    display: flex;
			    color: black;
			    background-color: #ffffffcf;
			    box-shadow: 0 2px 23px 0 rgb(211 211 211 / 52%);
			    border-radius: 30px;
			    cursor: pointer;
			    text-align: center;
			    margin-top: 55px;
			    display: flex;
			    flex-direction: row;
			    justify-content: center;
			    align-items: center;
			}
			
			.content-Img img {
			    width: 100%;
			    height: 90%;
			}
			
		</style>
	
	</head>
<body>

<jsp:include page="/WEB-INF/views/layout/indexTop.jsp"/>
<div id="fullpage">
	<div class="section active" id="section0">
		<div class="container1 row">
			<div class="Main">
	 		 	
	 		 </div>
		</div>
	</div>
<!--  	<div class="section" id="section1">
		<div class="container2 row">
			<div class="content-Box calum">
					<h1 class="text">가족들의 건강관리를 한번에</h1>
			</div>
		</div>
	</div> -->
	
	<div class="section low" id="section2">
		<div class="container3 row">
			<div class="content-Box row">
				<div class="main-Content calum" style="margin-right: 40px;">
					<div class="main-Text" style="margin-bottom: 200px;">
						<h3>가족 구성원의 건강까지<br>
						한 계정에서 한번에,<br>
						그래프로 간편하게</h3>
						<p>체형부터 혈압, 혈당, 기분까지<br>
						가족 구성원을 추가하고 우리 가족의 건강정보를<br>
						그래프로 보기 쉽게 관리하세요.</p>
					</div>

				</div>
				
				<div class="content-Img">
					<img src="<c:url value='/img/health.jpg'/>"/>
				</div>
			</div>
		</div>
	</div>
	
	<div class="section low" id="section3" style="justify-content: right;">
		<div class="container3 row" style="    background: #fdfaf8;">
		
			<div class="content-Img">
				<img src="<c:url value='/img/homeM.jpg'/>"/> 
			</div>
			
			<div class="main-Content calum">
					<div class="main-Text" style="text-align:right">
						<h3  style="text-align:right; margin-top: 250px;">
						우리집에 있는 상비약<br>
						사용기한, 위치메모<br>
						꼼꼼하게</h3>
						<p>텍스트 자동 추출 기능을 통해<br>
						이미지를 업로드하여 편리하게 등록할 수 있어요.</p>
					</div>

				</div>
				
			</div>
	
		</div>
	
	
	<div class="section low" id="section4" style="justify-content: right;">
		<div class="container3 row">
			<div class="content-Box row">
				<div class="main-Content calum">
					<div class="main-Text">
						<h3>먹고 있는 약 등록하고<br>
						매일매일 복용 습관 만들기<br></h3>
						<p>캘린더를 통해 복용하는 약과 주기를 매일 체크해보세요.
						<br>카카오톡으로 복용 정보 공유도 가능해요.</p>
					</div>

				</div>
				
				<div class="content-Img">
					<img src="<c:url value='/img/drug.jpg'/>"/>
				</div>
				
			</div> 
	
			</div>
		</div>
	
	
		
	<div class="section" id="section5">
		<div class="container2 row" style="    background: #fdfaf8;">
			<div class="content-Box3">
				<h2 class="content-Title">건강관리의 첫 걸음,<br>Pill-Yo 와 함께 시작하세요</h2>
				<a href="<c:url value = '/loginForm'/>"><button class="content-Box3-Btn">시작하기</button></a>
			</div>
		</div>
	</div>
	
	
</div>


<!-- <script>
// 타이핑 함수
	window.addEventListener('scroll', function(){
	 	console.log(window.scrollY)
	 });

	let text = document.getElementsByClassName('text')[0];
	
	let textArr = ['내 건강관리, 가족의 건강관리', '우리의 건강관리를 위해 꼭 필요한 서비스, Pill-Yo<br>필요와 함께라면<br> 당신의 일상이 건강해질 거예요.']
	
	let typewriter = new Typewriter(text, {
	    loop: true
	});
	
	for(let i=0; i<textArr.length; i++) {
		typewriter.typeString(textArr[i])
	    .pauseFor(600)
	    .deleteAll()
	    .start()
	}
	

</script> -->

</body>
</html>
