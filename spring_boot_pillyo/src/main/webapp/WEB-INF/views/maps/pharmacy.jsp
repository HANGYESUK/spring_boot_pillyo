<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
	    <!-- <meta http-equiv="X-UA-Compatible" content="IE=edge"> -->
	    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no"> -->
	    <title>지도</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e51c4211b0aca47d59260fd25bea4a33&libraries=services"></script>
	    <script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=ey46xzljis"></script>
	   
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
			
				<div id="map" style="width:100%;height:400px;"></div>
				 
				<script>
				// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
				var infowindow = new kakao.maps.InfoWindow({zIndex:1});

				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  

				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 

				if (navigator.geolocation) {
				    
					    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
					    navigator.geolocation.getCurrentPosition(function(position) {
					        
					        var lat = position.coords.latitude, // 위도
					            lon = position.coords.longitude; // 경도
					        
					        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
					        
					        // 마커와 인포윈도우를 표시합니다
					        displayMarker(locPosition, message);
					            
					      });
					    
					} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
					    
					    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
					        message = 'geolocation을 사용할수 없어요..'
					        
					    displayMarker(locPosition, message);
					}

					// 지도에 마커와 인포윈도우를 표시하는 함수입니다
					function displayMarker(locPosition, message) {
	
					    // 마커를 생성합니다
					    var marker = new kakao.maps.Marker({  
					        map: map, 
					        position: locPosition
					    }); 
					    
					    var iwContent = message, // 인포윈도우에 표시할 내용
					        iwRemoveable = true;
	
					    // 인포윈도우를 생성합니다
					    var infowindow = new kakao.maps.InfoWindow({
					        content : iwContent,
					        removable : iwRemoveable
					    });
					    
					    // 인포윈도우를 마커위에 표시합니다 
					    infowindow.open(map, marker);
					    
					    // 지도 중심좌표를 접속위치로 변경합니다
					    map.setCenter(locPosition);      
					}    
				
				// 장소 검색 객체를 생성합니다
				var ps = new kakao.maps.services.Places(map); 

				// 카테고리로 은행을 검색합니다
				ps.categorySearch('PM9', placesSearchCB, {useMapBounds:true}); 
				 
				
				// 키워드 검색 완료 시 호출되는 콜백함수 입니다
				function placesSearchCB (data, status, pagination) {
				    if (status === kakao.maps.services.Status.OK) {
				        for (var i=0; i<data.length; i++) {
				            displayMarker(data[i]);    
				        }       
				    }
				}

				// 지도에 마커를 표시하는 함수입니다
				function displayMarker(place) {
				    // 마커를 생성하고 지도에 표시합니다
				    var marker = new kakao.maps.Marker({
				        map: map,
				        position: new kakao.maps.LatLng(place.y, place.x) 
				    });

				    // 마커에 클릭이벤트를 등록합니다
				    kakao.maps.event.addListener(marker, 'click', function() {
				        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
				        infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
				        infowindow.open(map, marker);
				    });
				}
		
				/* 	//네이버 지도 불러오기
					var map = new naver.maps.Map('map', {
					    center: new naver.maps.LatLng(37.5666805, 126.9784147),
					    zoom: 10,
					    mapTypeId: naver.maps.MapTypeId.NORMAL
					});
	
					var infowindow = new naver.maps.InfoWindow();
	
					function onSuccessGeolocation(position) {
					    var location = new naver.maps.LatLng(position.coords.latitude,
					                                         position.coords.longitude);
	
					    map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
					    map.setZoom(10); // 지도의 줌 레벨을 변경합니다.
	
					    infowindow.setContent('<div style="padding:20px;">' + '현재 위치' + '</div>');
	
					    infowindow.open(map, location);
					    console.log('Coordinates: ' + location.toString());
					}
	
					function onErrorGeolocation() {
					    var center = map.getCenter();
	
					    infowindow.setContent('<div style="padding:20px;">' +
					        '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'+ "latitude: "+ center.lat() +"<br />longitude: "+ center.lng() +'</div>');
	
					    infowindow.open(map, center);
					}
	
					$(window).on("load", function() {
					    if (navigator.geolocation) {
					       navigator.geolocation.getCurrentPosition(onSuccessGeolocation, onErrorGeolocation);
					    } else {
					        var center = map.getCenter();
					        infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
					        infowindow.open(map, center);
					    }
					});
					
					//카카오 주변정보 받기(약국)
					var places = new kakao.maps.services.Places();
					
						var callback = function(result, status) {
						    if (status === kakao.maps.services.Status.OK) {
						        console.log(result);
						    }
						};

						places.keywordSearch('약국', callback);
						
						
						const SearchFacility = (e)=>{

						      const {kakao}= window;
						      var infowindow = new kakao.maps.InfoWindow({zIndex:1});
						      var ps = new kakao.maps.services.Places();  // 키워드로 검색 인스턴스 생성

						      const where = e.target.value;
						      
						      const current = new kakao.maps.LatLng(location.x, location.y);
						      ps.keywordSearch(where, (data, status, pagination)=>{  // 키워드로 검색한다. 
						        
						        if (status === kakao.maps.services.Status.OK) {
						          facilityLocationStore.setLocationArr(data);  // 스토어에 좌표값들을 저장한다. 
						          if(markerArr.length !==0){
						            deleteMarker();
						          }
						          const tmpArr = [];
						          for (var i=0; i<data.length; i++) {
						              displayMarker(map,infowindow ,data[i], tmpArr, where);    
						          }
						          setMarkerArr(tmpArr);       
						        }
						        
						      },{location : current});  // 현재 위치를 기반으로 키워드 검색
						  }
						
						
						const createMarker = useCallback(()=>{
					        
					        const {naver} = window;
					        for (var i=0; i<arr.length; i++) {
					            console.log(nMap, arr[i].x, arr[i].y);
					            let cur = new naver.maps.LatLng(arr[i].y, arr[i].x);
					            let marker = new naver.maps.Marker({
					                map: nMap,
					                position: cur,
					                
					            });
					           
					        }
					    },[arr, nMap]);


					const NaverMap = observer(() =>{

					    const curPos = curLocation.getXY;  // 현재 위치를 스토어에서 가져온다.
					    const arr = facilityLocationStore.locationArr;  // 카카오 api 에서 얻은 키워드에 해당되는 좌표값
					    const [markArr, setMarkArr] = useState([]);
					    const [nMap, setNmap] = useState(null);

					    const createMarker = useCallback(()=>{ 
					        
					    	
					        const {naver} = window;
					        for (var i=0; i<arr.length; i++) {
					            console.log(nMap, arr[i].x, arr[i].y);
					            let cur = new naver.maps.LatLng(arr[i].y, arr[i].x); //각 좌표에 마커를 찍어준다. 
					            let marker = new naver.maps.Marker({
					                map: nMap,
					                position: cur,
					                
					            });
					           
					        }
					        
					    },[arr, nMap]);
					    
					});
					    */
				</script>

			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>