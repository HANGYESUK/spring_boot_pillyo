<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>우리집 상비약 메인 페이지</title>
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

	<script src="./jquery.fullPage.js"></script>
	
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
	<script type="text/javascript">

	</script>
	
</head>
<body>

	<div class="container low">
		<div class="dashboard low">
			<div class="profile">
				<div class="profile-Box colum">
					<h1>Pill-Yo</h1>
					<div class="profile-My-Box low">
						<dvi class="proflie-Img">
							<img src="./img/루피.jpg" class="loopy">
						</dvi>
						<div class="profile-Text">
							<h3>홍길동</h3>
							<h4>나이 : 26</h4>
						</div>
					</div>
					<div class="profile-Family low">
						
						  <c:forEach items="${famList }" var="fam">
						   	<a href="/dashboard2/${fam.famNo}">
							   	<div class="profile-Family-Icon" style="text-align: center;">
							   		<h4>${ fam.famMember}</h4>
							   		<input type="hidden" class="prInfo" value="☌">
								</div>
								<!-- test1 -->
							</a>
						  </c:forEach>

					</div>
				</div>
				<div class="btn-Container colum">
					<div class="btn low"><h4>공지사항</h4></div>
					<div class="btn low"><h4>약국찾기</h4></div>
					<div class="btn low"><h4>맞춤추천</h4></div>
					<div class="btn low"><h4>복용하기</h4></div>
					<div class="btn low"><h4>마이페이지</h4></div>
					<div class="btn low"><h4>로그아웃</h4></div>
				</div>
			</div>
			<div class="main-Content-Container">
				<div class="main-Content-Header colum">
					<nav id="main-navigation">
						<div class="pull-right fix low">
							<div class="outer-menu">
								<div class="outer-menu-btn"><a href="/"><h5>HOME</h5></a></div>
								<div class="outer-menu-btn"><a href="#"><h5>복용관리</h5></a></div>
								<div class="outer-menu-btn"><a href="/hmForm"><h5>우리집 약관리</h5></a></div>
								<div class="outer-menu-btn"><a href="#"><h5>가족관리</h5></a></div>
								<div class="outer-menu-btn"><a href="#"><h5>건강관리</h5></a></div>
							</div>
				  
							<div class="search-bar">
								<form>
									<input type="text" class="input-search" placeholder="약에 대한 정보를 얻고 싶으시면 이곳에 입력해주세요">
									<input type="submit" class="input-search-submit" value="☌">
								</form>
							</div>
						</div>
					</nav>
				</div>

				<!-- 일단 여기 내용만 바꾸기
					 나중에 ajax 기능 사용할 것-->
					 
				<div class="main-Content-Body_Center">
					<div class = "hm">
					<h2 id ="hmName">우리집 약관리</h2>
						<hr><br>
						<c:if test="${not empty sessionScope.sid}">
							<h4 id="UserName">${sessionScope.sid} 님</h4>
							<p>등록하신 우리집 상비약 목록 입니다 </p><br><br>
						</c:if>
						
						<!-- 약 카테고리 -->
						<div class="hm_Category"> 
							<form>
								<br> <h3> 약 카테고리</h3> <br><br>
								<input type="button" id="hm_ctg" value="두통약" />
								<input type="button" id="hm_ctg" value="감기약" />
								<input type="button" id="hm_ctg" value="소화제" />
								<input type="button" id="hm_ctg" value="해열제" />
								<input type="button" id="hm_ctg" value="진통제" />
								<input type="button" id="hm_ctg" value="치통약" />
								<input type="button" id="hm_ctg" value="연고/파스" />
								<input type="button" id="hm_ctg" value="기타" />			
							</form>
						</div><!-- hm_Category -->
						
						<!-- 선택한 카테고리의 약 목록 -->
						<div class="hm_List">
							<form>
								<br> <h3> 약 목록</h3> <br>
								<div class="hm_List_view">
									<table id="list_table">
										<tr> <th>사진</th><th>제품명</th> <th>사용기간</th></tr>
										
									</table>
									<a href="/insertHm">
									<input type="button" value="등록하러가기"></a>
								</div>
							</form>
						</div><!-- hm_List -->
						
					</div><!-- hm -->
				</div>
				
				<div class="main-Content-Body low">
				</div>


			</div>
		</div>
	</div>
</body>
</html>