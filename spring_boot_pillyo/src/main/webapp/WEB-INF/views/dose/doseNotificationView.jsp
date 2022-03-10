<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>복용 알림 관리 테스트 페이지</title>
		<link rel="stylesheet" href="/css/dose/doseNotification.css" />
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
				
			<section id="section">
				<div id="doseNotiBox">
					<form id="doseNotiForm" methond="post" action="/updateNoti">
						알림번호<input type="text" value="${notification.doseNotiNo }"/>
						아이디<input type="text" value="${notification.userId }"/><br>
						기상직후 O<input type="radio" id="afterGetUpYes" name="afterGetUp" value="1"> X<input type="radio" id="afterGetUpNo" name="afterGetUp" value="0">
						아침 O<input type="radio" id="morningYes" name="morning" value="1"> X<input type="radio" id="morningNo" name="morning" value="0">
						점심 O<input type="radio" id="lunchYes" name="lunch" value="1"> X<input type="radio" id="lunchNo" name="lunch" value="0">
						저녁 O<input type="radio" id="dinnerYes" name="dinner" value="1"> X<input type="radio" id="dinnerNo" name="dinner" value="0">
						취침전 O<input type="radio" id="beforeBedYes" name="beforeBed" value="1"> X<input type="radio" id="beforeBedNo" name="beforeBed" value="0">
						
						기상직후<input type="text" name="afterGetUpTxt" value="${notification.afterGetup}"/><br>
						아침<input type="text" name="morningTxt" value="${notification.morning}"/><br>
						점심<input type="text" name="lunchTxt" value="${notification.lunch}"/><br>
						저녁<input type="text" name="dinnerTxt" value="${notification.dinner}"/><br>
						취침전<input type="text" name="beforeBedTxt" value="${notification.beforeBed}"/><br>
						<!-- <br>
						<h3>알람 수신 여부 설정</h3>
						기상직후
						<p class="btn-switch">
							<input type="radio" id="afterGetUp_yes" name="afterGetUpRdo" value="1" class="btn-switch__radio btn-switch__radio_yes" />
							<input type="radio" checked id="afterGetUp_no" name="afterGetUpRdo" value="0" class="btn-switch__radio btn-switch__radio_no" />
							<label for="afterGetUp_yes" class="btn-switch__label btn-switch__label_yes"><span class="btn-switch__txt">O</span></label>		
							<label for="afterGetUp_no" class="btn-switch__label btn-switch__label_no"><span class="btn-switch__txt">X</span></label>
						</p>
						
						아침
						<p class="btn-switch">
							<input type="radio" id="morning_yes" name="morningRdo" value="1" class="btn-switch__radio btn-switch__radio_yes" />
							<input type="radio" checked id="morning_no" name="morningRdo" value="0" class="btn-switch__radio btn-switch__radio_no" />
							<label for="morning_yes" class="btn-switch__label btn-switch__label_yes"><span class="btn-switch__txt">O</span></label>		
							<label for="morning_no" class="btn-switch__label btn-switch__label_no"><span class="btn-switch__txt">X</span></label>
						</p>
						
						점심
						<p class="btn-switch">
							<input type="radio" id="lunch_yes" name="lunchRdo" value="1" class="btn-switch__radio btn-switch__radio_yes" />
							<input type="radio" checked id="lunch_no" name="lunchRdo" value="0" class="btn-switch__radio btn-switch__radio_no" />
							<label for="lunch_yes" class="btn-switch__label btn-switch__label_yes"><span class="btn-switch__txt">O</span></label>		
							<label for="lunch_no" class="btn-switch__label btn-switch__label_no"><span class="btn-switch__txt">X</span></label>
						</p>
						
						저녁
						<p class="btn-switch">
							<input type="radio" id="dinner_yes" name="dinnerRdo" value="1" class="btn-switch__radio btn-switch__radio_yes" />
							<input type="radio" checked id="dinner_no" name="dinnerRdo" value="0" class="btn-switch__radio btn-switch__radio_no" />
							<label for="dinner_yes" class="btn-switch__label btn-switch__label_yes"><span class="btn-switch__txt">O</span></label>		
							<label for="dinner_no" class="btn-switch__label btn-switch__label_no"><span class="btn-switch__txt">X</span></label>
						</p>
						
						취침전
						<p class="btn-switch">
							<input type="radio" id="beforeBed_yes" name="beforeBedRdo" value="1" class="btn-switch__radio btn-switch__radio_yes" />
							<input type="radio" checked id="beforeBed_no" name="beforeBedRdo" value="0" class="btn-switch__radio btn-switch__radio_no" />
							<label for="beforeBed_yes" class="btn-switch__label btn-switch__label_yes"><span class="btn-switch__txt">O</span></label>		
							<label for="beforeBed_no" class="btn-switch__label btn-switch__label_no"><span class="btn-switch__txt">X</span></label>
						</p> -->
						
						<input type="submit" id="updateBtn" value="수정">
            		</form>
				</div>
			</section>
			
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
	<script type="text/javascript">
/* 		$(document).ready(function() {
			console.log("${notification.afterGetup}");
			if ($('input[name="afterGetUp"]').val() == ${notification.afterGetup}) {
				$('input[name="afterGetUpRdo"]').prop('checked', true);
			} else {
				$('input[name="afterGetUpRdo"]').prop('checked', false);
			}
			
		}); */
		
		
		
/* 		기상직후<input type="text" name="afterGetUpTxt" value="${notification.afterGetup}"/><br>
		아침<input type="text" name="morningTxt" value="${notification.morning}"/><br>
		점심<input type="text" name="lunchTxt" value="${notification.lunch}"/><br>
		저녁<input type="text" name="dinnerTxt" value="${notification.dinner}"/><br>
		취침전<input type="text" name="beforeBedTxt" value="${notification.beforeBed}"/><br> */
		
		$('input[name="afterGetUp"]').change(function(){
			var noti = $('input[name="afterGetUp"]').val();
			console.log(noti);
			$('input[name="afterGetUpTxt"]').val(noti);
		});
	</script>
</html>