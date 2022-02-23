<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>우리집 상비약 메인 페이지</title>
	<script src="/js/hmListView.js"></script>
	<!-- 임시 css / script-->
	<style type="text/css">
	
	h2{ color : black;}
	h3{ color : black;}
	
	p{	color : black;}
	
	#UserName{
		color : #81B89A;
	}
	
	.hm{
		width : 95%;
		margin:0 auto;
		
	}
	.hm_Category{
		width : 48%;
		height : 350px;
		background-color : white;
		text-align : center;
		float: left;
		margin:0 auto;
	}
	.hm_List{
		width : 48%;
		height : 350px;
		background-color : #B2D6C7;
		text-align : center;
		float: left;
		margin-left:15px;
	}
	.hm_List_view{
		widht : 100px;
		height : 300px;
		background-color : white;
		overflow : auto;
	}
	table{
		border: 1px solid #444444;
    	border-collapse: collapse;
		color : black;
		
		margin:0 auto;
	}
	th,td{
		border: 1px solid #444444;
	}
	#hm_ctg{
		width : 80px;
		height : 80px;
		margin-left:5px;
		margin-right:5px;
		margin-bottom:10px;
	}

	</style>

</head>
<body>
	<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		
		<div id="navMargin"></div>
		<section id="section">
				<h2 id ="hmName">우리집 약관리</h2>
				<hr><br>
				<c:if test="${not empty sessionScope.sid}">
					<h4 id="UserName">${sessionScope.sid} 님</h4>
					<p>등록하신 우리집 상비약 목록 입니다 </p><br><br>
				</c:if>
				
				<div id="hm">
				<!-- 약 카테고리 -->
				<div class="hm_Category"> 
					<form id="hmCtg_ListView">
						<br> <h3> 약 카테고리</h3> <br><br>
						<!-- <button type="button" id="hm_ctg" value="1" onclick="go(this.value)"> -->
						<!-- <input type="text" id="hmCtgInput">
						<input type="submit" value="전송"> -->
						
						<button type="submit" id="hm_ctg" value="1" >
						<img src="./img/hm/두통.png" alt="" style="width:45px; height:45px;"><br>
						<span>두통약</span></button>
						
						<button type="submit" id="hm_ctg" value="2">
						<img src="./img/hm/감기.png" alt="" style="width:45px; height:45px;"><br>
						<span>감기약</span></button>
						
						<button type="submit" id="hm_ctg" value="3">
						<img src="./img/hm/소화.png" alt="" style="width:45px; height:45px;"><br>
						<span>소화제</span></button>
						
						<button type="submit" id="hm_ctg" value="4">
						<img src="./img/hm/해열.png" alt="" style="width:45px; height:45px;"><br>
						<span>해열제</span></button>
						
						<button type="submit" id="hm_ctg" value="5">
						<img src="./img/hm/진통.png" alt="" style="width:45px; height:45px;"><br>
						<span>진통제</span></button>
						
						<button type="submit" id="hm_ctg" value="6" >
						<img src="./img/hm/치통.png" alt="" style="width:45px; height:45px;"><br>
						<span>치통약</span></button>
						 
						<button type="submit" id="hm_ctg" value="7" >
						<img src="./img/hm/연고.png" alt="" style="width:45px; height:45px;"><br>
						<span>연고/파스</span></button>
						
						<button type="submit" id="hm_ctg" value="8">
						<img src="./img/hm/기타.png" alt="" style="width:45px; height:45px;"><br>
						<span>기타</span></button>
						
						<!-- <script>
						    function go(a) {
						    	 window.location.href = "/listCtgHm/" + a
					        }
						
						</script> -->
					</form>
				</div><!-- hm_Category -->
				
				<!-- 선택한 카테고리의 약 목록 -->
				<div class="hm_List">
					<form>
						<br> <h3> 약 목록</h3> <br>
						<jsp:include page="/WEB-INF/views/household_medicine/hmListView.jsp" flush='true' />
					</form>
				</div>
			</div><!-- hm -->
		</section>
	
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div><!-- wrap -->
	</body>
</html>