<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>우리집 상비약 메인 페이지</title>
    <script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	<!-- <script src="/js/hmListView.js"></script> -->
	<!-- 임시 css / script-->
	
	<link rel="stylesheet" href="/css/hm/hmForm.css" />
	

</head>
<body>
	<div id="wrap">
			
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		
		<div id="navMargin"></div>
		<section id="section">
			<div class="main-Content-Body low">
				<div class="basket-Item-Container colunm">
					<h2 id ="hmName">우리집 약관리</h2>
					<div class="low">
						<c:if test="${not empty sessionScope.sid}">
							<h4 id="UserName" style="color: #81B89A;">${sessionScope.sid} 님</h4>
							<p>등록하신 우리집 상비약 목록 입니다 </p><br>
						</c:if>
					</div>
						
					<div id="hm">
						<!-- 약 카테고리 -->
						<div class="hm_Category colum"> 
							<form id="hmCtg_ListView low">
								<br> <h3> 약 카테고리</h3> <br>
								<!-- <button type="button" id="hm_ctg" value="1" onclick="go(this.value)"> -->
								<!-- <input type="text" id="hmCtgInput">
								<input type="submit" value="전송"> -->
								
								<button type="button" id="hm_ctg" value="1" onclick="go(this.value)">
								<img src="./img/hm/두통.png" alt="" style="width:45px; height:45px;"><br>
								<span>두통약</span></button>
								
								<button type="button" id="hm_ctg" value="2" onclick="go(this.value)">
								<img src="./img/hm/감기.png" alt="" style="width:45px; height:45px;"><br>
								<span>감기약</span></button>
								
								<button type="button" id="hm_ctg" value="3" onclick="go(this.value)">
								<img src="./img/hm/소화.png" alt="" style="width:45px; height:45px;"><br>
								<span>소화제</span></button>
								
								<button type="button" id="hm_ctg" value="4" onclick="go(this.value)">
								<img src="./img/hm/해열.png" alt="" style="width:45px; height:45px;"><br>
								<span>해열제</span></button>
								
								<button type="button" id="hm_ctg" value="5" onclick="go(this.value)">
								<img src="./img/hm/진통.png" alt="" style="width:45px; height:45px;"><br>
								<span>진통제</span></button>
								
								<button type="button" id="hm_ctg" value="6" onclick="go(this.value)">
								<img src="./img/hm/치통.png" alt="" style="width:45px; height:45px;"><br>
								<span>치통약</span></button>
								 
								<button type="button" id="hm_ctg" value="7" onclick="go(this.value)">
								<img src="./img/hm/연고.png" alt="" style="width:45px; height:45px;"><br>
								<span>연고/파스</span></button>
								
								<button type="button" id="hm_ctg" value="8" onclick="go(this.value)">
								<img src="./img/hm/기타.png" alt="" style="width:45px; height:45px;"><br>
								<span>기타</span></button>
								
							</form>
						</div><!-- hm_Category -->
						
						<!-- 선택한 카테고리의 약 목록 -->
						<div class="hm_List">
							<iframe id="iframeUrl" name="iframeUrl" src="http://localhost:8082/listCtgHm/1"></iframe>
							<%-- <jsp:include page="/WEB-INF/views/household_medicine/hmListView.jsp" flush='true' /> --%>	
							
							<script>
								function go(a) {
					                console.log(a)
					                let url = "http://localhost:8082/listCtgHm/"
					                console.log(url + (a))
					                document.getElementById('iframeUrl').src = url + (a)
					            }
							</script>
							<div style="margin-top: 20px">
								<a href="/insertHmForm">
								<input type="button" class="btn" value="등록하러가기"></a>
								
								<a href="/insertHmResult">
								<input type="button" class="btn" value="등록된 전체 목록 보러가기"></a>
							</div>
						</div>
						<br>
					</div><!-- hm -->
				</div>
			</div>
		</section>
	
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div><!-- wrap -->
	</body>
</html>