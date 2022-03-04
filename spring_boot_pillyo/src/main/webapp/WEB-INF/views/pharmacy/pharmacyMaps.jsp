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
		<style>
    .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}
</style>
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
			    <div id="pharMap" style="width:1100px;height:660px;"></div>

			    
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
									
									
									// ---------------------- 마커 ------------------------
									// 단일 마커 표시 
									/* var marker = new kakao.maps.Marker({
									    map: pharMap, 
									    position: new kakao.maps.LatLng(lat, lon)
									}); */
									
									// ----- 마커 여러개
									// 마커를 표시할 위치와 title 객체 배열입니다 
									var positions = [
									    { title: '카카오', latlng: new kakao.maps.LatLng(33.450705, 126.570677) },
									    { title: '생태연못', latlng: new kakao.maps.LatLng(33.450936, 126.569477) },
									    { title: '텃밭', latlng: new kakao.maps.LatLng(33.450879, 126.569940) },
									    { title: '근린공원', latlng: new kakao.maps.LatLng(33.451393, 126.570738) }
									];
									
									// 마커 이미지의 이미지 주소입니다
									var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
									
									for (var i = 0; i < positions.length; i ++) {
									    
									    // 마커 이미지의 이미지 크기 입니다
									    var imageSize = new kakao.maps.Size(24, 35); 
									    
									    // 마커 이미지를 생성합니다    
									    var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
									    
									    // 마커를 생성합니다
									    var marker = new kakao.maps.Marker({
									        map: pharMap, // 마커를 표시할 지도
									        position: positions[i].latlng, // 마커를 표시할 위치
									        title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
									        image : markerImage // 마커 이미지 
									    });
									}
									
									// ---------------------- 커스텀 오버레이 ------------------------
									// 커스텀 오버레이에 표시할 컨텐츠 입니다
									// 커스텀 오버레이는 아래와 같이 사용자가 자유롭게 컨텐츠를 구성하고 이벤트를 제어할 수 있기 때문에
									// 별도의 이벤트 메소드를 제공하지 않습니다 
									var content = '<div class="wrap">' + 
									            '    <div class="info">' + 
									            '        <div class="title">' + 
									            '            카카오 스페이스닷원' + 
									            '        </div>' + 
									            '        <div class="body">' + 
									            '            <div class="img">' +
									            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
									            '           </div>' + 
									            '            <div class="desc">' + 
									            '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
									            '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
									            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
									            '            </div>' + 
									            '        </div>' + 
									            '    </div>' +    
									            '</div>';

									// 마커 위에 커스텀오버레이를 표시합니다
									// 마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
									var overlay = new kakao.maps.CustomOverlay({
									    content: content,
									    map: pharMap,
									    position: marker.getPosition()       
									});
									
									var clickM = 0;
									overlay.setMap(null);
									
									// 마커를 클릭했을 때 커스텀 오버레이를 표시합니다
									kakao.maps.event.addListener(marker, 'click', function() {
										if (clickM==0) {
											overlay.setMap(pharMap);
											clickM = 1;
										} else if (clickM==1) {
											overlay.setMap(null); 
											clickM = 0;
										}
									    
									});
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
							}
					}; // onload 종료
				</script>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>