<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정 폼</title>
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
	     background: white;
        color: #388a6b;
    border-color: #f2f9fb;
    height: 38px;
    width: 70px;
    border-radius: 10px;
    font-size: 14px;
    
    float: right;
    /* margin-right: 127px; */
    
       /*  background: white;
    color: #3f63b5;
    border-color: #f2f9fb;
    height: 38px;
    width: 86px;
    border-radius: 10px;
    font-size: 15px;
    border-bottom-color: white;
    margin-left: 14px;
    float: right;
     */
     font-weight: 600;
    border: 0;
	}
	td > textarea{
	color: #388a6b;
    height: 40px;
    font-size: 20px;
    background: #f4faff;
    border-color: aliceblue;

	}
	.button3{
	float:right;
	
	}
	.button3:hover {
	    top: -2px;
    border: 1px solid white;
    background: white;
    box-shadow: 1px 1px 2px #d3d3d3;
    font-size: 15px;
}
#button2:hover{
    top: -2px;
    border: 1px solid white;
    background: white;
    box-shadow: 1px 1px 2px #d3d3d3;
    font-size: 17px;
}

.form-control{
text-align:center;
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
				<div id="subTitle2"><h2>알약요
		<c:if test="${board.boardCtgNo eq '0'}">소식</c:if>
						<c:if test="${board.boardCtgNo eq '1'}">카드뉴스</c:if>
						<c:if test="${board.boardCtgNo eq '2'}">건강관리</c:if>
						<c:if test="${board.boardCtgNo eq '3'}">우리집약관리</c:if>
						<c:if test="${board.boardCtgNo eq '4'}">복용관리</c:if>
						<c:if test="${board.boardCtgNo eq '5'}">회원</c:if>
		Q&A</h2></div>
				
				<table class="table table-striped">
					<thead>
						<%-- <tr>
							
							<th width=600px; colspan="3" style="">알약요
						<c:if test="${board.boardCtgNo eq '0'}">소식</c:if>
						<c:if test="${board.boardCtgNo eq '1'}">카드뉴스</c:if>
						<c:if test="${board.boardCtgNo eq '2'}">건강관리</c:if>
						<c:if test="${board.boardCtgNo eq '3'}">우리집약관리</c:if>
						<c:if test="${board.boardCtgNo eq '4'}">복용관리</c:if>
						<c:if test="${board.boardCtgNo eq '5'}">회원</c:if>
						Q&A
						</th>
						</tr> --%>
						
						<tr>
						<!-- <td style="width: 20%;">글 제목</td> -->
						
					
						<!-- <td style="width: 20%;">글 제목</td> -->
						<td>[${board.boardTitle}] 글 수정하기</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><textarea rows="1" cols="50" placeholder="글 제목"  name="boardTitle" maxlength="50" style="      background: #ffffff;  resize: none; color:">${board.boardTitle}</textarea></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" rows="10" cols="50" name="boardContent" maxlength="2048" style="height: 650px; text-align: left;      background: white;   resize: none;
">${board.boardContent}</textarea>
							</td>
						</tr>
					</tbody>
					
				</table>
				<!-- 글쓰기 버튼 생성 -->
				<input type="submit" id="button2" class="btn btn-primary pull-right" value="글쓰기">
				<a href="<c:url value='/boardDetailView/${board.boardNo}'/>"><button class="button3">돌아가기</button></a>
			</form>		
		</section>
	</div>
	
	
	<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
</body>
</html>