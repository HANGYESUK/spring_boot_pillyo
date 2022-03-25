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
			
			<div id="adminTableBox">
			<div id="adminTitle">
				<h1>회원 관리</h1>
			</div>
				 <table class="adminTable">
				 <thead>
				 	<tr>
				 		<th>아이디</th>
				 		<!-- <th>비밀번호</th> -->
				 		<th width="70px">이름</th>
				 		<th>이메일</th>
				 		<th width="130px">휴대폰번호</th>
				 		<th width="80px">우편번호</th>
				 		<!-- <th>주소</th> -->
				 		<!-- <th>상세주소</th> -->
				 		<th>가입일</th>
				 		<th width="50px">가족</th>
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
					 		<%-- <td>${user.userAddress1 }</td> --%>
					 		<%-- <td>${user.userAddress2 }</td> --%>
					 		<td>${user.joinDate }</td>
					 		<td><button onclick="location.href='/a_listUserFamview/${user.userId }'">수정</button></td>
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
						 
					 <div class="search_wrap">
						<div class="search_area">
							<select name="type">
								<option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
								<option value="I" <c:out value="${pageMaker.cri.type eq 'I'?'selected':'' }"/>>ID</option>
								<option value="N" <c:out value="${pageMaker.cri.type eq 'N'?'selected':'' }"/>>이름</option>
								<option value="HP" <c:out value="${pageMaker.cri.type eq 'HP'?'selected':'' }"/>>핸드폰</option>
								<option value="E" <c:out value="${pageMaker.cri.type eq 'E'?'selected':'' }"/>>이메일</option>
								
							</select>		
							<input type="text" name="keyword" value="${pageMaker.cri.keyword }">
							<button>검색</button>
						</div>
					</div>	
					 
					 <!-- 페이징 처리   -->
					 <div class="pageInfo_wrap" >
						<div class="pageInfo_area">
							<ul id="pageInfo" class="pageInfo">
							
								<!-- 이전페이지 버튼 -->
								<c:if test="${pageMaker.prev}">
									<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
								</c:if>
								
								<!-- 각 번호 페이지 버튼 -->
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="${num}">${num}</a></li>
								</c:forEach>
								
								<!-- 다음페이지 버튼 -->
								<c:if test="${pageMaker.next}">
									<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1 }">Next</a></li>
								</c:if>	
								
							</ul>
						</div>
					</div>
					
					<form id="moveForm" method="get">	
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum }">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount }">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword }">	
						<input type="hidden" name="type" value="${pageMaker.cri.type }">	
					</form>
					 <!-- 페이징 처리   -->
					
				</div>
				</div>
				<!-- 페이징 스크립트 -->
			<script>
			$(document).ready(function(){
				

				let result = '<c:out value="${result}"/>';
				
				checkAlert(result);
				console.log(result);
				
			});

				
				let moveForm = $("#moveForm");
					$(".move").on("click", function(e){
						e.preventDefault();
						
						/* 검색했을때  */
						moveForm.append("<input type='hidden' name='itemName' value='"+ $(this).attr("href")+ "'>");
						moveForm.attr("action", "/listAllUser");
						moveForm.submit();
					});
					$(".pageInfo a").on("click", function(e){
						e.preventDefault();
						moveForm.find("input[name='pageNum']").val($(this).attr("href"));
						/* 목록 매핑 주소 입력  */
						moveForm.attr("action", "/listAllUser");
						moveForm.submit();
						
					});	
					
					
					$(".search_area button").on("click", function(e){
						e.preventDefault();
						
						let type = $(".search_area select").val();
						let keyword = $(".search_area input[name='keyword']").val();
						
						if(!type){
							alert("검색 종류를 선택하세요.");
							return false;
						}
						
						if(!keyword){
							alert("키워드를 입력하세요.");
							return false;
						}		
						
						moveForm.find("input[name='type']").val(type);
						moveForm.find("input[name='keyword']").val(keyword);
						moveForm.find("input[name='pageNum']").val(1);
						moveForm.submit();
				});
		</script>
		<!-- 페이징 스크립트 -->
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>