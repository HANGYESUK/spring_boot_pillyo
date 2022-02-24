<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

	<script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <!-- 제이쿼리 -->
    <script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"></script>

    <!-- 폰트어썸 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />


	<link rel="stylesheet" href="/css/dashboard/dashboardContent.css" />
	<link rel="stylesheet" href="/css/dashboard/dashboard.css" />
	<link rel="stylesheet" href="/css/dashboard/family/familyView.css" />



	<script src="./jquery.fullPage.js"></script>
    <title>Document</title>
</head>
<body>

	<div id="wrap">
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section" class="calum">
			<h2>가족관리</h2>
			<hr>
			
			
				<div class="main-Content-Body low">

					<div class="basket-Item-Container colunm">
					  <form methond="post" action="<c:url value='/famInsert'/>" class="insertForm">
					  	<input type="hidden" name="famNo" value="${famVo.famNo}">
					  
					  	<div>
							<h3>이름 </h3><input type="text" id="famMember" name="famMember" >
						</div>
						<div>
							<h3>생년월일 </h3><input type="date" id="famBirth" name="famBirth" />
						</div>
						<div style="display : flex;">
							<h3>성별</h3>
							<div class="low"><input type="radio" id="famGender0" name="famGender" value="0" style="width:100px">남성
                            <input type="radio" id="famGender1" name="famGender" value="1" style="width:100px">여성</div>
                            <input type="hidden" name="userId" value="${ sessionScope.sid }"/>
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
		</div>


  
</body>
</html>