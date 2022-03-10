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
				navigationTooltips: ['메인', '인사', '건강관리', '상비약 관리', '복용관리', '시작하기'],
				// sectionsColor : ['#fffa65', '#ff9f1a', '#7d5fff', '#17c0eb'],
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
				font-size: 65px;
			    text-align: left;
			    font-weight: bold;
			    line-height: 75px;
			    color: black;
			}
			
			.content-Img {
			    width: 640px;
			    margin-top: 130px;
			    height: 640px;
			    margin: 15px;
			    padding: 10px;
			    display: flex;
			    color: black;
			    background-color: white;
			    box-shadow: 0 8px 32px 0 rgb(56 117 255 / 37%);
			    border-radius: 30px;
			    cursor: pointer;
			    text-align: center;
			    margin-top: 20px;
			    display: flex;
			    flex-direction: row;
			    justify-content: center;
			    align-items: center;
			}
			
			.content-Img img {
			    width: 100%;
			    height: 70%;
			}
			
		</style>
	
	</head>
<body>

<jsp:include page="/WEB-INF/views/layout/indexTop.jsp"/>
<div id="fullpage">
	<div class="section active" id="section0">
		<div class="container1 row">
			<div class="Main">
	 		 	<h1>Pill-Yo</h1>
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
				<div class="main-Content calum">
					<div class="main-Text" style="margin-bottom: 200px;">
						<h3>건강관리,<br>
						가족들의 건강까지<br>
						간편하게</h3><br>
						체형부터 혈압, 혈당, 기분까지<br>
						가족 구성원을 추가하고<br>
						우리 가족의 건강정보를 그래프로 보기 쉽게 관리하세요.<br>
					</div>

				</div>
				
				<div class="content-Img">
					<img src="/img/HealthMg.jpg"/>
				</div>
			</div>
		</div>
	</div>
	
	<div class="section low" id="section3" style="justify-content: right;">
		<div class="container3 row">
		
			<div class="content-Img">
					
			</div>
			
			<div class="main-Content calum">
					<div class="main-Text" style="text-align:right">
						<h3  style="text-align:right; margin-top: 230px;">상비약 관리,<br>
						우리집에 있는 상비약<br>
						사용기한, 위치메모<br>
						꼼꼼하게</h3><br>
						텍스트 자동 추출 기능을 통해<br>
						이미지를 업로드하여 편리하게 등록할 수 있어요.
					</div>

				</div>
				
			</div>
	
		</div>
	
	
	<div class="section low" id="section4" style="justify-content: right;">
		<div class="container3 row">
			<div class="content-Box row">
				<div class="main-Content calum">
					<div class="main-Text" style="margin-bottom: 220px;">
						<h3>먹고 있는 약 등록하고<br>
						매일매일 복용 습관 만들기<br></h3>
						<br>
						캘린더를 통해 복용하는 약과
						<br>복용 주기를 매일 체크해보세요.
						<br>복용 알림도 카카오톡 공유 가능!
					</div>

				</div>
				
				<div class="content-Img">
					
				</div>
				
			</div> 
	
			</div>
		</div>
	
	
		
	<div class="section" id="section5">
		<div class="container2 row">
			<div class="content-Box3">
				<h2 class="content-Title">건강관리의 첫걸음,<br>지금 바로 시작하세요</h2>
				<br><a href="<c:url value = '/loginForm'/>"><button class="content-Box3-Btn">시작하기</button></a>
			</div>
		</div>
	</div>
	
	
</div>


<script>
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
	

</script>

</body>
</html>
