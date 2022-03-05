<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>약국 정보</title>
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
				<div class="map_wrap">
				    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
				    <ul id="category"> 
				        <li id="PM9" data-order="2"> 
				            <span class="category_bg pharmacy"></span>
				            약국
				        </li>  
				        <li id="CS2" data-order="5"> 
				            <span class="category_bg store"></span>
				            편의점
				        </li>      
				    </ul>
				</div>
				<input type="hidden" id="latitude" name="latitude"/>
				<input type="hidden" id="longitude" name="longitude"/>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>