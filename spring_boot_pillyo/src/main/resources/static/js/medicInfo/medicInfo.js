/**
 * medicInfo.js
 */

/*function doDisplay(){
	var infoBox = document.getElementsByClassName("info");
	for( var i = 0; i < infoBox.length; i++ ){
		var infoItem = infoBox.item(i);
		
		if(infoItem.style.display=='block'){
			infoItem.style.display = 'none';
		}else{
			infoItem.style.display = 'block';
		}
	}
}*/


$(document).ready(function(){
  
  $('#GMIbox > h2').click(function(){
    $(this).next($('div')).slideToggle('fast');
  })
  
  $('#HTTMbox > h2').click(function(e){
    e.stopPropagation();
    $(this).next($('div')).slideToggle('fast');
  })
  
  $('#MFEUbox > h2').click(function(e){
    e.stopPropagation();
    $(this).next($('div')).slideToggle('fast');
  })
  
})

/* [ 1. 일반 의약품 안내 ] 상자 열기 */
function openGMIGroup() {
	var GMIbox = document.getElementById("GMIbox");
	if(GMIbox.style.display=='none'){
		GMIbox.style.display = 'block';
	} else {
		GMIbox.style.display = 'none';
	}
}

/* [ 2. 의약품 복용법 ] 상자 열기 */
function openHTTMGroup() {
	var HTTMbox = document.getElementById("HTTMbox");
	if(HTTMbox.style.display=='none'){
		HTTMbox.style.display = 'block';
	} else {
		HTTMbox.style.display = 'none';
	}
}

/* [ 3. 외용약 사용법 ] 상자 열기 */
function openMFEUGroup() {
	var MFEUbox = document.getElementById("MFEUbox");
	if(MFEUbox.style.display=='none'){
		MFEUbox.style.display = 'block';
	} else {
		MFEUbox.style.display = 'none';
	}
}



