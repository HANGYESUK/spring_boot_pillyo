<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>top</title>
		<link rel="stylesheet" href="/css/layout/common.css" />
		<link rel="stylesheet" href="/css/layout/top.css" />
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<script src="https://kit.fontawesome.com/2d323a629b.js" crossorigin="anonymous"></script>
	</head>
	<body>
		<div id="marqueeBox">
				<marquee>
					<a href="<c:url value="/boardDetailView/1"/>">Pill-Yo 중요 공지</a>
					<a href="<c:url value="/boardDetailView/1"/>">새로운 약정보  등록</a>
					<a href="<c:url value="/boardDetailView/1"/>">건강관리 리뉴얼</a>
					<a href="<c:url value="/boardDetailView/1"/>">복용관리 리뉴얼</a>
					<a href="<c:url value="/boardDetailView/1"/>">공지사항을 확인해주세요</a>
				</marquee>
			</div>
			<div id="headerBox">
				<div id="logoBox">
					<a href="/"><img src="/img/mainLogo.png"></a>
				</div><!-- logoBox -->
				
				<div id="navBox">
					<nav id="topMenu" >
						<c:choose>
							<c:when test="${not empty sessionScope.admin}">
								<ul> 
									<li class="topMenuLi"> 
						                <a class="menuLink" href="/adminMain">통합관리</a>
						            </li>
						    
						            <li class="topMenuLi"> 
						                <a class="menuLink" href="/listAllBoard">공지사항</a>
						            </li>
						    
						            <li class="topMenuLi"> 
						                <span class="menuLink">정보제공</span>
						                <ul class="submenu">
						                    <li><a href="/medicInfo" class="submenuLink longLink">의약정보</a></li> 
						                    <li><a href="/drugShapeSearchForm" class="submenuLink longLink">낱알검색</a></li> 
						                    <li><a href="/pharmacyMaps" class="submenuLink longLink">주변 약국 및 편의점</a></li> 
						                </ul> 
						            </li>
						            
						            <li class="topMenuLi"> 
						                <a class="menuLink" href="/logout">로그아웃</a>
						            </li>
						            
						        </ul>
							</c:when>
							
							<c:when test="${not empty sessionScope.sid}">
								<ul> 
									<li class="topMenuLi"> 
						                <a class="menuLink" href="/updateMemberForm">마이페이지</a>
						            </li>
						            
						            <li class="topMenuLi"> 
						                <a class="menuLink" href="/listAllBoard">공지사항</a>
						            </li>
						    
						            <li class="topMenuLi"> 
						                <span class="menuLink">서비스</span> 
						                <ul class="submenu">
						                    <li><a href="/famListView" class="submenuLink longLink">가족관리</a></li>
						                    <li><a href="/healthManageView" class="submenuLink longLink">건강관리</a></li>
						                    <li><a href="/calendarView/${famNo}" class="submenuLink longLink">복용관리</a></li> 
						                    <li><a href="/hmForm" class="submenuLink longLink">우리집 약 관리</a></li> 
						                </ul> 
						            </li>
						    
						            <li class="topMenuLi"> 
						                <span class="menuLink">정보제공</span>
						                <ul class="submenu">
						                    <li><a href="/medicInfo" class="submenuLink longLink">의약정보</a></li> 
						                    <li><a href="/drugShapeSearchForm" class="submenuLink longLink">낱알검색</a></li> 
						                    <li><a href="/pharmacyMaps" class="submenuLink longLink">주변 약국 및 편의점</a></li> 
						                </ul> 
						            </li>
						            
						            <li class="topMenuLi"> 
						                <a class="menuLink" href="/logout">로그아웃</a>
						            </li>
						            
						        </ul>
							</c:when>
							
							<c:otherwise>
								<ul> 
						            <li class="topMenuLi"> 
						                <span class="menuLink">회원</span>
						                <ul class="submenu"> 
						                    <li><a href="/loginForm" class="submenuLink longLink">로그인</a></li> 
						                    <li><a href="/join" class="submenuLink longLink">회원가입</a></li> 
						                </ul> 
						            </li>
						    
						            <li class="topMenuLi"> 
						                <a class="menuLink" href="/listAllBoard">공지사항</a>
						            </li>
						    
						            <li class="topMenuLi"> 
						                <span class="menuLink">서비스</span> 
						                <ul class="submenu">
						                    <li><a href="/loginForm" class="submenuLink longLink" onclick="alert('로그인 후 이용 가능한 기능입니다.');">가족관리</a></li>
						                    <li><a href="/loginForm" class="submenuLink longLink" onclick="alert('로그인 후 이용 가능한 기능입니다.');">건강관리</a></li>
						                    <li><a href="/loginForm" class="submenuLink longLink" onclick="alert('로그인 후 이용 가능한 기능입니다.');">복용관리</a></li> 
						                    <li><a href="/loginForm" class="submenuLink longLink" onclick="alert('로그인 후 이용 가능한 기능입니다.');">우리집 약 관리</a></li> 
						                </ul> 
						            </li>
						    
						            <li class="topMenuLi"> 
						                <span class="menuLink">정보제공</span>
						                <ul class="submenu">
						                    <li><a href="/medicInfo" class="submenuLink longLink">의약정보</a></li> 
						                    <li><a href="/drugShapeSearchForm" class="submenuLink longLink">낱알검색</a></li> 
						                    <li><a href="/pharmacyMaps" class="submenuLink longLink">주변 약국 및 편의점</a></li> 
						                </ul> 
						            </li>
						        </ul>
							</c:otherwise>
						</c:choose>
					</nav>
				</div><!-- navBox -->
				
				<div id="searchBox">
					<form method="post" id="searchForm" action="<c:url value='/drugSearch'/>">
						<div id="searchBar">
							<span><i class="fas fa-search searchIcon"></i></span>
							<input type="search" id="inputSearch" class="inputSearch" name="keyWord" placeholder="약 이름 및 효능으로 검색하세요.">
							<input type="submit" id="submitBtn">
						</div>
					</form>
				</div><!-- searchBar -->	
			</div><!-- headerBox -->
	</body>
	<script>
        var inputSearch = document.getElementById('inputSearch')

        var searchForm = document.getElementById('searchForm')

        searchForm.addEventListener("submit", (e)=>{
            if(inputSearch.value == "") {
                e.preventDefault()
                alert("검색어를 입력해주세요")
                console.log("검색어를 입력해주세요")
            }
            else {
            	console.log("검색")
            }
        })
	</script>
</html>