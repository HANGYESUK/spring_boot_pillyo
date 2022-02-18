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
		
		<!-- momento.js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
		
		<!-- bootstrap 4 -->
	    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
		
		<!-- fullcalendar -->
		<link href='/resources/fullcalendar-5.10.2/lib/main.css' rel='stylesheet' />
		<script src='/resources/fullcalendar-5.10.2/lib/main.js'></script>
		<script src="https://unpkg.com/@popperjs/core@2/dist/umd/popper.js"></script>
		<script src="https://unpkg.com/tippy.js@6"></script>
		<script>
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
		    		
		    		// 조건절 작성 위한 데이터 처리 작업
		    		<c:set var="startDB" value="${dose.ddStartDate}" />
		    		<c:set var="endDB" value="${dose.ddEndDate}" />
					<fmt:parseDate var="start" value="${startDB }" pattern="yyyy-MM-dd"/>
					<fmt:parseDate var="end" value="${endDB }" pattern="yyyy-MM-dd"/>
					<fmt:formatDate var="startFmt" value="${start}" pattern="yyyyMMdd"/>
					<fmt:formatDate var="endFmt" value="${end}" pattern="yyyyMMdd"/>
					console.log("start : " + "${start}" + "타입 : " + "typeof ${start}");
					console.log("end : " + "${end}" + "타입 : " + typeof "${end}");
					console.log("startFmt : " + "${startFmt}" + "타입 : " + typeof "${startFmt}");
					console.log("endFmt : " + "${endFmt}" + "타입 : " + typeof "${endFmt}");
					
					// 반복문 작성 위한 데이터 처리 작업
					startFmt = parseInt(${startFmt});
					endFmt = parseInt(${endFmt});
					console.log("startFmt 값 : " + startFmt); // 콘솔 값 출력 test
					console.log("endFmt 값 : " + endFmt); // 콘솔 값 출력 test
					console.log("startFmt 타입 : " + typeof startFmt); // 콘솔 값 출력 test - type = number
					console.log("endFmt 타입 : " + typeof endFmt); // 콘솔 값 출력 test - type = number
					
					for (var i=startFmt; i<endFmt; i+=${dose.ddCycle}) {
						if(${dose.ddCycle}<=0) break;
						if(i+${dose.ddCycle}>(endFmt)) break;
						console.log("성공!!!!!!");
						console.log(i); // 제대로 바뀌고 있음 
						
						var strStart = String(i);
						console.log(strStart);
						var strFmtStart = moment(strStart, "YYYYMMDD").format("YYYY-MM-DD");
						console.log(strFmtStart);
						
						/* 복용 목록 캘린더에 추가 (시작일보다 종료일이 늦고, 복용 주기를 1이상의 값으로 입력했을 경우) */
			    		<c:if test="${endFmt-startFmt > 0}">
			    			console.log("조건절 성공...");
		    				var arr = String(strFmtStart).split("-"); /* yyyy, mm, dd로 잘려 배열에 저장됨, 각 요소는 문자열 형태, dd=arr[2] */
		    				console.log(arr); // 콘솔 값 출력 test
		    				
		    				// arr[2]를 숫자타입으로 변경 후, 복용주기와 덧셈 연산 -> 다시 문자열로 변경
		    				console.log("arr[2] 타입 : " + typeof arr[2]); // 콘솔 값 출력 test - type = string
		    				var day = parseInt(arr[2]);
		    				console.log("day 값 : " + day);
		    				console.log("dose.ddCycle 타입 : " + typeof ${dose.ddCycle}); // 콘솔 값 출력 test - type = number
		    				day += ${dose.ddCycle};
		    				console.log("day 타입 : " + typeof day); // 콘솔 값 출력 test - type = number
		    				day = String(day).padStart(2,'0'); // day 값이 10 미만일 경우 고려하여 두 자리, 빈 자리는 0으로 채우도록 포매팅
		    				console.log("포매팅 후 day 타입 : " + typeof day); // 콘솔 값 출력 test - type = string
		    				
		    				// newddStartDate = 문자열 합치기 (기존시작일yyyy + 기존시작일mm + 주기에 따라 새롭게 변경된 day + "T" + 기존복용시간)
		    				console.log("dose.ddTime 타입 : " + typeof "${dose.ddTime}"); // 콘솔 값 출력 test - type = string
		    				var newddStartDate = arr[0] + arr[1] + day + "T" + "${dose.ddTime}";
		    				console.log("newddStartDate 값 : " + newddStartDate); // 콘솔 값 출력 test - type = string
		    				console.log("newddStartDate 타입 : " + typeof newddStartDate); // 콘솔 값 출력 test - type = string
		    				
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
	    		
		    	/* calender */
		        var calendarEl = document.getElementById('calendar');
		        var calendar = new FullCalendar.Calendar(calendarEl, {
		        	initialView: 'dayGridMonth',
		        	headerToolbar: {
		        		left: 'prev next today',
	                    center: 'title addEventButton',
	                    right: 'dayGridMonth dayGridWeek dayGridDay listWeek'
                    },
                    buttonText: { // 버튼 글자 커스텀
		        	  today: '오늘',
		        	  month: '월',
		        	  week : '주',
		        	  day : '일',
		        	  list: '주간 복용 표',
		        	  addEventButton: "복용 정보 추가"
	        	    },
	                customButtons: {
	                    addEventButton: { // 추가한 버튼 설정
	                        text : "복용 정보 추가",  // 버튼 내용
	                        click : function(){ // 버튼 클릭 시 이벤트 추가
	                            $("#calendarModal").modal("show"); // modal 나타내기

	                            $("#addDose").on("click",function(){  // modal의 추가 버튼 클릭 시
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
	                                }
	                            });
	                        }
	                    }
	                },
		          navLinks: true, // 달력 상의 날짜 클릭 가능 여부 : true 클릭 가능. 클릭 시 해당 날짜의 일정 나타남
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
	        		  $("#calendarModal").modal("show");
	        	  },

	              eventDidMount: function(info) {
	                  tippy(info.el, {
	                      content:  info.event.extendedProps.description,//이벤트 디스크립션을 툴팁으로 가져옵니다. 
	                  });
	              },
		        	  
		        	  
		        });
		        calendar.render(); // 캘린더 랜더링
		      });
		</script>
		<style>
	        #calendar {
	            height: 800px;
	            width: 800px;
	        }
	        .modal-dialog {
	        	max-width:680px;
	        }
        </style>
    </head>
	<body>
		<div id="wrap">

		<section>
			<div id="calendarBox">
				<div id='calendar'></div>
			</div>
			
			<!-- modal 추가 -->
		    <div class="modal fade" id="calendarModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		        <div class="modal-dialog" role="document">
		            <div class="modal-content">
		                <div class="modal-header">
		                    <h5 class="modal-title" id="exampleModalLabel">복용 정보 추가하기</h5>
		                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		                        <span aria-hidden="true">&times;</span>
		                    </button>
		                </div>
		                <div class="modal-body">
		                    <div class="form-group">
		                    	<form methond="post" id="doseInsertForm" action="<c:url value='/doseCalInsert'/>">
			                    	<label for="famNo" class="col-form-label">가족 번호 (외래키) - 데이터 등록 테스트 위해서 임의 값 고정 </label><br>
			                    	<input type="number" id="famNo" name="famNo" value="2" class="form-control" readonly><br>
			                    	
			                        <label for="ddTitle" class="col-form-label">복용 타이틀</label><br>
			                        <input type="text" id="ddTitle" name="ddTitle" class="form-control"><br>
			                        
			                        <label for="searchInput" class="col-form-label">약 이름 입력받아서 -> 일치하는 약 선택 -> 해당 약 번호 넘기도록 : 약 이름 사용자 입력</label><br>
			                        <input type="text" id="searchInput" name="searchInput" class="form-control" /><br>
			                        <label for="drugInfoNo" class="col-form-label">약 번호 (자동완성 결과)</label><br>
			                        <input type="number" id="drugInfoNo" name="drugInfoNo" class="form-control" readonly><br>
			                        
			                        <label for="ddStartDate" class="col-form-label">복용 시작 날짜 및 복용 시간</label><br><!-- yyyy-mm-ddThh-mm 형식으로 전송됨 -->
			                        <input type="date" class="form-control" id="ddStartDate" class="form-control" name="ddStartDate"><br>
			                        <label for="ddEndDate" class="col-form-label">복용 종료 날짜</label><br>
			                        <input type="date" class="form-control" id="ddEndDate" class="form-control" name="ddEndDate"><br>
			                        <label for="ddCycle" class="col-form-label">복용 주기 (일 단위)</label><br>
			            			<input type="number" min="1" id="ddCycle" name="ddCycle" class="form-control"><br>
			            			
			            			<label for="ddTimeSlot" class="col-form-label">복용 시기 (여러 개 선택 가능)</label><br>
				            		<input type="checkbox" name="ddTimeSlot" value="기상직후">기상직후
				            		<input type="checkbox" name="ddTimeSlot" value="아침식전">아침식전
				            		<input type="checkbox" name="ddTimeSlot" value="아침식후">아침식후
				            		<input type="checkbox" name="ddTimeSlot" value="점심식전">점심식전
				            		<input type="checkbox" name="ddTimeSlot" value="점심식후">점심식후
				            		<input type="checkbox" name="ddTimeSlot" value="저녁식전">저녁식전
				            		<input type="checkbox" name="ddTimeSlot" value="저녁식후">저녁식후
				            		<input type="checkbox" name="ddTimeSlot" value="취침전">취침전
				            		<br>
			            			
			            			<label for="ddTime" class="col-form-label">복용 상세 시간</label><br>
			            			<input type="time" id="ddTime" name="ddTime" class="form-control"><br>
			            			
				            		<label for="ddAmount" class="col-form-label">약 일회 복용 개수</label><br>
			            			<input type="number" min="1" id="ddAmount" name="ddAmount" class="form-control"><br>
			            			
			            			<div id='autoResult'></div> <!-- 자동완성 : 유사 데이터 표출 영역 -->
			            			
			            			<button type="submit" class="btn btn-warning" id="addDose">추가</button>
		                    		<button type="button" class="btn btn-secondary" data-dismiss="modal" id="sprintSettingModalClose">취소</button>
		            			</form>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
        </section>
        
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
				console.log(drugArr);
				
				var isComplete = false;  //autoResult 자식이 선택 되었는지 여부
				$('#searchInput').keyup(function(){
				    var txt = $(this).val();
				    if(txt != ''){  //빈줄이 들어오면
				        $('#autoResult').children().remove();
		
				        drugArr.forEach(function(arg){
				            if(arg.name.indexOf(txt) > -1 ){
				                $('#autoResult').append(
				                    $('<div>').text(arg.name).attr({'key':arg.key})
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
		
      </div> <!-- wrap -->
	</body>
</html>