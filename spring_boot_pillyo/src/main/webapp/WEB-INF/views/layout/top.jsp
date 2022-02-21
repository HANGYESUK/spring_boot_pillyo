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
					
		
					<div id="searchBox" >
						<form method="post" action="<c:url value='/drugSearch'/>">
							<input type="text" id="drugSearchInput" name="keyWord" placeholder="약이름/효능으로 검색하세요"/>
							<input type="submit" value="검색" />
						</form>
					</div>
				</div>
		</nav>
		
		<script>
	        let drugSearchInput = document.getElementById('drugSearchInput')
	
	        let searchBox = document.getElementById('searchBox')
	
	        searchBox.addEventListener("submit", (e)=>{
	            if(drugSearchInput.value == "") {
	                e.preventDefault()
	                alert("검색어를 입력해주세요")
	                console.log("검색어를 입력해주세요")
	            }
	            else {
	            	console.log("검색")
	            }
	        })
		</script>
		
	</body>
</html>