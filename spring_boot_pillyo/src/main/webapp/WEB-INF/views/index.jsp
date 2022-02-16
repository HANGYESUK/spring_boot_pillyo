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
	
	
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.9.1/jquery-ui.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
		
	
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
				navigationTooltips: ['인트로', '과거', '현재', '미래'],
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

<div id="fullpage">
	<div class="section active" id="section0">
		<jsp:include page="/WEB-INF/views/layout/top.jsp"/>
		<div class="container1 row">
			<div class="Ellipse-1"></div>
			<div class="Union"></div>
			<div class="Ellipse-4"></div>
			<h1>인트로</h1>
		</div>
	</div>
	<div class="section" id="section1">

			<section>
				<a href="<c:url value = '/loginForm'/>">로그인</a>
				<a href="<c:url value = '/join'/>">회원가입</a>
				<a href="<c:url value = '/famInsertForm'/>">가족 등록 폼</a>
				<a href="<c:url value = '/famListView'/>">가족 목록 리스트</a>
				<br><br><br>
				
				<!-- searchBar  -->
				<jsp:include page="/WEB-INF/views/Main/searchBar.jsp" flush='true' />
				
				<br><br><br><br><br><br>
				<a href="<c:url value = '/feelManageForm'/>">기분관리</a>	
				
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
				
				<br><br><br><br><br><br><br><br>
				<a href="<c:url value = '/dashboard'/>">대쉬보드</a>
				<br><br><br><br><br><br><br><br>
				
				<br><br><br><br><br><br><br><br>
				<a href="<c:url value = '/insertDrugList'/>">API 약 정보 db 저장</a>
				<br><br><br><br><br><br><br><br>
			</section>

	</div>
	<div class="section low" id="section2">

	</div>
	<div class="section" id="section3"><h1>미래</h1></div>
</div>

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