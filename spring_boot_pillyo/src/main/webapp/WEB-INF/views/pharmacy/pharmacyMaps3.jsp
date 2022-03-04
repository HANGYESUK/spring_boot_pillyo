<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>약국 정보</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b3bc39226c10ad1e0663733a444b7b1d&libraries=services,clusterer"></script>
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
				<div id="pharMap" style="width:100%;height:350px;"></div>
				<input type="text" id="latitude" name="latitude" value=""/>
				<input type="number" id="longitude" name="longitude" value=""/>
				<script>
					window.onload = function() {

							if (navigator.geolocation) { // GPS를 지원하면
								navigator.geolocation.getCurrentPosition(function(position) {
									alert("위치 지원");
									var geoArr = [position.coords.latitude, position.coords.longitude];
									console.log("yes  " + geoArr[0]);
								  	console.log("yes  " + geoArr[1]);
								  	
								  	document.getElementById("latitude").value=(geoArr[0]);
								  	document.getElementById("longitude").value=(geoArr[1]);
								  	
								  	
// map -----------------------------------------------------------------------------------------------------------------------------

								 	// ---------------------- 지도 생성 ------------------------
								 	// 지도를 표시할 div
								  	var mapContainer = document.getElementById('pharMap');
								 	
								  	// 사용자의 현재 위도 경도 얻어와 지도 initial view로 설정
								  	var lat = document.getElementById("latitude").value;
									var lon = document.getElementById("longitude").value;
									console.log("위도경도 타입 확인 : lat : " + typeof lat + " lon : " + typeof lon);
									console.log("위도경도 값 확인 : lat : " + lat + " lon : " + lon);
									console.log(document.getElementById("latitude").value);
									
									// 위도경도 형변환
									lat = parseFloat(lat);
									lon = Number(lon);
									console.log("위도경도 타입 확인 : lat : " + typeof lat + " lon : " + typeof lon);
									console.log("위도경도 값 확인 : lat : " + lat + " lon : " + lon);
									
									// 지도의 중심좌표 및 확대 레벨 설정
									var mapOption = { center: new kakao.maps.LatLng(lat, lon), level: 3 };
									
									// 지도 생성
									var pharMap = new kakao.maps.Map(mapContainer, mapOption);
									
									
									// ---------------------- 컨트롤 추가 ------------------------
									// 일반/스카이뷰 지도 타입 전환 컨트롤 생성
									var mapTypeControl = new kakao.maps.MapTypeControl();
									
									// 지도에 컨트롤 추가 (컨트롤 표시 위치 : TOPRIGHT = 오른쪽 위)
									pharMap.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
									
									// 확대/축소 제어 가능한 줌 컨트롤 생성
									var zoomControl = new kakao.maps.ZoomControl();
									pharMap.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
								  	
									
									
									
									
									
									
									
									
									// ----------------------------------------------------------
									
									
									
									
									
									
									
				/* 					// ---------------------- 마커 단일 ------------------------
									// 마커 표시 위치
									var markerPosition = new kakao.maps.LatLng(33.450701, 126.570667);
				
									// 마커 생성
									var marker = new kakao.maps.Marker({
										position: markerPosition
									});
									
									// 마커가 지도 위에 표시되도록 설정
									marker.setMap(pharMap); */
									
									// ---------------------- 마커 여러개 ------------------------
									// 마커 표시 위치 ------------------------------------------------------ 약국 DB와 연결 ?
									var position = [
									new kakao.maps.LatLng(33.450705, 126.570677),
									new kakao.maps.LatLng(33.450936, 126.569477),
									new kakao.maps.LatLng(33.450879, 126.569940),
									new kakao.maps.LatLng(33.451393, 126.570738)
									];
				
									// 마커 생성
									for (var i = 0; i < position.length; i++) {
										var marker = new kakao.maps.Marker({
											map: pharMap,
											position: position[i]
										});
									}
									
									// ---------------------- 마커 이미지 적용 ------------------------
									var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
									    imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
									    imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
									      
									// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
									var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
									    markerPosition = new kakao.maps.LatLng(35.8678275, 127.1365699); // 마커가 표시될 위치입니다
									
									// 마커를 생성합니다
									var marker = new kakao.maps.Marker({
									    position: markerPosition, 
									    image: markerImage // 마커이미지 설정 
									});
									
									// 마커가 지도 위에 표시되도록 설정합니다
									marker.setMap(pharMap);
									
									
									// ---------------------- 지도 범위 설정 ------------------------
				/* 					// 생성된 마커들을 기준으로 맵에서 보여주는 비율 설정
									
									// 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
									var bounds = new kakao.maps.LatLngBounds();
									
									// bounds에 좌표추가
									bounds.extend(new kakao.maps.LatLng(33.452278, 126.567803));
									bounds.extend(new kakao.maps.LatLng(33.452671, 126.574792));
									bounds.extend(new kakao.maps.LatLng(33.451744, 126.572441));
									
									// LatLngBounds 객체 좌표들 기준 지도 범위 재설정
									// 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
									pharMap.setBounds(bounds); */
									
									
								
								  	
// map -----------------------------------------------------------------------------------------------------------------------------								  	
								  	
							  	}, function(error) {
							  		console.error(error);
						  		}, { enableHighAccuracy: false,
						  			 maximumAge: 0,
						      		 timeout: Infinity
					      		});
							

								
							} else {
								alert('GPS를 지원하지 않습니다');
								geoArr[0] = 37.555926;
								geoArr[1] = 126.972335;
								console.log("no  " + geoArr[0]);
							  	console.log("no  " + geoArr[1]);
							  	document.getElementById("latitude").value=(geoArr[0]);
							  	document.getElementById("longitude").value=(geoArr[1]);
							  	
							  	var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
							        message = 'geolocation을 사용할수 없어요..'
							        
							    displayMarker(locPosition, message);
							}
					}; // onload 종료
				</script>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>