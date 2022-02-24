<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="/css/dashboard/dashboard.css" />
		<link rel="stylesheet" href="/css/dashboard/family/familyView.css" />
 
</head>
<body>
		<div id="wrap">
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
			<h3>체형관리 수정</h3>

				
				<div class="main-Content-Body low">
					<div class="basket-Item-Container colunm">
					
					
					<form id="updateBodyForm" method="post" action="<c:url value='/updateBody'/>">
					  	<input type="hidden" id="bodyNo" name="bodyNo" value="${body.bodyNo}"/>
					  	<input type="hidden" id="famNo" name="famNo" value="${body.famNo}"/>
					  	<div>
							<h3>키 </h3><input type="text" id="height" name="height" value="${body.height}" onchange="change()"/>
						</div>
						<div>
							<h3>몸무게 </h3><input type="text" id="weight" name="weight" value="${body.weight}" onchange="change()"/>
						</div>
						<div>
							<h3>BMI</h3><input type="text" id="bmi" name="bmi" value="${body.bmi}"/>
                         </div>
                         <div>
							<h3>기록날짜</h3><input type="date" id="bodyRecordDate" name="bodyRecordDate" value="${body.bodyRecordDate}"/>
							<input type="hidden" name="famNo" value="${famNo}" />
						 </div>
						 <div>
							<input type="submit" value="수정">
						 </div>
					  </form> 
					</div>
			</div>
				
	  <script>
      
		  let height = document.getElementById('height')
	      let weight = document.getElementById('weight')
	      let bmi = document.getElementById('bmi')
      
	      function change() {
		      
		      let h = parseInt(height.value)
		      let w = parseInt(weight.value)
		      let b = w / ((h * h)/10000)
		      b = Math.round(b)
		      
		      console.log(b)
		      
		      bmi.value = b
		      
		  }

      </script>	
		</section>
		 <!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
			
</body>
</html>