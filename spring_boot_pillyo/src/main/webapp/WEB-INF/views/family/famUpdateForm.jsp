<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>가족 정보 수정 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="/css/dashboard/dashboardContent.css" />
		<link rel="stylesheet" href="/css/dashboard/dashboard.css" />
		<link rel="stylesheet" href="/css/dashboard/family/familyView.css" />
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<div id="navMargin"></div>
		<section id="section" class="calum">
		
				<h1>가족 수정</h1>
				<hr>
				<div class="main-Content-Body low">

					<div class="basket-Item-Container colunm">
					  <form methond="post" action="<c:url value='/famUpdate'/>" class="insertForm">
					  	<input type="hidden" name="famNo" value="${famVo.famNo}">
						<div>
							<h4>이름</h4><input type="text" name="famMember" value="${famVo.famMember}">
						</div>
						<div>
							<h4>생년월일</h4><input type="date" name="famBirth" value="${famVo.famBirth}">
                            <input type="hidden" name="userId" value="${ sessionScope.sid }"/>
                         </div>
                         <div style="display : flex;">
							<h3>성별</h3>
							<div class="low"><input type="radio" id="famGender0" name="famGender" value="0" style="width:100px">남성
                            <input type="radio" id="famGender1" name="famGender" value="1" style="width:100px">여성</div>
                         </div>
                         <div>
							<input type="submit" id="famSubmitBtn" value="등록">
						 </div>
						 <div>
							<input type="reset" id="famResetBtn" value="취소">
						 </div>
					  </form> 
                    </div>

				</div>
				
        </section>
        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
	<script>
		window.onload = function() {
			var checkedRadio = document.getElementsByName('famGender');
			if (${famVo.famGender} == 0) {
				checkedRadio[0].checked = true;
		    } else {
		    	checkedRadio[1].checked = true;
		    }
		}
	</script>
</html>