<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>우리집 상비약 등록 페이지</title>
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
	
	<!-- 이미지 불러오는 java Script -->
	<script type="text/javascript">
	 function setThumbnail(event) { // 이미지 등록 버튼의 onchange
			var reader = new FileReader(); 	// 파일을 불러옴
		    
			reader.onload = function(event) { // 불러온 파일을 읽어 div#image_container에 넣음
				var image = document.createElement("img"); 
				image.setAttribute("src", event.target.result); 
				document.querySelector("div#image_container").appendChild(image);
				}
				
			reader.readAsDataURL(event.target.files[0]);
		}
	 </script>
	<!-- OCR 스크립트 -->
	<script src="<c:url value='/js/ocr.js'/>"></script>		
	<!-- 임시 Css -->
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
	table{
		color : black;
		margin:0 auto;
	}
	th{
		width : 100px;
	}
	.img_tr{
		text-align: center;
	}
	#img_box{
		border : 1px solid #A0A0A0;
	}
	#image_container{
		width: 300px;
		height: 300px;
	}
	#image_container img
	{
	  width: 300px;
	  height: 300px;
	}
	</style>
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
					<br><br><br><br>
					<h2 id ="hmName">우리집 약관리</h2>
						<hr><br>
						<c:if test="${not empty sessionScope.sid}">
							<h4 id="UserName">${sessionScope.sid} 님</h4>
							<p>어떤 약을 등록하실건가요? </p><br><br>
						</c:if>
						
					<!-- 상비약 등록 -->
					<form id = "hmForm" method="post" action="<c:url value ='/insertHm/insertHmResult'/>">
															  <!-- 등록이 완료되면 작성완료된 페이지로 이동 -->
						<table>
							<!-- OCR로 이미지 넣어서 글씨 출력 -->
							<tr class="hm_OCR_img"> <td rowspan="5" id="img_box"><div id="image_container"></div></td></tr>
							<tr> <th id="hm">약품명</th>	<td><input type="text" id="hmName" name="hmName"></td></tr>
							<tr> <th id="hm">카테고리</th>	<td><input type="text" id="hmCtgNo" name="hmCtgNo" list="hmCtgList">
															<datalist id="hmCtgList">
													            <option value="1">두통약</option>
													            <option value="2">감기약</option>
													            <option value="3">소화제</option>
													            <option value="4">해열제</option>
													            <option value="5">진통제</option>
													            <option value="6">치통약</option>
													            <option value="7">연고/파스</option>
													            <option value="8">기타</option>
												        	</datalist></td></tr>
							<tr> <th id="hm">사용기한</th>	<td><input type="date" name="hmUseByDate"></td></tr>
							<tr> <th id="hm">메모</th>	<td><textarea name="hmMemo" rows="10" cols="50" placeholder="내용을 입력하세요" style="resize: none;"></textarea></td>
							<tr> <th colspan="2" class="btn_box">
	   							<input  id = "img_btn" type="file" name="hmImg" accept="image/*" onchange="setThumbnail(event);">
	   							<input class = "in" type="submit" value="등록" >
	   							<input class = "in2" type="reset" value="취소">&nbsp;</th></tr>
						
						</table>
					</form>
					</div><!-- hm -->
				</div><!-- main-Content-Body_Center -->
				
				<div class="main-Content-Body low">
				</div>


			</div>
		</div>
	</div>
</body>
</html>