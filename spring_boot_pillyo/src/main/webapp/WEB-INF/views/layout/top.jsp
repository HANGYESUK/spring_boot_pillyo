<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/css/layout/common.css" />
	</head>
	<body>
		<div id="headerBox">
			<div id="logoBox">
				<div id="logo">Pill-yo</div>
				<marquee>
					220219 새로운 약 정보 업데이트!
				</marquee>
			</div>
			<div class="mainHeader">
				<div class="profileBox">
					<div class="proflieImg">
						<img src="./img/루피.jpg" class="loopy">
					</div>
					<div class="profileText">
						<h3>홍길동</h3>
						<h4>나이 : 26</h4>
					</div>
				</div>
				<div id="mainNavBox">
					<div class="mainNav">
						<!-- 로그인 하지 않은 경우 보여줄 메뉴 항목  -->
	               		<c:if test="${empty sessionScope.sid }">
		                    <div class="menuBox">
								<div class="menuItem"><a href="/loginForm"><h5>로그인</h5></a></div>
								<div class="menuItem"><a href="/dashboard"><h5>건강관리</h5></a></div>
								<div class="menuItem"><a href="#"><h5>복용관리</h5></a></div>
								<div class="menuItem"><a href="#"><h5>우리집 약 관리</h5></a></div>
								<div class="menuItem"><a href="#"><h5>공지사항</h5></a></div>
								<div class="menuItem"><a href="medicInfo"><h5>의약정보</h5></a></div>
							</div>
	                    </c:if>
	                    
						<!-- 로그인 성공한 경우 보여줄 메뉴 항목  -->	
						<c:if test="${not empty sessionScope.sid}">
							 <div class="menuBox">
							 	<div class="menuItem"><a href="/"><h5>마이페이지</h5></a></div>
								<div class="menuItem"><a href="/dashboard"><h5>건강관리</h5></a></div>
								<div class="menuItem"><a href="#"><h5>복용관리</h5></a></div>
								<div class="menuItem"><a href="#"><h5>우리집 약 관리</h5></a></div>
								<div class="menuItem"><a href="/listAllBoard"><h5>공지사항</h5></a></div>
								<div class="menuItem"><a href="/medicInfo"><h5>의약정보</h5></a></div>
								<div class="menuItem"><a href="/logout"><h5>로그아웃</h5></a></div>
							</div>
						</c:if>
					</div>
		  
					<div class="searchBar">
						<form>
							<input type="text" class="inputSearch" placeholder="약에 대한 정보를 얻고 싶으시면 이곳에 입력해주세요">
							<input type="submit" class="submitBtn" value="☌">
						</form>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>