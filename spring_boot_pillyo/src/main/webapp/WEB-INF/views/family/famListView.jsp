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

					<div class="basket-Item-Container low">
	                       <c:forEach items="${famList }" var="fam">
								<div class="Union colum">
									<div class="family-Box colum">
										<div class="pill-Img-Box low"> 
											<h3>${fam.famMember }</h3>
										</div>
										<p>${fam.famBirth }</p>
										<a href="<c:url value='/famUpdateForm/${fam.famNo}'/>">
											<div class="update-Btn low">
												<h3>수   정</h3>
											</div>
										</a>
										<a href="javascript:deleteCheck();">
											<div class="delete-Btn low">
												<h3>삭   제</h3>
											</div>
										</a>
									</div>
								</div>
								<script>
									function deleteCheck(){
										var answer = confirm("해당 가족 구성원을 목록에서 삭제하시겠습니까?");
										if(answer == true){
											location.href="/famDelete/${fam.famNo}";
										}
									}
								</script>
						   </c:forEach>	
						   <a href="<c:url value = '/famInsertForm'/>">
						   		<div id="famPlusBtn" class="colum"><p>+</p></div>
						   </a>
                    </div>
					

				</div>
			 
			 </section>
			 <!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		</div>


  
</body>
</html>