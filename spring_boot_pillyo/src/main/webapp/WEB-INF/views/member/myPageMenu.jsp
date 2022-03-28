<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지 메뉴</title>
		<link rel="stylesheet" href="/css/layout/myPage.css" />
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	
	<style>
		li > a{
		        font-size: 16px;
			    color: #305ec7;
			    font-weight: 49;
			    line-height: 43px;
		}
	</style>
	<body>
			<div id="myPageMenuBox">
			
			<c:forEach items="${sessionScope.SFamList}" var="fam">
				 <a href="">${fam.famName}</a>
			</c:forEach>

			<ul id="myPageItemBox">
				<li><a href="<c:url value='/updateMemberForm'/>">개인정보 수정</a></li>
				<li><a href="<c:url value='/MyPage/MyHealthList'/>">나의 건강정보</a></li>
				<li><a href="javascript:deleteCheck();">회원탈퇴</a></li>
				<li><a href="<c:url value='/logout'/>">로그아웃</a></li>
			</ul>
			</div>
			
			<script type="text/javascript">
				 function deleteCheck(){
					var answer = confirm("정말로 회원을 탈퇴하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deleteUser/${sessionScope.sid}' />";
					}
				}
			</script>
		
	</body>
</html>