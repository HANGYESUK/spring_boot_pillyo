<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
	Date nowDate = new Date();
	SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성</title>
	<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>

</head>

<style>
	.layout {
	width:500px; /* 태그의 넓이를 500px로 */
	margin:0 auto; /* 양쪽 여백을 위아래는 0 좌우는 자동으로 잡아주겠다! */
	margin-top : 40px;
	}
	
	.layout input { /* .layout > input 은 layout 바로 밑 하위태그 input에 적용이고 */
					/* .layout input 은 layout 안의 input 태그에 적용 */
	width:100%;
	box-sizing : border-box;
	}
	
	.layout textarea {
	width:100%;
	margin-top:10px;
	min-height:300px;
	}
	
</style>



<body>
	<div class="layout">
		<form id= "/boardForm" name="/boardForm" method="post" action="<c:url value='/insertboard'/>"> <!--  writedo로 넘겨주고 post방식으로 넘겨주겠다 -->
		<!-- 실행시 form 안에 데이터가 writedo로 넘어간다 -->
<!-- 			아이디<input type="text" id="id" name="id">
 -->		    제목<input type="text" name="title">
			내용 <textarea type="text" name="content"></textarea>
			<input type="hidden" name="userId" value="${sessionScope.sid}">  <!-- 세션 아이디 받아오기 -->
			<input type="hidden" name="joinDate" value="<%= sf.format(nowDate) %>"> 
			<button type="submit">작성</button> <!-- submit -> 이 버튼의 역할은 데이터를 전송하는 것 -->
		</form>
		
	</div>
</body>
</html>