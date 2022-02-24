<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>복용관리 - calendar</title>
		
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		
		<!-- fullcalendar -->
		<link href='/resources/fullcalendar-5.10.2/lib/main.css' rel='stylesheet' />
		<script src='/resources/fullcalendar-5.10.2/lib/main.js'></script>
		<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
		<script src="https://unpkg.com/tippy.js@6"></script>
		
		<!-- momento.js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
		
		<!-- tingle.js-->
		<link rel="stylesheet" href="/css/tingle.min.css">
		<script src="/js/tingle.min.js"></script>
		
		<!-- kakao developers -->
		<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
		
	    <link rel="stylesheet" href="/css/dose/doseAutoSearch.css" />
	    <link rel="stylesheet" href="/css/dose/doseCalendar.css" />
	    <link rel="stylesheet" href="/css/main/familyProfile.css" />
	    <link rel="stylesheet" href="<c:url value='/css/health/healthManage.css'/>" />
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section" class="calum">
			<div class="fam-List calum">
				 <c:forEach items="${famList }" var="fam">
				   	<a href="<c:url value='/calendarView/${fam.famNo}'/>">
					   	<div class="profile-Family-Icon" style="text-align: center;">
					   		<h4>${ fam.famMember}</h4>
					   		<input type="hidden" class="prInfo" value="☌">
						</div>
						<!-- test1 -->
					</a>
				 </c:forEach>
			   <a href="<c:url value = '/famListView'/>">
			 		<div class="profile-Family-Icon"><p id="plus">+</p></div>
			   </a>
			 </div>
			

			
			<h3>${famMember} 님의 복용관리 입니다.</h3><br><br>
			
			
				<div id="doseBox">
					<div id="calendarBox">
						<div id='calendar'></div>
					</div>
					<div id="doseListAndBtnBox">
						<div id="doseListBox">
							<div id='doseListCal'></div>
						</div>
						
						<div id="btnBoxParent">
							<div id="btnBox">
								<label><button id="doseAddBtn" class="calBtn">복용 정보 추가하기</button></label>
								<label><button id="doseMngBtn" class="calBtn"><a href="<c:url value='/doseListView/${famNo}'/>">복용 목록 관리</a></button></label>
							</div>
						</div>
					</div>
				</div>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
	<script>
		/* modal */
		var modal = new tingle.modal({
		    footer: true,
		    stickyFooter: false,
		    closeMethods: ['overlay', 'button', 'escape'],
		    closeLabel: "Close",
		    cssClass: ['custom-class-1', 'custom-class-2'],
		    onOpen: function() {
		        console.log('modal open');
		    },
		    onClose: function() {
		        console.log('modal closed');
		    },
		    beforeClose: function() {
		        // save content before closing the modal
		        return true; // close the modal
		        //return false; // nothing happens
		    }
		});
		
		modal.setContent('<div class="calendarModal"><div id="doseInsertFormBox"><div id="modalHeader"><h3>복용 정보 추가하기</h3></div><form methond="post" action="/doseCalInsert" id="doseInsertForm"><table><input type="hidden" id="ddNo" name="ddNo" value=1 readonly><input type="hidden" id="drugInfoNo" name="drugInfoNo" value="${doseVo.drugInfoNo }"><input type="hidden" id="famNo" name="famNo" value=${famNo } readonly><tr><th>복용 타이틀</th><td><input type="text" id="ddTitle" name="ddTitle"></td></tr><tr><th>약 이름</th><td><input type="text" id="searchInput" name="searchInput"></td></tr><tr><th>복용 시작 날짜</th><td><input type="date" id="ddStartDate" name="ddStartDate"></td></tr><tr><th>복용 종료 날짜</th><td><input type="date" id="ddEndDate" name="ddEndDate"></td></tr><tr><th>복용 주기</th><td><input type="number" min="0" id="ddCycle" name="ddCycle">일</td></tr><tr><th>복용 시기</th><td id="timeSlotTd"><label for="afterGetUp">기상직후</label><input type="radio" id="afterGetUp" name="ddTimeSlot" value="기상직후"><label for="beforeB">아침식전</label><input type="radio" id="beforeB" name="ddTimeSlot" value="아침식전"><label for="afterB">아침식후</label><input type="radio" id="afterB" name="ddTimeSlot" value="아침식후"><label for="beforeL">점심식전</label><input type="radio" id="beforeL" name="ddTimeSlot" value="점심식전"><label for="afterL">점심식후</label><input type="radio" id="afterL" name="ddTimeSlot" value="점심식후"><label for="beforeD">저녁식전</label><input type="radio" id="beforeD" name="ddTimeSlot" value="저녁식전"><label for="afterD">저녁식후</label><input type="radio" id="afterD" name="ddTimeSlot" value="저녁식후"><label for="beforeBed">취침전</label><input type="radio" id="beforeBed" name="ddTimeSlot" value="취침전"></td></tr><tr><th>복용 상세 시간</th><td><input type="time" id="ddTime" name="ddTime"></td></tr><tr><th>1회 복용량</th><td><input type="number" min="1" id="ddAmount" name="ddAmount"></td></tr><td colspan="2" id="doseInsertBtnTd"><input type="submit" id="addDose" value="등록"><input type="reset" id="resetDose" value="취소"></td></table></form></div><div id="autoResultBox"><h3>자동완성 결과</h3><span id="autoMsg">수정 결과로 반영할 약물 이름을 클릭하세요.</span><div id="autoResultScroll"><ul id="autoResult"></ul></div></div></div>');
		// hidden 태그 value famNo는 잘 받아오고 있음
		
		/* calender : DB 데이터 캘린더에 추가 */
		document.addEventListener('DOMContentLoaded', function() {
			var doseArr = new Array();
	    	<c:forEach items="${doseList}" var="dose">
	    		/* 복용 목록 캘린더에 추가 (시작일만) */
	    		doseArr.push({
	    			title:"${dose.ddTitle}",
	    			start:"${dose.ddStartDate}"+"T"+"${dose.ddTime}",
	    			end:"${dose.ddStartDate}"+"T"+"${dose.ddTime}"+":01",
	    			description: "일회 복용량 : ${dose.ddAmount}"
	    		});
	    		
	    		
	    		/* 복용 목록 캘린더에 추가 (시작일 제외, 복용주기가 0보다 크고, 시작일보다 종료일이 클 경우 데이터 반복 삽입) */
	    		// 조건절 작성 위한 데이터 처리 작업
	    		<c:set var="startDB" value="${dose.ddStartDate}" />
	    		<c:set var="endDB" value="${dose.ddEndDate}" />
				<fmt:parseDate var="start" value="${startDB }" pattern="yyyy-MM-dd"/>
				<fmt:parseDate var="end" value="${endDB }" pattern="yyyy-MM-dd"/>
				<fmt:formatDate var="startFmt" value="${start}" pattern="yyyyMMdd"/>
				<fmt:formatDate var="endFmt" value="${end}" pattern="yyyyMMdd"/>
				//console.log("start : " + "${start}" + "타입 : " + "typeof ${start}");
				//console.log("end : " + "${end}" + "타입 : " + typeof "${end}");
				//console.log("startFmt : " + "${startFmt}" + "타입 : " + typeof "${startFmt}");
				//console.log("endFmt : " + "${endFmt}" + "타입 : " + typeof "${endFmt}");
				
				// 반복문 작성 위한 데이터 처리 작업
				startFmt = parseInt(${startFmt});
				endFmt = parseInt(${endFmt});
				//console.log("startFmt 값 : " + startFmt); // 콘솔 값 출력 test
				//console.log("endFmt 값 : " + endFmt); // 콘솔 값 출력 test
				//console.log("startFmt 타입 : " + typeof startFmt); // 콘솔 값 출력 test - type = number
				//console.log("endFmt 타입 : " + typeof endFmt); // 콘솔 값 출력 test - type = number
				
				for (var i=startFmt; i<endFmt; i+=${dose.ddCycle}) {
					if(${dose.ddCycle}<=0) break;
					if(i+${dose.ddCycle}>(endFmt)) break;
					//console.log("성공!!!!!!");
					//console.log(i); // 제대로 바뀌고 있음 
					
					var strStart = String(i);
					//console.log(strStart);
					var strFmtStart = moment(strStart, "YYYYMMDD").format("YYYY-MM-DD");
					//console.log(strFmtStart);
					
					/* 복용 목록 캘린더에 추가 (시작일보다 종료일이 늦고, 복용 주기를 1이상의 값으로 입력했을 경우) */
		    		<c:if test="${endFmt-startFmt > 0}">
		    			//console.log("조건절 성공...");
	    				var arr = String(strFmtStart).split("-"); /* yyyy, mm, dd로 잘려 배열에 저장됨, 각 요소는 문자열 형태, dd=arr[2] */
	    				//console.log(arr); // 콘솔 값 출력 test
	    				
	    				// arr[2]를 숫자타입으로 변경 후, 복용주기와 덧셈 연산 -> 다시 문자열로 변경
	    				//console.log("arr[2] 타입 : " + typeof arr[2]); // 콘솔 값 출력 test - type = string
	    				var day = parseInt(arr[2]);
	    				//console.log("day 값 : " + day);
	    				//console.log("dose.ddCycle 타입 : " + typeof ${dose.ddCycle}); // 콘솔 값 출력 test - type = number
	    				day += ${dose.ddCycle};
	    				//console.log("day 타입 : " + typeof day); // 콘솔 값 출력 test - type = number
	    				day = String(day).padStart(2,'0'); // day 값이 10 미만일 경우 고려하여 두 자리, 빈 자리는 0으로 채우도록 포매팅
	    				//console.log("포매팅 후 day 타입 : " + typeof day); // 콘솔 값 출력 test - type = string
	    				
	    				// newddStartDate = 문자열 합치기 (기존시작일yyyy + 기존시작일mm + 주기에 따라 새롭게 변경된 day + "T" + 기존복용시간)
	    				//console.log("dose.ddTime 타입 : " + typeof "${dose.ddTime}"); // 콘솔 값 출력 test - type = string
	    				var newddStartDate = arr[0] + arr[1] + day + "T" + "${dose.ddTime}";
	    				//console.log("newddStartDate 값 : " + newddStartDate); // 콘솔 값 출력 test - type = string
	    				//console.log("newddStartDate 타입 : " + typeof newddStartDate); // 콘솔 값 출력 test - type = string
	    				
	    				// newddEndDate = newddStartDate + ":01"로 설정하여 복용 이벤트 등록
	    				doseArr.push({
			    			title:"${dose.ddTitle}",
			    			start:newddStartDate,
			    			end:newddStartDate+":01",
			    			description: "일회 복용량 : ${dose.ddAmount}"
			    		});
			    	</c:if>
				}
	   		</c:forEach>
	   		
	    	/* calender : 설정 및 렌더링 */
	        var calendarEl = document.getElementById('calendar');
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	        	initialView: 'dayGridMonth',
	        	headerToolbar: {
	        		left: 'prev',
	                center: 'title',
	                right: 'next',
	            },
                footerToolbar: {
                	left: '',
                	center: 'dayGridMonth listWeek today',
                	right: '',
                },
                buttonText: { // 버튼 글자 커스텀
	        	  today: 'Today',
	        	  month: 'Monthly',
	        	  list: 'Weekly',
	       	    },
	          navLinks: false, // 달력 상의 날짜 클릭 가능 여부 : true 클릭 가능. 클릭 시 해당 날짜의 일정 나타남
	          dayMaxEvents: true, // 셀 크기보다 일정이 많이 등록되어 있는 경우 more 표시
	          timeZone: 'local', // 한국 시간으로 설정
	          locale: 'ko', // 한국어 설정
	          expandRows: true, // 화면에 맞게 높이 재설정
	          // selectMirror: true, // 힌트?
      		  editable: false, // 수정 가능
			  selectable: false, // 달력 일자 드래그 설정 가능
			  events: doseArr, // DB 복용 목록 추가
			  
	          eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
	        	  console.log(obj);
	          },
	       	  eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
	       	  	console.log(obj);
	       	  },
	       	  eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
	       	  	console.log(obj);
	       	  },
	       	  
	       	  
	       	  select: function(arg) { // 날짜 선택되면 발생하는 이벤트 (드래그 포함)
	       		modal.open();
	       	  },
	
              eventDidMount: function(info) {
                  tippy(info.el, {
                      content:  info.event.extendedProps.description,//이벤트 디스크립션을 툴팁으로 가져옵니다. 
                  });
              },
	        });
	        calendar.render(); // 캘린더 랜더링
	        
	        /* 오늘의 복용 목록 캘린더 */
			var listCal = document.getElementById('doseListCal');
			var doseListCal = new FullCalendar.Calendar(listCal, {
				initialView: 'dayGridDay',
		        dayMaxEvents: false, // 셀 크기보다 일정이 많이 등록되어 있는 경우 more 표시 X => 스크롤되게
		        timeZone: 'local', // 한국 시간으로 설정
		        locale: 'ko', // 한국어 설정
		        expandRows: true, // 화면에 맞게 높이 재설정
		        events: doseArr, // DB 복용 목록 추가
				
		        headerToolbar: {
	        		left: '',
	                center: 'title',
	                right: ''
	            },
		
		        eventDidMount: function(info) {
		            tippy(info.el, {
		                content:  info.event.extendedProps.description,//이벤트 디스크립션을 툴팁으로 가져옵니다. 
		            });
		        },
	      	});
			doseListCal.render(); // 캘린더 랜더링
      });
	</script>
	<script>
       	document.addEventListener('DOMContentLoaded', function() {
	        /* 약 전체 목록 data */
	    	var drugArr = new Array();
	    	<c:forEach items="${drugList}" var="drug">
	    		drugArr.push({
	    			key:"${drug.drugInfoNo}",
	    			name:"${drug.itemName}"
	    		});
			</c:forEach>
			//console.log(drugArr);
			
			var isComplete = false;  //autoResult 자식이 선택 되었는지 여부
			$('#searchInput').keyup(function(){
			    var txt = $(this).val();
			    if(txt != ''){  //빈줄이 들어오면
			        $('#autoResult').children().remove();
	
			        drugArr.forEach(function(arg){
			            if(arg.name.indexOf(txt) > -1 ){
			                $('#autoResult').append(
			                    $('<li class="autoResultItem">').text(arg.name).attr({'key':arg.key})
			                );		
			            }
			        });
			        $('#autoResult').children().each(function(){
			            $(this).click(function(){
			                $('#searchInput').val($(this).text());
			                $('#drugInfoNo').val($(this).attr('key'));
			                $('#autoResult').children().remove();	
			                isComplete = true;
			            });
			        });			
			    } else {
			        $('#autoResult').children().remove();
			    }  
			});
			$('#searchInput').keydown(function(event){
			    if(isComplete) {  //autoMaker 자식이 선택 되었으면 초기화
			        $('#drugInfoNo').val('')	
			    }
			})
       	});
	</script>
	<script type="text/javascript">
		$('input[type="radio"]').change(function(){
			$('input[type="radio"]').prev('label').css('background-color', '#d0deea');
			
			if($(this).is(':checked')){
				$(this).prev('label').css('background-color', '#b7cee2');
			}
		    else{
				$(this).prev('label').css('background-color', '#d0deea');
			}
		});
	</script>
	<script>
		$("#doseAddBtn").on("click",function(){
			modal.open();
		});
		
		$("#addDose").on("click",function(){  // modal의 추가 버튼 클릭 시
			var result = false;
            var ddTitle = $("#ddTitle").val();
            var drugInfoNo = $("#drugInfoNo").val();
            var ddStartDate = $("#ddStartDate").val();
            var ddEndDate = $("#ddEndDate").val();
            var ddCycle = $("#ddCycle").val();
            var ddTimeSlot = $("#ddTimeSlot").val();
            var ddTime = $("#ddTime").val();
            var ddAmount = $("#ddAmount").val();
            
            //내용 입력 여부 확인
            if(ddTitle == null || ddTitle == ""){
                alert("복용 타이틀을 입력하세요.");
            }else if(drugInfoNo == null || drugInfoNo ==""){
                alert("약 이름을 입력하세요.");
            }else if(ddStartDate == "" || ddEndDate ==""){
                alert("날짜를 입력하세요.");
            }else if(new Date(ddEndDate)- new Date(ddStartDate) < 0){
                alert("종료일이 시작일보다 먼저입니다.");
            }else if(ddCycle == null || ddCycle == ""){
            	alert("복용 주기를 입력하세요.");
            }else if(ddTime == null || ddTime == ""){
            	alert("복용 상세 시간을 입력하세요.");
            }else if(ddAmount == null || ddAmount == ""){
            	alert("일회 복용량을 입력하세요.");
            }else{
         	   // 정상적으로 입력했을 경우
            	result = true;
         	   alert("복용 정보 등록이 완료되었습니다.");
            }
            
            return result;
        });
	</script>
</html>