<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>혈당 정보 수정 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='sugarForm.js'/>"></script>
		
		<link rel="stylesheet" href="/css/dashboard/dashboard.css" />
		<link rel="stylesheet" href="/css/dashboard/family/familyView.css" />
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		<div id="navMargin"></div>
		
		<section id="section">
			<div class="main-Content-Body low">
					<div class="basket-Item-Container colunm">
							<h1>혈당관리 수정</h1>
							<br><br>
					<form id="updateSugarForm" method="post" action="<c:url value='/updateSugar'/>">
					  	<div>
							<h3>혈당관리번호 </h3><input type="text" id="sugarNo" name="sugarNo" value="${sugar.sugarNo}"/>
						</div>
						<div>
							<h3>투약 </h3><input type="text" id="sugarMedication" name="sugarMedication" value="${sugar.sugarMedication}"/>
						</div>
						
						<div >
							<h3>식사여부</h3>
							<div class="low">
								<input type="radio" id="ac" name="acpc" value="식전" <c:if test='${sugar.acpc eq "식전"}'>checked="checked"</c:if>/>식전
                            	<input type="radio" id="pc" name="acpc" value="식후"<c:if test='${sugar.acpc eq "식후"}'>checked="checked"</c:if>/><br>식후
                            </div>
                            <input type="hidden" name="userId" value="${ sessionScope.sid }"/>
                         </div>
                         
                         <div>
							<h3>혈당수치</h3><input type="text" id="sugarLevel" name="sugarLevel" value="${sugar.sugarLevel}"/>
                         </div>
                         <div>
							<h3>메모</h3><input type="text" id="acpcMemo" name="acpcMemo" value="${sugar.acpcMemo}"/>
                         </div>
                          <div>
							<h3>기록날짜</h3><input type="date" id="sugarRecordDate" name="sugarRecordDate" value="${sugar.sugarRecordDate}"/>
                         </div>
                         <div>
							<h3>기록시간</h3><input type="time" id="sugarRecordTime" name="sugarRecordTime" value="${sugar.sugarRecordTime}"/>
							<input type="hidden" id="famNo" name="famNo" value="${sugar.famNo}"/>
                         </div>
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