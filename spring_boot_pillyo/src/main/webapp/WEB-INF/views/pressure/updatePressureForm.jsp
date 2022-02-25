<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>혈당 등록</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='pressureForm.js'/>"></script>
		
		<link rel="stylesheet" href="/css/dashboard/dashboard.css" />
		<link rel="stylesheet" href="/css/dashboard/family/familyView.css" />
		
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		
		<section id="section">
			<div id="navMargin"></div>
			<div class="main-Content-Body low">
					<div class="basket-Item-Container colunm">
							<h1>혈압관리 수정</h1>
							<br><br>
					<form id="updateBodyForm" method="post" action="<c:url value='/updateBody'/>">
					  	<input type="hidden" id="bodyNo" name="bodyNo" value="${body.bodyNo}"/>
					  	<input type="hidden" id="famNo" name="famNo" value="${body.famNo}"/>
					  	<div>
							<h3>혈압관리번호 </h3><input type="text" id="pressureNo" name="pressureNo" value="${pressure.pressureNo}"/>
						</div>
						<div>
							<h3>상황 </h3><input type="text" id="situation" name="situation" value="${pressure.situation}"/>
						</div>
						<div>
							<h3>수축기 혈압</h3><input type="text" id="SBP" name="SBP" value="${pressure.SBP}"/>
                         </div>
                         <div>
							<h3>이완기 혈압</h3><input type="text" id="DBP" name="DBP" value="${pressure.DBP}"/>
                         </div>
                         <div>
							<h3>심박수</h3><input type="text" id="bpm" name="bpm" value="${pressure.bpm}"/>
                         </div>
                         <div>
							<h3>메모</h3><input type="text" id="pressureMemo" name="pressureMemo" value="${pressure.pressureMemo}"/>
                         </div>
                          <div>
							<h3>기록날짜</h3><input type="date" id="pressureRecordDate" name="pressureRecordDate" value="${pressure.pressureRecordDate}"/>
                         </div>
                         <div>
							<h3>기록시간</h3><input type="time" id="pressureRecordTime" name="pressureRecordTime" value="${pressure.pressureRecordTime}"/>
                         </div>
                         <input type="hidden" name="famNo" value="${famNo}" />
						 <div>
							<input type="submit" id="send_btn" value="수정하기">
						 </div>
						 <div>
							<input type="reset" id="reset_btn" value="취소하기">
						 </div>
					  </form> 
					</div>
			</div>	
			
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>