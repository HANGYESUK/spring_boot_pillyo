/**
 *  pharmacy.js
 */
 
window.onload = function() {
	
		if (navigator.geolocation) { // GPS를 지원하면
			navigator.geolocation.getCurrentPosition(function(position) {
				var geoArr = [position.coords.latitude, position.coords.longitude];
				console.log("yes  " + geoArr[0]);
			  	console.log("yes  " + geoArr[1]);
			  	
			  	document.getElementById("latitude").value=(geoArr[0]);
			  	document.getElementById("longitude").value=(geoArr[1]);
			  	
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
				
		  		draqPharmMap(lat, lon);								  	
		  		
		  	}, function(error) {
		  		console.error(error);
	  		}, { enableHighAccuracy: false,
	  			 maximumAge: 0,
	      		 timeout: Infinity
	  		});
		} else {
			// var category = document.getElementById("category");
			// category.style.display = "none";
			alert('위치 정보 사용 권한 허용 설정 후 재접속 바랍니다.');
		}
				
		function draqPharmMap(lat, lon) {
		 	// ---------------------- 지도 생성 ------------------------
		 	// 지도를 표시할 div
		  	var mapContainer = document.getElementById('map');
			
			// 지도의 중심좌표 및 확대 레벨 설정
			var mapOption = { center: new kakao.maps.LatLng(lat, lon), level: 3 };
			
			// 지도 생성
			var map = new kakao.maps.Map(mapContainer, mapOption);
			
			
			
			// ---------------------- 컨트롤 ------------------------
			// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
			var mapTypeControl = new kakao.maps.MapTypeControl();
		
			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
		
			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
			
			
			
			// ---------------------- 약국 & 편의점 ------------------------
			// 마커 클릭 시 해당 장소 상세정보 제공
			var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
			    contentNode = document.createElement('div'), //컨텐츠 엘리먼트
			    markers = [], // 마커를 담을 배열
			    currCategory = 'PM9'; // 선택된 카테고리를 가지고 있을 변수
			
			// 장소 검색 객체 생성
			var ps = new kakao.maps.services.Places(map); 
			
			// 지도에 idle 이벤트 등록
			kakao.maps.event.addListener(map, 'idle', searchPlaces);
			
			// 커스텀 오버레이의 컨텐츠 노드에 css class 추가
			contentNode.className = 'placeinfo_wrap';
			
			// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
			// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드 등록
			addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
			addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
			
			// 커스텀 오버레이 컨텐츠 설정
			placeOverlay.setContent(contentNode);  
			
			// 각 카테고리에 클릭 이벤트 등록
			addCategoryClickEvent();
			
			// 엘리먼트에 이벤트 핸들러 등록 함수
			function addEventHandle(target, type, callback) {
			    if (target.addEventListener) {
			        target.addEventListener(type, callback);
			    } else {
			        target.attachEvent('on' + type, callback);
			    }
			}
			
			// 카테고리 검색 요청 함수
			function searchPlaces() {
			    if (!currCategory) {
			        return;
			    }
			    
			    // 커스텀 오버레이 숨김
			    placeOverlay.setMap(null);
			
			    // 지도에 표시되고 있는 마커 제거
			    removeMarker();
			    
			    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
			}
			
			// 장소검색 완료 시 호출되는 콜백함수
			function placesSearchCB(data, status, pagination) {
			    if (status === kakao.maps.services.Status.OK) {
			        // 검색 정상적으로 완료 시 지도에 마커 표출
			        displayPlaces(data);
			    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
			        // 검색결과 없는 경우 해야할 처리 내용
			    } else if (status === kakao.maps.services.Status.ERROR) {
			        // 에러 발생 시 해야할 처리 내용
			    }
			}
			
			// 마커 표출 함수
			function displayPlaces(places) {
			
			    // 몇번째 카테고리가 선택되어 있는지 얻어와 스프라이트 이미지에서의 위치 계산에 사용
			    var order = document.getElementById(currCategory).getAttribute('data-order');
		
			    for ( var i=0; i<places.length; i++ ) {
			    	
			            // 마커 생성 및 지도에 표시
			            var marker = addMarker(new kakao.maps.LatLng(places[i].y, places[i].x), order);
			
			            // 마커와 검색결과 항목 클릭 시, 장소정보 표출하는 클릭 이벤트 등록
			            (function(marker, place) {
			                kakao.maps.event.addListener(marker, 'click', function() {
			                    displayPlaceInfo(place);
			                });
			            })(marker, places[i]);
			    }
			}
			
			// 마커 생성 및 표시 함수
			function addMarker(position, order) {
			    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지 사용
			        imageSize = new kakao.maps.Size(27, 28),  // 마커 이미지 크기
			        imgOptions =  {
			            spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지 크기
			            spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			            offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			        },
			        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
			            marker = new kakao.maps.Marker({
			            position: position, // 마커 위치
			            image: markerImage 
			        });
			
			    marker.setMap(map); // 마커 표출
			    markers.push(marker);  // 배열에 생성된 마커 추가
			
			    return marker;
			}
			
			// 지도 위에 표시되고 있는 마커 모두 제거
			function removeMarker() {
			    for ( var i = 0; i < markers.length; i++ ) {
			        markers[i].setMap(null);
			    }   
			    markers = [];
			}
			
			// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수
			function displayPlaceInfo (place) {
			    var content = '<div class="placeinfo">' +
			                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   
			
			    if (place.road_address_name) {
			        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
			                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
			    }  else {
			        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
			    }                
			   
			    content += '    <span class="tel">' + place.phone + '</span>' + 
			                '</div>' + 
			                '<div class="after"></div>';
			
			    contentNode.innerHTML = content;
			    placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
			    placeOverlay.setMap(map);  
			}
			
			
			// 각 카테고리에 클릭 이벤트 등록
			function addCategoryClickEvent() {
			    var category = document.getElementById('category'),
			        children = category.children;
			
			    for (var i=0; i<children.length; i++) {
			        children[i].onclick = onClickCategory;
			    }
			}
			
			// 카테고리를 클릭 시 호출되는 함수
			function onClickCategory() {
			    var id = this.id,
			        className = this.className;
			
			    placeOverlay.setMap(null);
			
			    if (className === 'on') {
			        currCategory = '';
			        changeCategoryClass();
			        removeMarker();
			    } else {
			        currCategory = id;
			        changeCategoryClass(this);
			        searchPlaces();
			    }
			}
			
			// 클릭된 카테고리에만 클릭된 스타일 적용하는 함수
			function changeCategoryClass(el) {
			    var category = document.getElementById('category'),
			        children = category.children,
			        i;
			
			    for ( i=0; i<children.length; i++ ) {
			        children[i].className = '';
			    }
			
			    if (el) {
			        el.className = 'on';
			    } 
			}
		}
}; // onload 종료