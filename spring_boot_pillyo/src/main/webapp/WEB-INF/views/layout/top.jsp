<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>top</title>
		<link rel="stylesheet" href="/css/layout/common.css" />
	</head>
		<style>
			marquee{
			    height: 22px;
		    }
			.submitBtn{
		
	    		border: 0.3px solid white;
			    background:white;
			    border-radius: 40px 40px 40px 40px;
			    width: 60px;
			    height: 37px;
			    font-size: 15px;
			    font-weight: 600;
			    border-color: white;
			    box-shadow: 2px 2px 2px #ccd7f3;
			    color: #919191;
			    font-weight: 400;
}
			
			.submitBtn:hover{
				
				box-shadow: 2px 2px 2px #bbbbbb;
			}
			.inputSearch::placeholder{
			color: #84868b;
    font-weight: 400;
			  	opacity: 1; 
		      	text-align: center;
			   	font-size: 14px;
			}
			.profileText > a{
			    
    text-decoration: none;
        color: #747474;
    /* color: #6d8ac7; */
    /* font-weight: bolder; */
    font-size: 30px;
			}
		</style>
	<body>
		<div id="headerBox">
			<div id="logoBox">
				<!-- <div id="logo"><a href="/">Pill-yo</a></div> -->
				<marquee>
					<a href="<c:url value="/boardDetailView/1"/>">Pill-Yo 중요 공지</a>
					<a href="<c:url value="/boardDetailView/1"/>">새로운 약정보  등록</a>
					<a href="<c:url value="/boardDetailView/1"/>">건강관리 리뉴얼</a>
					<a href="<c:url value="/boardDetailView/1"/>">복용관리 리뉴얼</a>
					<a href="<c:url value="/boardDetailView/1"/>">공지사항을 확인해주세요</a>
				</marquee>
			</div>
			<div class="mainHeader">
				<div class="profileBox">
					<!-- <div class="proflieImg">
						<img src="./img/루피.jpg" class="loopy">
					
					</div> -->
					<div class="profileText">
						<!-- <h3>홍길동</h3>
						<h4>나이 : 26</h4> -->
						
						<a href="/" style="color:#345cb5;">Pill-Yo</a>
					</div>
				</div>
				<div id="mainNavBox">
					<div class="mainNav">
						
				<c:choose>
					<c:when test="${not empty sessionScope.admin}">
                  	<!-- 관리자 로그인 -->
						 <div class="menuBox">
							<div class="menuItem"><a href="/adminMain"><h5>관리자</h5></a></div>
							<div class="menuItem"><a href="/listAllBoard"><h5>공지사항</h5></a></div>
							<div class="menuItem"><a href="/medicInfo"><h5>의약정보</h5></a></div>
							<div class="menuItem"><a href="/drugShapeSearchForm"><h5>낱알검색</h5></a></div>
							<div class="menuItem"><a href="/logout"><h5>로그아웃</h5></a></div>
						</div>
					</c:when>	
					<c:when test="${not empty sessionScope.sid}">
					<!-- 로그인 성공한 경우 보여줄 메뉴 항목  -->	
						
						 <div class="menuBox">
						 	<div class="menuItem"><a href="/updateMemberForm"><h5>마이페이지</h5></a></div>
							<div class="menuItem"><a href="/healthManageView"><h5>건강관리</h5></a></div>
 							<div class="menuItem" ><a href="/calendarView/${famNo}"><h5>복용관리</h5></a></div>
 							<!-- <div class="outer-menu-btn" ><a href="/calendarView"><h5>복용관리</h5></a></div> -->
							<div class="menuItem"><a href="/hmForm"><h5>우리집 약관리</h5></a></div>
							<div class="menuItem"><a href="/listAllBoard"><h5>공지사항</h5></a></div>
							<div class="menuItem"><a href="/medicInfo"><h5>의약정보</h5></a></div>
							<div class="menuItem"><a href="/drugShapeSearchForm"><h5>낱알검색</h5></a></div>
							<div class="menuItem"><a href="/logout"><h5>로그아웃</h5></a></div>
						</div>
					</c:when>
	               		<%-- <c:if test="${empty sessionScope.sid }"> --%>
               			<c:otherwise>
						<!-- 로그인 하지 않은 경우 보여줄 메뉴 항목  -->
		                    <div class="menuBox">
								<div class="menuItem"><a href="/loginForm"><h5>로그인</h5></a></div>
								<div class="menuItem"><a href="/loginForm" onclick="alert('로그인을 진행해주세요.'); alert('로그인 페이지로 이동합니다.');"><h5>건강관리</h5></a></div>
								<div class="menuItem"><a href="/loginForm" onclick="alert('로그인을 진행해주세요.'); alert('로그인 페이지로 이동합니다.');"><h5>복용관리</h5></a></div>
								<div class="menuItem"><a href="/loginForm" onclick="alert('로그인을 진행해주세요.'); alert('로그인 페이지로 이동합니다.');"><h5>우리집 약 관리</h5></a></div>
								<div class="menuItem"><a href="/listAllBoard"><h5>공지사항</h5></a></div>
								<div class="menuItem"><a href="/medicInfo"><h5>의약정보</h5></a></div>
								<div class="menuItem"><a href="/drugShapeSearchForm"><h5>낱알검색</h5></a></div>
								
							</div>
                        </c:otherwise>
                  </c:choose>
                  
	                
					</div>
		  
					<%-- <div class="searchBar">
						<form method="post" action="<c:url value='/drugSearch'/>">
							<input type="text" class="inputSearch" name="keyWord" placeholder="약에 대한 정보를 얻고 싶으시면 이곳에 입력해주세요">
							<input type="submit" class="submitBtn" value="검색">
						</form>
					</div> --%>
				</div>
			</div>
		</div>
	</body>
</html>