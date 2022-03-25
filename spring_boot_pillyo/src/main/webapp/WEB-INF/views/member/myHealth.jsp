<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>나의 건강관리</title>
   		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
   		<style type="text/css">
   		
   		#myHealthBox{
   			width : 80%;
   			margin-left : 200px;
   			padding-top : 20px;
   			text-align: center;
   		} 
   		#bodyList_Btn{
   			width : 450px;
   			height : 150px;
			border : 0;
			outline:0;
			background: linear-gradient(0deg, rgba(255, 97, 63, 0.1), rgba(255, 97, 63, 0.1)), linear-gradient(90deg, #FFA4A4 0%, rgba(255, 86, 86, 0.588542) 38.44%, rgba(255, 20, 20, 0) 101.11%), linear-gradient(96.41deg, rgba(255, 0, 0, 0.2) 0%, rgba(255, 242, 209, 0.2) 99%);
			box-shadow: 1px 4px 10px rgba(0, 0, 0, 0.15);
			border-radius: 15px;
   			margin-right : 20px;
   			margin-bottom : 20px;
		}
   		#feelList_Btn{
	   		width: 450px;
			height: 150px;
			border : 0;
			outline:0;
			background: linear-gradient(0deg, rgba(255, 236, 63, 0.1), rgba(255, 236, 63, 0.1)), linear-gradient(90deg, #E7FFA4 0%, rgba(255, 208, 86, 0.588542) 38.44%, rgba(255, 246, 20, 0) 101.11%), linear-gradient(96.41deg, rgba(255, 184, 0, 0.2) 0%, rgba(216, 255, 209, 0.2) 99%);
			box-shadow: 1px 4px 10px rgba(0, 0, 0, 0.15);
			border-radius: 15px;
   			margin-right : 20px;
   			margin-bottom : 20px;
   		}
   		#pressureList_Btn{
	   		width: 450px;
			height: 150px;
			border : 0;
			outline:0;
			background: linear-gradient(0deg, rgba(90, 255, 63, 0.1), rgba(90, 255, 63, 0.1)), linear-gradient(90deg, #A4FFB8 0%, rgba(89, 255, 86, 0.588542) 38.44%, rgba(20, 255, 58, 0) 101.11%), linear-gradient(96.41deg, rgba(0, 255, 56, 0.2) 0%, rgba(209, 255, 255, 0.2) 99%);
			box-shadow: 1px 4px 10px rgba(0, 0, 0, 0.15);
			border-radius: 15px;
   			margin-right : 20px;
   			margin-bottom : 20px;
   		}
   		#sugarList_Btn{
   			width: 450px;
			height: 150px;
			border : 0;
			outline:0;
			background: linear-gradient(0deg, rgba(63, 255, 243, 0.1), rgba(63, 255, 243, 0.1)), linear-gradient(90deg, #A4A7FF 0%, rgba(86, 164, 255, 0.588542) 38.44%, rgba(42, 178, 255, 0.197829) 80.05%, rgba(20, 185, 255, 0) 101.11%), linear-gradient(96.41deg, rgba(0, 255, 240, 0.2) 0%, rgba(209, 255, 255, 0.2) 99%);
			box-shadow: 1px 4px 10px rgba(0, 0, 0, 0.15);
			border-radius: 15px;
   			margin-right : 20px;
   			margin-bottom : 20px;
   		}
   		span{
   			font-weight:bold ;
   			font-size:14px;
   		}
   		
   		#subTitle {
	font: bold 36px Avenir, Arial, georgia;
    color: #222222;
    /* padding-top: 30px; */
    position: relative;
    /* padding-bottom: 18px; */
    border-bottom: 1px solid #6d6d6d82;
    margin-bottom: 35px;
}

#subTitle > h2 {
	    font-size: 30px;
	        padding-left: 150px;
}

   		
   		</style>
    
	</head>
	<body>
		<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		<div id="navMargin"></div>
			
			<section id="section">
			<!-- 마이 페이지 메뉴 -->
					<jsp:include page="/WEB-INF/views/member/myPageMenu.jsp" flush='true' />
					<div id="subTitle"><h2>나의 건강정보</h2></div>
			
				<div id="myPageBox">
					
					
					<div id="myHealthBox">
						<c:if test="${not empty sessionScope.sid}">
							<h2>${sessionScope.sid} 님의 건강 리스트를 보러가시겠습니까?</h2> <br><br>
						</c:if>
						
						<a href="/myListAllBody">
						<button type="button" id="bodyList_Btn" value="체형 리스트">
						<img src="/img/mH/body-scan.png" alt="" style="width:100px; height:100px;"><br>
						<span>체형 기록</span></button></a>
						
						<a href="/myListAllFeel">
						<button type="button" id="feelList_Btn" value="기분 리스트">
						<img src="/img/mH/reaction.png" alt="" style="width:100px; height:100px;"><br>
						<span>기분 기록</span></button></a>
						
						<a href="/myListAllPressure">
						<button type="button" id="pressureList_Btn" value="혈압 리스트">
						<img src="/img/mH/blood-pressure.png" alt="" style="width:100px; height:100px;"><br>
						<span>혈압 기록</span></button></a>
						
						<a href="/myListAllSugar">
						<button type="button" id="sugarList_Btn" value="혈당 리스트">
						<img src="/img/mH/blood-test.png" alt="" style="width:100px; height:100px;"><br>
						<span>혈당 기록</span></button></a>
						
					</div><!-- myHealthBox -->
				</div>
			</section>
			
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
    	</div> <!-- wrap -->
	</body>
</html>