/**
 * medicInfo.js
 */
 
 function doDisplay(){
	var infoBox = document.getElementsByClassName("info");
	for( var i = 0; i < infoBox.length; i++ ){
		var infoItem = infoBox.item(i);
		
		if(infoItem.style.display=='block'){
			infoItem.style.display = 'none';
		}else{
			infoItem.style.display = 'block';
		}
	}
}

/* [ 1. 일반 의약품 안내 ] 상자 열기 */
function openGMIGroup() {
	var GMIbox = document.getElementById("GMIbox");
	if(GMIbox.style.display=='block'){
		GMIbox.style.display = 'none';
	} else {
		GMIbox.style.display = 'block';
	}
}

/* [ 2. 의약품 복용법 ] 상자 열기 */
function openHTTMGroup() {
	var HTTMbox = document.getElementById("HTTMbox");
	if(HTTMbox.style.display=='block'){
		HTTMbox.style.display = 'none';
	} else {
		HTTMbox.style.display = 'block';
	}
}

/* [ 3. 외용약 사용법 ] 상자 열기 */
function openMFEUGroup() {
	var MFEUbox = document.getElementById("MFEUbox");
	if(MFEUbox.style.display=='block'){
		MFEUbox.style.display = 'none';
	} else {
		MFEUbox.style.display = 'block';
	}
}



