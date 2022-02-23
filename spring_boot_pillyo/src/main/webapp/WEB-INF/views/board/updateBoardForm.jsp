<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link href="<c:url value='/css/board/board.css'/>" rel="stylesheet" type="text/css">	
	
</head>

<style>
	.layout {
    width: fit-content; /* 태그의 넓이를 500px로 */
	margin:0 auto; /* 양쪽 여백을 위아래는 0 좌우는 자동으로 잡아주겠다! */
	margin-top : 40px;
	}
	#button2{
	    background: #f2f9fb;
    color: #3f63b5;
    border-color: #f2f9fb;
    height: 38px;
    width: 70px;
    border-radius: 10px;
    font-size: 15px;
	}
	td > textarea{
	    color: #3f63b5;
    height: 40px;
    font-size: 20px;
    background: #cfe3f6;
    border-color: aliceblue;

	}
	
</style>

<body>
	<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">


	<div class="layout">

		<section>		
			<form id="updateBoardForm" method="post" action="<c:url value='/updateBoard/${board.boardNo}'/>">					
				<table class="table table-striped">
					<thead>
						<tr>
							
							<th width=600px; colspan="3" style="background-color: #f2f9fb; text-align: center;">알약요
						<c:if test="${board.boardCtgNo eq '0'}">소식</c:if>
						<c:if test="${board.boardCtgNo eq '1'}">카드뉴스</c:if>
						<c:if test="${board.boardCtgNo eq '2'}">주문/결제</c:if>
						<c:if test="${board.boardCtgNo eq '3'}">교환/반품</c:if>
						<c:if test="${board.boardCtgNo eq '4'}">제품</c:if>
						<c:if test="${board.boardCtgNo eq '5'}">회원</c:if>
						Q&A
						</th>
						</tr>
						
						<tr>
						<!-- <td style="width: 20%;">글 제목</td> -->
						
					
						<!-- <td style="width: 20%;">글 제목</td> -->
						<td>[${board.boardTitle}] 글 수정하기</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><textarea rows="1" cols="50" placeholder="글 제목"  name="boardTitle" maxlength="50">${board.boardTitle}</textarea></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" rows="10" cols="50" name="boardContent" maxlength="2048" style="height: 350px;">${board.boardContent}</textarea>
							</td>
						</tr>
					</tbody>
					
				</table>
				<!-- 글쓰기 버튼 생성 -->
				<input type="submit" id="button2" class="btn btn-primary pull-right" value="글쓰기">
				<a href="<c:url value='/boardDetailView/${board.boardNo}'/>"><button>돌아가기</button></a>
			</form>		
		</section>
	</div>
	
	
	<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
</body>
</html>