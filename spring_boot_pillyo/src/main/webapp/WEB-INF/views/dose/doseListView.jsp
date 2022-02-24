<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>복용 목록 조회</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="/css/dose/doseListView.css" />
		
		<!-- kakao developers -->
		<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
				<div id="doseListHeader">
					<h3>복용 목록 조회</h3>
				</div>
				<div>
					<table id="doseTbl">
						<tr><th>복용 타이틀</th><th>약 번호</th><th>복용 시작 날짜</th><th>복용 종료 날짜</th><th>복용 주기</th><th>복용 시기</th><th>복용 상세 시간</th><th>1회 복용량</th><th>수정하기</th><th>삭제하기</th><th>공유하기</th></tr>
				  		 <c:forEach items="${doseList }" var="dose">
				   			<tr>
					   			<td>${dose.ddTitle }</td>
					   			<td>${dose.drugInfoNo }</td>
					   			<td>${dose.ddStartDate }</td>
					   			<td>${dose.ddEndDate }</td>
					   			<td>${dose.ddCycle }</td>
					   			<td>${dose.ddTimeSlot }</td>
					   			<td>${dose.ddTime }</td>
					   			<td>${dose.ddAmount }</td>
					   			<td><a href="<c:url value='/doseUpdateForm/${doseVo.ddNo}'/>">수정하기</a></td>
					   			<td><a href="javascript:deleteCheck();">삭제하기</a></td>
					   			<td><label><button id="doseShareBtn" class="calBtn" onClick="sendLinkDefault();"></button>공유하기</label></td>
						   	</tr>
				   		</c:forEach>
					</table>
				</div>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
	<script>
		/* modal */
		var datailModal = new tingle.modal({
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
		
		datailModal.setContent('<div class="calendarModal"><div id="doseInsertFormBox"><div id="modalHeader"><h3>복용 정보 추가하기</h3></div><form methond="post" action="/doseCalInsert" id="doseInsertForm"><table><input type="hidden" id="ddNo" name="ddNo" value=1 readonly><input type="hidden" id="drugInfoNo" name="drugInfoNo" value="${doseVo.drugInfoNo }"><input type="hidden" id="famNo" name="famNo" value=${famNo } readonly><tr><th>복용 타이틀</th><td><input type="text" id="ddTitle" name="ddTitle"></td></tr><tr><th>약 이름</th><td><input type="text" id="searchInput" name="searchInput"></td></tr><tr><th>복용 시작 날짜</th><td><input type="date" id="ddStartDate" name="ddStartDate"></td></tr><tr><th>복용 종료 날짜</th><td><input type="date" id="ddEndDate" name="ddEndDate"></td></tr><tr><th>복용 주기</th><td><input type="number" min="0" id="ddCycle" name="ddCycle">일</td></tr><tr><th>복용 시기</th><td id="timeSlotTd"><label for="afterGetUp">기상직후</label><input type="radio" id="afterGetUp" name="ddTimeSlot" value="기상직후"><label for="beforeB">아침식전</label><input type="radio" id="beforeB" name="ddTimeSlot" value="아침식전"><label for="afterB">아침식후</label><input type="radio" id="afterB" name="ddTimeSlot" value="아침식후"><label for="beforeL">점심식전</label><input type="radio" id="beforeL" name="ddTimeSlot" value="점심식전"><label for="afterL">점심식후</label><input type="radio" id="afterL" name="ddTimeSlot" value="점심식후"><label for="beforeD">저녁식전</label><input type="radio" id="beforeD" name="ddTimeSlot" value="저녁식전"><label for="afterD">저녁식후</label><input type="radio" id="afterD" name="ddTimeSlot" value="저녁식후"><label for="beforeBed">취침전</label><input type="radio" id="beforeBed" name="ddTimeSlot" value="취침전"></td></tr><tr><th>복용 상세 시간</th><td><input type="time" id="ddTime" name="ddTime"></td></tr><tr><th>1회 복용량</th><td><input type="number" min="1" id="ddAmount" name="ddAmount"></td></tr><td colspan="2" id="doseInsertBtnTd"><input type="submit" id="addDose" value="등록"><input type="reset" id="resetDose" value="취소"></td></table></form></div><div id="autoResultBox"><h3>자동완성 결과</h3><span id="autoMsg">수정 결과로 반영할 약물 이름을 클릭하세요.</span><div id="autoResultScroll"><ul id="autoResult"></ul></div></div></div>');
		// hidden 태그 value famNo는 잘 받아오고 있음
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
	<script>
		$("#doseAddBtn").on("click",function(){
			datailModal.open();
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
            }
            
            return result;
        });
	</script>
	<script type="text/javascript">
		function deleteCheck(){
			var answer = confirm("해당 복용 정보를 목록에서 삭제하시겠습니까?");
			if(answer == true){
				alert("복용 정보가 삭제되었습니다.");
				location.href="/doseDelete/${doseVo.ddNo}";
			}
		}
	</script>
	<script type="text/javascript">
	    function sendLinkCustom() {
	        Kakao.init("b3bc39226c10ad1e0663733a444b7b1d");
	        Kakao.Link.sendCustom({
	            templateId: 71421
	        });
	    }
	</script>
	
	<script>
		try {
		  function sendLinkDefault() {
		    Kakao.init('b3bc39226c10ad1e0663733a444b7b1d')
		    Kakao.Link.sendDefault({
		      objectType: 'feed',
		      content: {
		        title: '${doseVo.ddTitle }',
		        description: '${doseVo.ddStartDate }~${doseVo.ddEndDate } (${doseVo.ddCycle }일 주기)\n${doseVo.ddTime }시 ${doseVo.ddAmount }정 복용',
		        imageUrl:
		          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbgzsMC%2Fbtrt7qKB89C%2FOFby4PY9iEE6a6Uzqjc5kK%2Fimg.png',
		        link: {
		          mobileWebUrl: 'https://developers.kakao.com',
		          webUrl: 'https://developers.kakao.com',
		        },
		      },
		      buttons: [
		        {
		          title: 'Pill-Yo 접속하기',
		          link: {
		            mobileWebUrl: 'https://developers.kakao.com',
		            webUrl: 'https://developers.kakao.com',
		          },
		        },
		      ],
		    })
		  }
		; window.kakaoDemoCallback && window.kakaoDemoCallback() }
		catch(e) { window.kakaoDemoException && window.kakaoDemoException(e) }
	</script>
</html>