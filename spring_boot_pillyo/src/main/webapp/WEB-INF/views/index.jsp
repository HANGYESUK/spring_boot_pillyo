<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>fullPage.js A simple Demo</title>
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
				navigationTooltips: ['메인', '인사', '서비스 소개', '시작하기'],
				// sectionsColor : ['#fffa65', '#ff9f1a', '#7d5fff', '#17c0eb'],
				showActiveTooltip: true,
				sectionSelector: '.section',
				slideSelector: '.slide',
				slideNavigation: false,
				});
			});

		</script>

	</head>
<body>

<jsp:include page="/WEB-INF/views/layout/indexTop.jsp"/>
<div id="fullpage">
	<div class="section active" id="section0">
		<div class="container1 row">
			<div class="Ellipse-1"></div>
			<div class="Ellipse-2"></div>
			<div class="Ellipse-3"></div>
			<h1 style="position: absolute">Pill-Yo</h1>
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
	<div class="section" id="section3">
		<div class="container2 row">
			<div class="content-Box3">
				<h2 class="content-Title">지금 바로 시작하세요</h2>
				<button class="content-Box3-Btn">시작하기</button>
			</div>
		</div>
	</div>
	<div class="section" id="section4">
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
				
				<br><br><br><br>
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
	
	let textArr = ['안녕하세요', '당신의 건강관리를 위해 꼭 Pill-yo한 서비스, Pill-Yo 입니다!']
	
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
<script type="text/javascript">
	var context = document
		.getElementById('myChart')
		.getContext('2d');
	var myChart = new Chart(context, {
		type: 'line',
		data: {
			labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
			datasets: [{
				label: '# of Votes',
				data: [12, 19, 3, 5, 2, 3],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255,99,132,1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			maintainAspectRatio: true, // default value. false일 경우 포함된 div의 크기에 맞춰서 그려짐.
			scales: {
				yAxes: [{
					ticks: {
						beginAtZero:true
					}
				}]
			}
		}
	});
</script>

</body>
</html>