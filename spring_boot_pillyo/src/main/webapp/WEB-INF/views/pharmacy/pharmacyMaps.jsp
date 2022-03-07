<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>내 주변 약국 및 편의점</title>
		<link rel="stylesheet" href="/css/pharmacy/pharmacy.css" />
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3bc39226c10ad1e0663733a444b7b1d&libraries=services,clusterer"></script>
		<script src="<c:url value='/js/pharmacy/pharmacy.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
				<div id="mapHeader">
					<h1>내 주변 약국 찾기</h1>
					<h5><a href="https://www.pharm114.or.kr/common_files/sub1_page1.asp">> 휴일지킴이 약국 검색 바로가기</a></h5>
				</div>
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				</div>
				<div id="category"> 
			        <div id="PM9" class="ctgBtn" data-order="0">
		            	<!-- <img id="pharmBtnImg" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fd8tiI8%2FbtrveKTW48o%2FhqxQYitUxsLXEL86byZpZ0%2Fimg.png" alt="약국" /> -->
			            <button class="pharmBtn" type="button">
					        <span class="shadow"></span>
					        <span class="edge"></span>
					        <span class="front">약국</span>
					    </button>
			        </div>
			        <div id="CS2" class="ctgBtn" data-order="1"> 
		            	<!-- <img id="storeBtnImg" src="https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FsWwKT%2Fbtru9Q8UsCU%2FDf4pdLj5Xt5cknb2PkBY10%2Fimg.png" alt="편의점" /> -->
			            <button class="storeBtn" type="button">
					        <span class="shadow"></span>
					        <span class="edge"></span>
					        <span class="front">편의점</span>
					    </button>
		        	</div> 
			    </div>
				
				<input type="hidden" id="latitude" name="latitude"/>
				<input type="hidden" id="longitude" name="longitude"/>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>