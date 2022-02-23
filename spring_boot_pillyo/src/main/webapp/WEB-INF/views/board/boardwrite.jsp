<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!--  파일 업로드 -->
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>

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
	<link href="<c:url value='/css/board/board.css'/>" rel="stylesheet" type="text/css">	
</head>


<!-- 이미지 불러오는 java Script -->
	<script type="text/javascript">
	 function setThumbnail(event) { // 이미지 등록 버튼의 onchange
			var reader = new FileReader(); 	// 파일을 불러옴
		    
			reader.onload = function(event) { // 불러온 파일을 읽어 div#image_container에 넣음
				var image = document.createElement("img"); 
				image.setAttribute("src", event.target.result); 
				document.querySelector("div#image_container").appendChild(image);
				}
				
			reader.readAsDataURL(event.target.files[0]);
		}
	 </script>
	 

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
	    height: 30px;
	}
	#boardCtg {
	    float: left;
	}
	td > textarea{
	    color: #3f63b5;
    height: 40px;
    font-size: 20px;
    background: #cfe3f6;
    border-color: aliceblue;

	}
	
	#boardCtgNo    {background: #f2f9fb;
    float: left;
    height: 30px;
    text-align: center;
    font-size: 19px;
	width: 95px;
    color: #3f63b5;
    border-radius: 10px;
    border-color: #f2f9fb;
    font-weight: 400;
	}
	
	input file-upload-button{
	color:red;
	}

</style>



<body>
	
	<div id="wrap">
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
	


	<div class="layout">
		<form id= "/boardForm" name="/boardForm" enctype="multipart/form-data" method="post" action="<c:url value='/insertboard'/>"> <!--  writedo로 넘겨주고 post방식으로 넘겨주겠다 -->
		<br>
		<table class="table table-striped" style="text-align: center; border: 1px solid #f2f9fb; width:500px;">
		<!-- 실행시 form 안에 데이터가 writedo로 넘어간다 -->
		<thead>
			<tr>
				<th colspan="2" style="background-color: #f2f9fb; text-align: center;">공지사항 글쓰기</th>
			</tr>	
		</thead>
		<tbody>
		<tr>
			<td><select id="boardCtgNo" name="boardCtgNo">
				<option value="0" selected>소식</option>
				<option value="1">카드뉴스</option>
				<option value="2">주문/결제</option>
				<option value="3">교환/반품</option>
				<option value="4">제품</option>
				<option value="5">회원</option>
				
			</select></td>
			</tr>
			<tr>
		    <td><textarea rows="1" cols="50" placeholder="글 제목"  name="boardTitle" maxlength="50" style="width:500px;"></textarea></td>
		    </tr>
		    <tr>
			<td><textarea class="form-control" placeholder="글 내용" rows="10" cols="50" name="boardContent" maxlength="2048" style="height: 350px; width: 500px;" >${boardCtgList.boardContent}</textarea>
			
			</td>
			
			</tr>
			<tr>
				<td><input type="file" name="fileName" 
				
				style="color: #3f63b5;
					    width: 160px;
					    float: left;">
				
				</td>
			</tr>
			<!-- <tr>
			<td><input  id = "img_btn" type="file" name="hmImg" accept="image/*" onchange="setThumbnail(event);"></td>
			</tr> -->
		
	
		</tbody>
		</table>
		<input type="hidden" name="userId" value="${sessionScope.sid}">  <!-- 세션 아이디 받아오기 -->
			<input type="hidden" name="boardWriteDate" value="<%= sf.format(nowDate) %>"> 
		<button type="submit" button style="float:right;">작성</button> <!-- submit -> 이 버튼의 역할은 데이터를 전송하는 것 -->
				<a href="<c:url value='/boardDetailView/${boardCtgList.boardNo}'/>"><button>돌아가기</button></a>
		
		
		</form>
		<br>
		<form action="<c:url value='boardDetailView'/>" enctype="multipart/form-data" method="post">
<!-- <input type="file" name="profile">
<input type="submit"> -->
</form>
	</div>
	
	</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
</body>
</html>