<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="/css/layout/indexTop.css" />
	</head>
	<body>
		<nav id="main-navigation">
				<div class="pull-right fix low">
				
				 <%--  <!-- 로그인 하지 않은 경우 보여줄 메뉴 항목  -->
				  <c:forEach items="${famList }" var="fam">
				가족번호 : ${fam.famNo}
			</c:forEach>
			<br>
			${famNo} --%>
			
			
               		<c:if test="${empty sessionScope.sid }">
	                    <div class="outer-menu">
							<div class="outer-menu-btn"><a href="/loginForm"><h5>로그인</h5></a></div>
							<div class="outer-menu-btn"><a href="/loginForm" onclick="alert('로그인을 진행해주세요.'); alert('로그인 페이지로 이동합니다.');"><h5>건강관리</h5></a></div>
							<div class="outer-menu-btn"><a href="/loginForm" onclick="alert('로그인을 진행해주세요.'); alert('로그인 페이지로 이동합니다.');"><h5>복용관리</h5></a></div>
							<div class="outer-menu-btn"><a href="/loginForm" onclick="alert('로그인을 진행해주세요.'); alert('로그인 페이지로 이동합니다.');"><h5>우리집 약관리</h5></a></div>
							<div class="outer-menu-btn"><a href="/listAllBoard"><h5>공지사항</h5></a></div>
							<div class="outer-menu-btn"><a href="/medicInfo"><h5>의약정보</h5></a></div>
							<div class="outer-menu-btn"><a href="/drugShapeSearchForm"><h5>낱알검색</h5></a></div>
						</div>
                    </c:if>
                  
           		
				<!-- 로그인 성공한 경우 보여줄 메뉴 항목  -->	
					<c:if test="${not empty sessionScope.sid}">
						
						 <div class="outer-menu">
						 	<div class="outer-menu-btn"><a href="/updateMemberForm"><h5>마이페이지</h5></a></div>
							<div class="outer-menu-btn"><a href="/dashboard"><h5>건강관리</h5></a></div>
 							<div class="outer-menu-btn" ><a href="/calendarView/${famNo}"><h5>복용관리</h5></a></div>
 							<!-- <div class="outer-menu-btn" ><a href="/calendarView"><h5>복용관리</h5></a></div> -->
							<div class="outer-menu-btn"><a href="/hmForm"><h5>우리집 약관리</h5></a></div>
							<div class="outer-menu-btn"><a href="/listAllBoard"><h5>공지사항</h5></a></div>
							<div class="outer-menu-btn"><a href="/medicInfo"><h5>의약정보</h5></a></div>
							<div class="outer-menu-btn"><a href="/drugShapeSearchForm"><h5>낱알검색</h5></a></div>
							<div class="outer-menu-btn"><a href="/logout"><h5>로그아웃</h5></a></div>
						</div>
					</c:if>	
			 	
		
					<div id="searchBox" >
						<form method="post" action="<c:url value='/drugSearch'/>">
							<input type="text" id="drugSearchInput" name="keyWord" placeholder="약이름/효능으로 검색하세요"/>
							<input type="submit" id="submit" value="검색" />
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