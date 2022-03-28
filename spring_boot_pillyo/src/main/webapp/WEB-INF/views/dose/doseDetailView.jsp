<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>복용 상세 정보 조회</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="/css/dose/doseDetailView.css" />
		
		<!-- kakao developers -->
		<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
		
		<!-- tingle.js-->
		<link rel="stylesheet" href="/css/tingle.min.css">
		<script src="/js/tingle.min.js"></script>
		
		<!-- momento.js -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
		
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
				
			<section id="section">
				<div id="doseTitleBox">
					<h2>복 용 상 세 정 보</h2>
				</div>
				<div id="doseDetailBox">
					<div id="doseLineBox">
						<div id="doseTblBox">
							<div id="doseInfoHeader">
								<img src="/image/doseDetail.png"/>
							</div>
							
							<div id="doseInfoBox">
								<div id="doseMemBox">
									<h3>${doseVo.doseFamName }</h3><span>님</span>
								</div>
								<div id="doseInfoTblBox">
									<table id="doseTbl">
										<tr><th>${doseDrugName }</th></tr>
										<tr><td>${doseVo.ddStartDate } ~ ${doseVo.ddEndDate }</td></tr>
										<tr><td>${doseVo.ddTimeSlot } ${doseVo.ddTime }</td></tr>
										<tr><td>${doseVo.ddCycle }일 간격</td></tr>
										<tr><td>1회 ${doseVo.ddAmount }정 복용</td></tr>
									</table>
								</div>
							</div>
							<div id="btnBox">
								<div id="updateBtn">
									<a href="<c:url value='/doseUpdateForm/${doseVo.ddNo}'/>">수정하기</a>
								</div>
								<div id="removeBtn">
									<a href="javascript:deleteCheck();">삭제하기</a>
								</div>
								<div id="shareBtn">
									<label><button id="doseShareBtn" class="calBtn" onClick="sendLinkDefault();"></button>공유하기</label>
								</div>
								<div id="notiBtn">
									<label><button id="doseNotiBtn" class="calBtn" onClick="doseNoti();"></button>SMS 알림 신청</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				
				
				<!-- 모달 내용 -->
				<div id="doseNotiBox">
					<form id="notiForm">
						<div id="notiLineBox">
							<h3>복용 알림 서비스 신청</h3>
							<div class="doseNotiItem" id="notiNameBox">
								<input id="notiUserName" name="notiUserName" type="text" value=${doseVo.doseFamName } /><span>님</span>
								<p>클릭하여 수신자명 변경 가능</p>
							</div>
							<div class="doseNotiItem" id="notiDateBox">
								<span>복용기간</span>
								<input id="notiStartDate" name="notiStartDate" type="text" value=${doseVo.ddStartDate } readonly/>
								<span>~</span>
								<input id="notiEndDate" name="notiEndDate" type="text" value=${doseVo.ddEndDate } readonly/>
							</div>
							<div class="doseNotiItem" id="notiCycleBox">
								<span>주기</span>
								<input id="notiCycle" name="notiCycle" type="text" value=${doseVo.ddCycle } readonly/><span>일</span>
							</div>
							<div class="doseNotiItem" id="notiTimeBox">
								<span>알림 수신 시간</span>
								<input id="notiTime" name="notiTime" type="text" value=${doseVo.ddTime } readonly/>
							</div>
							<div id="notiHpBox">
								<span>알림 수신 번호</span>
								<input id="notiHp" name="notiHp" type="text" placeholder="- 제외하고 입력해주세요." />
							</div>
							<input id="notiApplyBtn" type="submit" value="신청하기" />
						</div>
					</form>
				</div>
							
							
							
			</section>
			
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
			
			<!-- chatbot -->
			<jsp:include page="/WEB-INF/views/chatBot.jsp"/>
			
		
      </div> <!-- wrap -->
	</body>
<!-- 	<script>
	function notiApply() {
		/* 복용 주기 반영 계산 */
		//var doseNotiArr = new Array();
		//var notiHp = document.getElementById("notiHp").value;
		
		if (notiHp === "") {
			alert("알림 수신 번호를 입력하세요.");
			return false;
		}
		
		// 조건절 작성 위한 데이터 처리 작업
		<c:set var="startDB" value="${doseVo.ddStartDate}" />
		<c:set var="endDB" value="${doseVo.ddEndDate}" />
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
		
		for (var i=startFmt; i<endFmt; i+=${doseVo.ddCycle}) {
			if(${doseVo.ddCycle}<=0) break;
			if(i+${doseVo.ddCycle}>(endFmt)) break;
			//console.log(i); // 제대로 바뀌고 있음 
			
			var strStart = String(i);
			//console.log(strStart);
			var strFmtStart = moment(strStart, "YYYYMMDD").format("YYYY-MM-DD");
			//console.log(strFmtStart);
			
			/* 주기 반영하여 계산된 복용 정보 배열로 저장) */
			<c:if test="${endFmt-startFmt > 0}">
				var arr = String(strFmtStart).split("-"); /* yyyy, mm, dd로 잘려 배열에 저장됨, 각 요소는 문자열 형태, dd=arr[2] */
				//console.log(arr); // 콘솔 값 출력 test
				
				// arr[2]를 숫자타입으로 변경 후, 복용주기와 덧셈 연산 -> 다시 문자열로 변경
				//console.log("arr[2] 타입 : " + typeof arr[2]); // 콘솔 값 출력 test - type = string
				var day = parseInt(arr[2]);
				//console.log("day 값 : " + day);
				//console.log("doseVo.ddCycle 타입 : " + typeof ${doseVo.ddCycle}); // 콘솔 값 출력 test - type = number
				day += ${doseVo.ddCycle};
				//console.log("day 타입 : " + typeof day); // 콘솔 값 출력 test - type = number
				day = String(day).padStart(2,'0'); // day 값이 10 미만일 경우 고려하여 두 자리, 빈 자리는 0으로 채우도록 포매팅
				//console.log("포매팅 후 day 타입 : " + typeof day); // 콘솔 값 출력 test - type = string
				
				// newddStartDate = 문자열 합치기 (기존시작일yyyy + 기존시작일mm + 주기에 따라 새롭게 변경된 day + " " + 기존복용시간)
				//console.log("doseVo.ddTime 타입 : " + typeof "${doseVo.ddTime}"); // 콘솔 값 출력 test - type = string
				var reserveTime = arr[0] + "-" + arr[1] + "-" + day + " " + "${doseVo.ddTime}";
				//console.log("reserveTime 값 : " + reserveTime); // 콘솔 값 출력 test - type = string
				//console.log("reserveTime 타입 : " + typeof reserveTime); // 콘솔 값 출력 test - type = string
				
				
/* 				console.log("${doseVo.doseFamName }");
				console.log(notiHp);
				console.log(reserveTime);
				 doseNotiArr.push({
	    			notiUserName:"${doseVo.doseFamName }",
	    			notiMemHp:notiHp,
	    			reserveTime:reserveTime
	    		});
	    		
				console.log(doseNotiArr); */
				</c:if>
		}
	}
	</script> -->
	<script>
	window.onload = function() {
		document.getElementById('notiApplyBtn').onclick = function() {
			var notiHp = document.getElementById("notiHp").value;
			var notiUserName = document.getElementById("notiUserName").value;
			var notiStartDate = document.getElementById("notiStartDate").value;
			var notiTime = document.getElementById("notiTime").value;
			
			if (notiHp === "") {
				alert("알림 수신 번호를 입력하세요.");
				return false;
			}
			
			$.ajax({
				type:"post",
				url:"/sendSMS",
 				data: {
					"notiUserName": notiUserName,
					"notiHp": notiHp,
					"reserveTime": notiStartDate,
					"notiTime": notiTime
				},
/* 				dataType: "text", */
				success:function(result){
					alert("복용 알림 신청이 완료되었습니다.");
				}, error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}
	}

	</script>
	
	<!-- <script>
		
		
		// 조건절 작성 위한 데이터 처리 작업
		<c:set var="startDB" value="${doseVo.ddStartDate}" />
		<c:set var="endDB" value="${doseVo.ddEndDate}" />
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
		
		for (var i=startFmt; i<endFmt; i+=${doseVo.ddCycle}) {
			if(${doseVo.ddCycle}<=0) break;
			if(i+${doseVo.ddCycle}>(endFmt)) break;
			//console.log(i); // 제대로 바뀌고 있음 
			
			var strStart = String(i);
			//console.log(strStart);
			var strFmtStart = moment(strStart, "YYYYMMDD").format("YYYY-MM-DD");
			//console.log(strFmtStart);
			
			/* 주기 반영하여 계산된 복용 정보 배열로 저장) */
			<c:if test="${endFmt-startFmt > 0}">
				var arr = String(strFmtStart).split("-"); /* yyyy, mm, dd로 잘려 배열에 저장됨, 각 요소는 문자열 형태, dd=arr[2] */
				//console.log(arr); // 콘솔 값 출력 test
				
				// arr[2]를 숫자타입으로 변경 후, 복용주기와 덧셈 연산 -> 다시 문자열로 변경
				//console.log("arr[2] 타입 : " + typeof arr[2]); // 콘솔 값 출력 test - type = string
				var day = parseInt(arr[2]);
				//console.log("day 값 : " + day);
				//console.log("doseVo.ddCycle 타입 : " + typeof ${doseVo.ddCycle}); // 콘솔 값 출력 test - type = number
				day += ${doseVo.ddCycle};
				//console.log("day 타입 : " + typeof day); // 콘솔 값 출력 test - type = number
				day = String(day).padStart(2,'0'); // day 값이 10 미만일 경우 고려하여 두 자리, 빈 자리는 0으로 채우도록 포매팅
				//console.log("포매팅 후 day 타입 : " + typeof day); // 콘솔 값 출력 test - type = string
				
				// newddStartDate = 문자열 합치기 (기존시작일yyyy + 기존시작일mm + 주기에 따라 새롭게 변경된 day + " " + 기존복용시간)
				//console.log("doseVo.ddTime 타입 : " + typeof "${doseVo.ddTime}"); // 콘솔 값 출력 test - type = string
				var reserveTime = arr[0] + "-" + arr[1] + "-" + day + " " + "${doseVo.ddTime}";
				//console.log("reserveTime 값 : " + reserveTime); // 콘솔 값 출력 test - type = string
				//console.log("reserveTime 타입 : " + typeof reserveTime); // 콘솔 값 출력 test - type = string
				
				
				console.log("${doseVo.doseFamName }");
				console.log(notiHp);
				console.log(reserveTime);
/* 				var doseNotiArr.push({
	    			notiUserName:"${doseVo.doseFamName }",
	    			notiMemHp:notiHp,
	    			reserveTime:"${doseVo.ddStartDate}" // 시작일로
	    		});
	    		
				console.log(doseNotiArr); */
				</c:if>
				
		}
		
			/* 배열  */
			
			$.ajax({
				type:"post",
				url:"sendSMS",
				data: formData, // 앞 쪽의 doseNotiArr : 컨트롤러에서 받는 key 값
/* 				data: {
					notiUserName:"${doseVo.doseFamName }",
					notiHp: notiHp,
					reserveTime:"${doseVo.ddStartDate}"
				}, */
				dataType: "text",
				success:function(result){
					alert("복용 알림 신청이 완료되었습니다.");
				}, error:function(request,status,error){
			        alert("code = "+ request.status + " message = " + request.responseText + " error = " + error); // 실패 시 처리
			       
				}
			});
		})
	})
	</script> -->
	<script type="text/javascript">
		function deleteCheck(){
			var answer = confirm("해당 복용 정보를 목록에서 삭제하시겠습니까?");
			if(answer == true){
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
		          'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbdrK0s%2FbtrxeKeYY5R%2FyfA6UYBHaoO2pwKCevDvY0%2Fimg.png',
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
	<script>
	 function doseNoti() {
		 /* modal */
			var modal = new tingle.modal({
			    footer: false,
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
			
			modal.setContent('<div id="doseNotiBox"><form id="notiForm"><div id="notiLineBox"><h3>복용 알림 서비스 신청</h3><div class="doseNotiItem" id="notiNameBox"><input id="notiUserName" name="notiUserName" type="text" value=${doseVo.doseFamName } /><span>님</span><p>클릭하여 수신자명 변경 가능</p></div><div class="doseNotiItem" id="notiDateBox"><span>복용기간</span><input id="notiStartDate" name="notiStartDate" type="text" value=${doseVo.ddStartDate } readonly/><span>~</span><input id="notiEndDate" name="notiEndDate" type="text" value=${doseVo.ddEndDate } readonly/></div><div class="doseNotiItem" id="notiCycleBox"><span>주기</span><input id="notiCycle" name="notiCycle" type="text" value=${doseVo.ddCycle } readonly/><span>일</span></div><div class="doseNotiItem" id="notiTimeBox"><span>알림 수신 시간</span><input id="notiTime" name="notiTime" type="text" value=${doseVo.ddTime } readonly/></div><div id="notiHpBox"><span>알림 수신 번호</span><input id="notiHp" name="notiHp" type="text" placeholder="- 제외하고 입력해주세요." /></div><input id="notiApplyBtn" type="submit" value="신청하기" /></div></form></div>');
			modal.open();
	 }
	</script>
</html>