<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

    <!-- 제이쿼리 -->
    <script
    src="https://code.jquery.com/jquery-3.6.0.min.js"
    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
    crossorigin="anonymous"></script>

    <!-- 폰트어썸 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.2.0/css/all.min.css" integrity="sha512-6c4nX2tn5KbzeBJo9Ywpa0Gkt+mzCzJBrE1RB6fmpcsoN+b/w/euwIMuQKNyUoU/nToKN3a8SgNOtPrbW12fug==" crossorigin="anonymous" />


	<link rel="stylesheet" href="/css/dashboard/dashboardContent.css" />
	<link rel="stylesheet" href="/css/dashboard/dashboard.css" />



	<script src="./jquery.fullPage.js"></script>

		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>


<title>Insert title here</title>

</head>

<style>
	.layout {
	width:500px; /* 태그의 넓이를 500px로 */
	margin:0 auto; /* 양쪽 여백을 위아래는 0 좌우는 자동으로 잡아주겠다! */
	margin-top : 40px;
	}
	
</style>

<body>

	<div class="layout">
		
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; width:750px;">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center; width:50px;">글번호</th>
					<th style="background-color: #eeeeee; text-align: center; width:500px;">제목</th>
					<th style="background-color: #eeeeee; text-align: center; width:100px;">작성자</th>
					<th style="background-color: #eeeeee; text-align: center; width:100px;">작성일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${boardList}" var="board">
			   <tr>
					<td>${board.id}</td> 
					<!-- each는 반복 리스트에서 board가 없어질때 까지 반복 한다는 뜻  -->
					<td><a href="<c:url value='/boardDetailView/${board.id}'/>">${board.title }</a></td>
					<td>${board.userId}</td> 
					<td>${board.joinDate}</td> 
				</tr>
		   </c:forEach>
			</tbody>
		</table>
				<ul class="paging">
		    <c:if test="${paging.prev}">
		        <span><a href='<c:url value="/listAllBoard?page=${paging.startPage-1}"/>'>이전</a></span>
		    </c:if>
		    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
		        <span><a href='<c:url value="/listAllBoard?page=${num}"/>'>${num}</a></span>
		    </c:forEach>
		    <c:if test="${paging.next && paging.endPage>0}">
		        <span><a href='<c:url value="/listAllBoard?page=${paging.endPage+1}"/>'>다음</a></span>
		    </c:if>
</ul>

	</div>


	<section>
			<h3>전체 게시판 목록</h3>
			
			   <c:forEach items="${boardList }" var="board">
		   			체형관리 번호 ${board.id}<br>
		   			키 ${board.title}<br>
		   			몸무게 ${board.content}<br>
		   			
		
			   	<br>
			   	<a href="<c:url value='/updateBoardForm/${board.id}'/>">체형 관리 정보 수정</a>
			   	<a href="javascript:deleteCheck();">체형 관리 정보 삭제</a><br>
			   	
			   	<script type="text/javascript">
					function deleteCheck(){
						var answer = confirm("게시판을 삭제하시겠습니까?");
						if(answer == true){
							location.href="<c:url value='/deleteBoard/${board.id}' />";
						}
					}
				</script>
 		
 		<br>
			   </c:forEach>
			   
	</section>
	
	<!-- 게시판 메인 페이지 영역 시작 -->
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<th style="background-color: #eeeeee; text-align: center;">번호</th>
						<th style="background-color: #eeeeee; text-align: center;">제목</th>
						<th style="background-color: #eeeeee; text-align: center;">작성자</th>
						<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<!-- 테스트 코드 -->
						<td>1</td>
						<td>안녕하세요</td>
						<td>홍길동</td>
						<td>2020-07-13</td>
					</tr>
				</tbody>
			</table>
			<!-- 글쓰기 버튼 생성 -->
			<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
		</div>
	</div>
	<!-- 게시판 메인 페이지 영역 끝 -->
	
	<!-- 부트스트랩 참조 영역 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
		
		<%-- 	<th:block th:each="page : %{#numbers.sequence(startPage, endPage)}">
				<a th:if="${page != nowPage} th:href="@{/board/boardList(page = ${page - 1 })}" th:text="$}"></a>
				<strong th:if="${page == nowPage }" th:text="${page } style="color : red"></strong>
			</th:block> 
			 --%>
	
			
</body>
</html>