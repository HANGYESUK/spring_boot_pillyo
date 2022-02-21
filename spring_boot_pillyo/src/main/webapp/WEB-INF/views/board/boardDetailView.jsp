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
	<body><!-- 
		<div id="wrap">
	 -->		
	

<%-- 		<section>
		`<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; width:750px;">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center; width:50px;">글 번호</th>
					<th style="background-color: #eeeeee; text-align: center; width:100px;">제목</th>
					<th style="background-color: #eeeeee; text-align: center; width:500px;">내용</th>
					<th style="background-color: #eeeeee; text-align: center; width:100px;">날짜</th>
				</tr>
				<tr>
				
				</tr>
			</thead>
			<tbody>
			<tr>
				<td>${board.id }</td>
				<td>${board.title }</td>
				<td>${board.content }</td>
				<td>${board.joinDate }</td>
			</tr>
	
			</tbody>
			
		</table>
		<a href="<c:url value='/updateBoardForm/${board.id}'/>">게시글 수정</a>
			<a href="javascript:deleteCheck();">게시글 삭제</a><br>
		
			
			
			
			<script type="text/javascript">
				function deleteCheck(){
					var answer = confirm("게시글을 삭제하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deleteBoard/${board.id}' />";
					}
				}
			</script>
        </section> --%>
        
        
        
        
<%--     <div class="layout">
		
		<table>
			<thead>
				<tr>
					<th>글번호</th>
					<th>제목</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${boardList}" var="board">
			   <tr>
					<td>${board.id}</td> 
					<!-- each는 반복 리스트에서 board가 없어질때 까지 반복 한다는 뜻  -->
					<td>제목입니다. ${board.title}</td>
				</tr>
		   </c:forEach>
			</tbody>
		</table> --%>
		
		<!-- 게시판 글 보기 양식 영역 시작 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%;">글 제목</td>
						<td colspan="2">${board.title}</td>
					</tr>
					<tr>
						<td>작성자</td>
						<td colspan="2">${board.userId}</td>
					</tr>
					<tr>
						<td>작성일자</td>
						<td colspan="2">${board.joinDate}</td>
					</tr>
					<tr>
						<td>내용</td>
						<td colspan="2" style="height: 200px; text-align: left;">${board.content}</td>
					</tr>
				</tbody>
			</table>
			
			
<%-- 			<input type="hidden" name="id" value="${board.id}">
 --%>			
			<a href="<c:url value='/listAllBoard'/>"><button>목록</button></a>
			
			<!-- 해당 글의 작성자가 본인이라면 수정과 삭제가 가능하도록 코드 추가 -->
			<a href="<c:url value='/updateBoardForm/${board.id}'/>">게시글 수정</a>
			<a href="javascript:deleteCheck();">게시글 삭제</a><br>
		
		</div>
	</div>
	<!-- 게시판 글 보기 양식 영역 끝 -->
		
		
	</div>
        
	<%-- 	<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' /> --%>
		
    <!--   </div> wrap -->
	</body>
</html>