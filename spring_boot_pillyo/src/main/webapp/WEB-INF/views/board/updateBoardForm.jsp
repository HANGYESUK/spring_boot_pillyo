<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>

</head>

<style>
	.layout {
    width: fit-content; /* 태그의 넓이를 500px로 */
	margin:0 auto; /* 양쪽 여백을 위아래는 0 좌우는 자동으로 잡아주겠다! */
	margin-top : 40px;
	}
	
</style>

<body>

	<div class="layout">

		<section>
			<%-- <h3>게시판 수정</h3>
				<form id="updateBoardForm" method="post" action="<c:url value='/updateBoard/${board.id}'/>">					
					    <div>
					        <label>제목</label>
					        <textarea rows="1" cols="50" name="title">${board.title}</textarea>
					    </div>
					    <div>
					        <label>내용</label>
					        <textarea rows="10" cols="50" name="content">${board.content}</textarea>
					    </div>
					    <input type="submit" value="등록"/>
					    <button type="button" onclick="location.href='/boardDetailView'">돌아가기</button>

						<a href="<c:url value='/boardDetailView/${board.id}'/>"><button>돌아가기</button></a>
							
						</form>	 --%>	
						
						
			<form id="updateBoardForm" method="post" action="<c:url value='/updateBoard/${board.id}'/>">					
				<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><textarea rows="1" cols="50" placeholder="글 제목"  name="title" maxlength="50">${board.title}</textarea></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="글 내용" rows="10" cols="50" name="content" maxlength="2048" style="height: 350px;">${board.content}</textarea>
							</td>
						</tr>
					</tbody>
					
				</table>
				<!-- 글쓰기 버튼 생성 -->
				<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
				<a href="<c:url value='/boardDetailView/${board.id}'/>"><button>돌아가기</button></a>
			</form>		
		</section>
	</div>
</body>
</html>