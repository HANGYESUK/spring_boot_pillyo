<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>title</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link rel="stylesheet" href="<c:url value='/css/admin/adminTable.css'/>">
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
			
			<div id="adminContainer">
			<jsp:include page="/WEB-INF/views/admin/adminMainMenu.jsp" flush='true' />
			
				 <table class="adminTable">
				 <thead>
				 	<tr>
				 		<th>아이디</th>
				 		<!-- <th>비밀번호</th> -->
				 		<th width="70px">이름</th>
				 		<th>이메일</th>
				 		<th>휴대폰번호</th>
				 		<th width="80px">우편번호</th>
				 		<th>주소</th>
				 		<!-- <th>상세주소</th> -->
				 		<th>가입일</th>
				 		<th width="50px">수정</th>
				 		<th width="50px">삭제</th>
				 	</tr>
				 	</thead>
				 	<c:forEach items="${userList}" var="user">
				 		<tr>
				 			<td>${user.userId }</td>
					 		<%-- <td>${user.userPw }</td> --%>
					 		<td>${user.userName }</td>
					 		<td>${user.userEmail }</td>
					 		<td>${user.userHp }</td>
					 		<td>${user.userZipcode }</td>
					 		<td>${user.userAddress1 }</td>
					 		<%-- <td>${user.userAddress2 }</td> --%>
					 		<td>${user.joinDate }</td>
					 		<td><button onclick="location.href='/a_updateUserForm/${user.userId }'">수정</button></td>
					 		<td><button onclick="deleteCheck('${user.userId}');">삭제</button></td>
					 		<%-- <td><button onclick="location.href='javascript:deleteCheck(${user.userId })'">삭제</button></td> --%>
				 		</tr>
				 	</c:forEach>
					<script>
							function deleteCheck(no){
								var answer = confirm("선택한 회원 정보를 삭제하시겠습니까?");
								if(answer == true){
									location.href="<c:url value='/a_deleteUser/"+ no + "' />";
								}
							}
					</script>
				 </table>
					
				</div>
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>