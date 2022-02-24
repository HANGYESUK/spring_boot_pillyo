<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>복용 상세 정보 조회</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		
		<!-- kakao developers -->
		<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
		
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
				
			<section id="section">
				복용 타이틀 : ${doseVo.ddTitle }<br>
				약 번호 : ${doseVo.drugInfoNo }<br>
				복용 시작 날짜 : ${doseVo.ddStartDate }<br>
				복용 종료 날짜 : ${doseVo.ddEndDate }<br>
				복용 주기 : ${doseVo.ddCycle }<br>
				복용 시기 : ${doseVo.ddTimeSlot }<br>
				복용 상세 시간 : ${doseVo.ddTime }<br>
				1회 복용량 : ${doseVo.ddAmount }<br>
				
				<label><button id="doseShareBtn" class="calBtn" onClick="sendLinkDefault();">복용 정보 공유하기</button></label>
				<a href="<c:url value='/doseUpdateForm/${doseVo.ddNo}'/>">복용 정보 수정</a><br>
				<a href="javascript:deleteCheck();">복용 정보 삭제</a><br>
			
				<script type="text/javascript">
					function deleteCheck(){
						var answer = confirm("해당 복용 정보를 목록에서 삭제하시겠습니까?");
						if(answer == true){
							location.href="/doseDelete/${doseVo.ddNo}";
						}
					}
				</script>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
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