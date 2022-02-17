<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<script src="<c:url value='drugAutoComplete.js'/>"></script>
	</head>
	<body>
		<nav id="main-navigation">
				<div class="pull-right fix low">
				
				  <!-- 로그인 하지 않은 경우 보여줄 메뉴 항목  -->
               		<c:if test="${empty sessionScope.sid }">
	                    <div class="outer-menu">
							<div class="outer-menu-btn"><a href="/loginForm"><h5>로그인</h5></a></div>
							<div class="outer-menu-btn"><a href="#"><h5>복용관리</h5></a></div>
							<div class="outer-menu-btn"><a href="#"><h5>우리집 약관리</h5></a></div>
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
							<div class="outer-menu-btn"><a href="/hmForm"><h5>우리집 약관리</h5></a></div>
							<div class="outer-menu-btn"><a href="#"><h5>가족관리</h5></a></div>
							<div class="outer-menu-btn"><a href="/logout"><h5>로그아웃</h5></a></div>
						</div>
					</c:if>	
					
		
					<div id="searchBox" bgcolor="lightgray">
						<form method="post" action="<c:url value='/drugSearch'/>">
							<input type="text" id="drugSearchInput" name="keyWord" />
							<input type="submit" value="검색" />
						</form>
					</div>
				</div>
		</nav>
	</body>
</html>