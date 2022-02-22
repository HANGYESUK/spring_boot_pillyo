<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>title</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	
	<style>
		.container {
	    width: fit-content; /* 태그의 넓이를 500px로 */
		margin:0 auto; /* 양쪽 여백을 위아래는 0 좌우는 자동으로 잡아주겠다! */
		margin-top : 40px;
		}
	</style>
	
	
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
	
	
		<!-- 게시판 글 보기 양식 영역 시작 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th width=600px; colspan="3" style="background-color: #eeeeee; text-align: center;">${board.boardCtg}</th>
						
					</tr>
					<tr>
					<th style="background-color: #eeeeee; text-align: center; width:60px;">분류</th>
					<th style="background-color: #eeeeee; text-align: center; width:500px;">제목</th>
					<!-- <th style="background-color: #eeeeee; text-align: center; width:100px;">작성자</th> -->
					<th style="background-color: #eeeeee; text-align: center; width:100px;">작성일</th>
				</tr>
				</thead>
				<tbody>
				<tr>
						<!-- <td style="width: 20%;">글 제목</td> -->
						<td>${board.boardCtg}</td>
					
						<!-- <td style="width: 20%;">글 제목</td> -->
						<td>${board.title}</td>
					
						<%-- <!-- <td>작성자</td> -->
						<td>${board.userId}</td> --%>
					
						
						<td>${board.joinDate}</td>
					</tr>
					<tr>
						<!-- <td>내용</td> -->
						<td colspan="3" style="background:#cfe3f6; height: 500px;; text-align: left;">${board.content}</td>
					</tr>
				</tbody>
			</table>
			
			
<%-- 			<input type="hidden" name="id" value="${board.id}">
 --%>			
			<a href="<c:url value='/listAllBoard'/>"><button>목록</button></a>
			
			<!-- 해당 글의 작성자가 본인이라면 수정과 삭제가 가능하도록 코드 추가 -->
			<a href="javascript:deleteCheck();"><button style="float:right;">게시글 삭제</button></a>
			<a href="<c:url value='/updateBoardForm/${board.id}'/>"><button style="float:right;" >게시글 수정</button></a>
			
			<script type="text/javascript">
				function deleteCheck(){
					var answer = confirm("게시글을 삭제하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deleteBoard/${board.id}' />";
					}
				}
			</script>
		
		</div>
	</div>
	<!-- 게시판 글 보기 양식 영역 끝 -->

	</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>