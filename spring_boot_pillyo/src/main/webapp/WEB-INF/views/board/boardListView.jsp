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



	<script src="./jquery.fullPage.js"></script>

		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>


<title>Insert title here</title>

</head>

<style>
	.boardBody {
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
			
			

	<div class="boardBody">
	<div>알약요 소식<br>
	자주 묻는 질문</div>
			
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; width:750px;">
			<thead>
				<tr>
					<th style="background-color: #eeeeee; text-align: center; width:60px;">분류</th>
					<th style="background-color: #eeeeee; text-align: center; width:500px;">제목</th>
					<!-- <th style="background-color: #eeeeee; text-align: center; width:100px;">작성자</th> -->
					<th style="background-color: #eeeeee; text-align: center; width:100px;">작성일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${boardList}" var="board">
			   <tr>
					<td>${board.boardCtg}</td> 
					<!-- each는 반복 리스트에서 board가 없어질때 까지 반복 한다는 뜻  -->
					<td><a href="<c:url value='/boardDetailView/${board.id}'/>">${board.title }</a></td>
			<%-- 		<td>${board.userId}</td>  --%>
					<td>${board.joinDate}</td> 
					
				</tr>
		   </c:forEach>
			</tbody>
		</table>
		
		<a href="<c:url value = '/boardForm'/>"><button>글쓰기</button></a>
		
	
		</div>
		<br><br><br><br><br><br><br><br><br><br>
		

	</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
			
</body>
</html>