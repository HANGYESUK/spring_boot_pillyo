<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>체형 정보 등록 폼</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<script src="<c:url value='bodyForm.js'/>"></script>

		<link rel="stylesheet" href="/css/dashboard/dashboard.css" />
		<link rel="stylesheet" href="/css/dashboard/family/familyView.css" />
		
</head>
<body>
<div id="wrap">
		
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />

		<div id="navMargin"></div>
			
			<section id="section">
			<h3>체형 등록</h3>	
			<hr>
			
			<div class="main-Content-Body low">
					<div class="basket-Item-Container colunm">
					
					<form methond="post" action="<c:url value='/insertBody'/>" class="insertForm">

					  	<div>
							<h3>키 </h3><input type="text" id="height" name="height" onchange="change()">
						</div>
						<div>
							<h3>몸무게 </h3><input type="text" id="weight" name="weight" onchange="change()">
						</div>
						<div>
							<h3>BMI</h3><input type="text" name="bmi" id="bmi" readonly>
                         </div>
                         <div>
							<h3>기록날짜</h3><input type="date" id="bodyRecordDate" name="bodyRecordDate">
							<input type="hidden" name="famNo" value="${famNo}" />
						 </div>
						 <div>
							<input type="submit" value="등록">
						 </div>
						 <div>
							<input type="reset" id="famResetBtn" value="취소">
						 </div>
					  </form> 
					</div>
			</div>
			      </div> <!-- wrap -->
      
      <script>
      
		  let height = document.getElementById('height')
	      let weight = document.getElementById('weight')
	      let bmi = document.getElementById('bmi')
      
	      function change() {
		      
		      let h = parseInt(height.value)
		      let w = parseInt(weight.value)
		      let b = w / ((h * h)/10000)
		      b = Math.round(b)
		      
		      bmi.value = b
		      
		  }

      </script>
		
		</section>
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		

</body>
</html>