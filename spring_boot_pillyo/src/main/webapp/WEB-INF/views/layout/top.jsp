<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>
	<body>
		<nav id="main-navigation">
				<div class="pull-right fix low">
				
				  <!-- 로그인 하지 않은 경우 보여줄 메뉴 항목  -->
               		<c:if test="${empty sessionScope.sid }">
	                    <div class="outer-menu">
							<div class="outer-menu-btn"><a href="/loginForm"><h5>로그인</h5></a></div>
							<div class="outer-menu-btn"><a href="#"><h5>복용관리</h5></a></div>
							<div class="outer-menu-btn"><a href="#"><h5>재고관리</h5></a></div>
							<div class="outer-menu-btn"><a href="#"><h5>가족관리</h5></a></div>
							<div class="outer-menu-btn"><a href="#"><h5>건강관리</h5></a></div>
						</div>
                    </c:if>
                    
                    			
				<!-- 로그인 성공한 경우 보여줄 메뉴 항목  -->	
					<c:if test="${not empty sessionScope.sid}">
						 <div class="outer-menu">
						 	<div class="outer-menu-btn"><a href="/dashboard"><h5>${sessionScope.sid}</h5></a></div>
							<div class="outer-menu-btn"><a href="/dashboard"><h5>HOME</h5></a></div>
							<div class="outer-menu-btn"><a href="#"><h5>복용관리</h5></a></div>
							<div class="outer-menu-btn"><a href="#"><h5>재고관리</h5></a></div>
							<div class="outer-menu-btn"><a href="#"><h5>가족관리</h5></a></div>
							<div class="outer-menu-btn"><a href="/logout"><h5>로그아웃</h5></a></div>
						</div>
					</c:if>	
					
		
					<div class="search-bar">
						<form>
							<input type="text" class="input-search" placeholder="약에 대한 정보를 얻고 싶으시면 이곳에 입력해주세요">
							<input type="submit" class="input-search-submit" value="☌">
						</form>
					</div>
				</div>
		</nav>
	</body>
</html>