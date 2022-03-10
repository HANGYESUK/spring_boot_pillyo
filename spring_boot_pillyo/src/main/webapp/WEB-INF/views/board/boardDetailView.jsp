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
		<title>게시글 상세 페이지</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link href="<c:url value='/css/board/board.css'/>" rel="stylesheet" type="text/css">	
		<script src="<c:url value='/js/mainBanner.js'/>"></script>
		<script src="<c:url value='/js/commentForm.js'/>"></script>
		
	    <link href="<c:url value='/css/mainBanner.css'/>" rel="stylesheet" type="text/css">	
	</head>
	
	<style>
		.container {
	    width: fit-content; /* 태그의 넓이를 500px로 */
		margin:0 auto; /* 양쪽 여백을 위아래는 0 좌우는 자동으로 잡아주겠다! */
		margin-top : 40px;
		}
		
		td > textarea {
		    height: 450px;
    width: 600px;
    border-color: #cfe2f6;
    background: #f4faff;
    color: #3f63b5;
    font-size: 16px;
    border: none;
    resize: none;
    border:1px soild #cfe2f6;
    outline:none;
    
    
		}
		
	.commentText {
	border-color: #5978bf;
    border-radius: 2px;
	      height: 45px;
    width: 271px;
    float: left;
    /* border: none; */
    resize: none;
    outline: none;
    color: #3f63b5;
    font-size: 16px;
	}
	
		#button2{
		    margin-top: -7px;
		    border: 0;
	    background: white;
    color: #3f63b5;
    border-color: #f2f9fb;
    height: 38px;
    width: 70px;
    border-radius: 10px;
    font-size: 15px;
    
        float: left;
    margin-right: 127px;
}

#button2:hover{
	font-size: 18px;
	font-weight:600;
}

#commentAllForm{
	    padding-top: 12px;
	    float: right;
    
    margin-right:-152px;
}    
		.commentName{
		font-size: 23px;
    color: #3f63b5;
    font-weight: 400;
    height: 10px;
    padding-left: 33px;
    padding-top: 15px;}
		
		td{
		    color: #5d5d5d;
    height: 33px;
    font-size: 18px;
		}
		hr{
		    border: 0;
    height: 1px;
    box-shadow: 1px 7px 0px 0px #bababa;
    border-bottom: 10px;
    margin-bottom: 17px;
		}
		
		#commentAllListForm{
    border-radius: 5px;
    margin-left: 10px;
    padding-left: 23px;

		 height: 307px;
    margin-top: -121px;
    width: 510px;
    text-align: center;
    overflow-y: scroll;
    border-color: #f7f7f7;
    box-shadow: 0 4px 5px rgb(0 0 0 / 20%);
    background: white;}
    
    #commentAllListForm::-webkit-scrollbar {
    /* display: none;  *//* Chrome, Safari, Opera*/
}


/* 스크롤바 설정*/
#commentAllListForm::-webkit-scrollbar{
    width: 6px;
}

/* 스크롤바 막대 설정*/
#commentAllListForm::-webkit-scrollbar-thumb{
    height: 17%;
    background-color: #3f63b5;
    border-radius: 10px;  
}

/* 스크롤바 뒷 배경 설정*/
#commentAllListForm::-webkit-scrollbar-track{
    background-color: #becae6;
}
	</style>
	
	
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
	
	<br>
		<!-- 게시판 글 보기 양식 영역 시작 -->
	<div class="container">
		<div class="row">
			<table class="table table-stripedDetail">
				<thead>
					<tr>
						<th width=600px; colspan="3" style="text-align: center; font-size:25px;">알약요
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
					</tr>
					<tr>
					<th style="width:90px;">분류</th>
					<th style="width:470px;">제목</th>
					<!-- <th style="background-color: #eeeeee; text-align: center; width:100px;">작성자</th> -->
					<th style="width:100px;">작성일</th>
				</tr>
				</thead>
				<tbody>
				<tr>
						<!-- <td style="width: 20%;">글 제목</td> -->
						<td><c:if test="${board.boardCtgNo eq '0'}">소식</c:if>
						<c:if test="${board.boardCtgNo eq '1'}">카드뉴스</c:if>
						<c:if test="${board.boardCtgNo eq '2'}">주문/결제</c:if>
						<c:if test="${board.boardCtgNo eq '3'}">교환/반품</c:if>
						<c:if test="${board.boardCtgNo eq '4'}">제품</c:if>
						<c:if test="${board.boardCtgNo eq '5'}">회원</c:if></td>
					
						<!-- <td style="width: 20%;">글 제목</td> -->
						<td>${board.boardTitle}</td>
					
						<%-- <!-- <td>작성자</td> -->
						<td>${board.userId}</td> --%>
					
						
						<td>${board.boardWriteDate}</td>
					</tr>
					<tr>
						<!-- <td>내용</td> -->
						<td colspan="3" style="    background: #ffffff; height: 500px; text-align:center;"><textarea readonly>${board.boardContent}</textarea></td>
					</tr>
					<tr>
						<td colspan="3" style="    background: #ffffff; text-align:center;">
						<img src="<c:url value='/images/${board.boardImg}'/>" style = "width : 604px;" >
						<br> </td>
					</tr>
				
				</tbody>
				
			</table>
			<a href="javascript:deleteCheck();"><button>게시글 삭제</button></a>
			<a href="<c:url value='/updateBoardForm/${board.boardNo}'/>"><button  >게시글 수정</button></a>
			<a href="<c:url value='/listAllBoard'/>"><button>목록</button></a><br><br><br><br>
			
			<a class="commentName">댓글</a><hr>
			
			<div id="commentAllForm">
			
<form id= "/commentForm" name="/commentForm" enctype="multipart/form-data" method="post" action="<c:url value='/insertcomment/${board.boardNo}'/>"> <!--  writedo로 넘겨주고 post방식으로 넘겨주겠다 -->
		
		<textarea class="commentText" placeholder="댓글 달기.." name="commentContent">${comment.commentContent}</textarea>
			<input type="submit" id="button2" class="btn btn-primary pull-right" value="게시">
			<input type="hidden" name="userId" value="${sessionScope.sid}">  <!-- 세션 아이디 받아오기 -->
			<input type="hidden" name="commentWriteDate" value="<%= sf.format(nowDate) %>">
			<input type="hidden" name="boardNo" value="${board.boardNo}">
<!-- 		<button type="submit" button style="float:right;">작성</button>

 -->
 					
 </form>
 </div>
		
			
			
			
			
			<br><br><br><br><br><br><br>
			<div id=commentAllListForm>
			<table class="table table-striped2">
						<thead>
						<!-- <tr>
						<th>내용	</th>
							<th>작성자</th>
							<th style="width:90px;">제목</th>	
							<th style="background-color: #eeeeee; text-align: center; width:100px;">작성자</th>
							<th>작성일</th>
							
						</tr> -->
							<!-- <tr>
								<th style="width:180px;">내용	</th>
							</tr> -->
						</thead>
						<tbody style="overflow:scroll;">
				        	<c:forEach items="${commentList }" var="comment">
				        		
				        		<tr>
				        		<td>${comment.userId}</td>
								   	<td>${comment.commentContent}</td>
				        		
						   			 <td>댓글 번호 ${comment.commentNo}</td> 
						   			
						   			<%-- <td>${comment.commentTitle}</td> --%>
						   			
						   			<td style="font-size:10px; font-size: 13px;
    padding-top: 5px;">${comment.commentWriteDate}</td>
						   		<td><a href="javascript:deleteCheck2();"><button>댓글 삭제</button></a>	
						   				
						   		</td>
						   		
						   		</tr>
						   		
						   	<%-- 	<tr>
						   			<td>${comment.commentContent}</td>
						   		</tr> --%>
							</c:forEach>
						</tbody>
						
						<thead>
							
							<!-- <tr>
								<th colspan="2"">내용	</th>
							</tr> -->
						</thead>
						<tbody>
				        	<%-- <c:forEach items="${commentList }" var="comment">
				        		<tr class="drugBox">
						   			<td>댓글 번호 ${comment.commentNo}</td>
						   			<td>${comment.userId}</td>
						   			<td>${comment.commentTitle}</td>
						   			
						   			<td>${comment.commentWriteDate}</td>
						   		</tr>	
						   		<tr>
						   			<td>${comment.commentContent}</td>
						   		</tr>
							</c:forEach> --%>
							
								<tr>
					<%-- 	<td style="float: left;">
							<a href="<c:url value='/listAllBoard'/>"><button>목록</button></a></td>
			
			<!-- 해당 글의 작성자가 본인이라면 수정과 삭제가 가능하도록 코드 추가 -->
			<td>
			<a href="<c:url value='/updateBoardForm/${board.boardNo}'/>"><button  >게시글 수정</button></a>
			<a href="javascript:deleteCheck();"><button>게시글 삭제</button></a><br><br><br><br>
			
						</td> --%>
					</tr>
						</tbody>
			</table>	
			</div>
			
			
			<br>
			
			
<%-- 			<input type="hidden" name="id" value="${board.id}">
 --%>			
			
			
			<script type="text/javascript">
				function deleteCheck(){
					var answer = confirm("게시글을 삭제하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deleteBoard/${board.boardNo}' />";
					}
				}
			</script>
			
			<script type="text/javascript">
				function deleteCheck2(){
					var answer = confirm("댓글을 삭제하시겠습니까?");
					if(answer == true){
						location.href="<c:url value='/deleteComment/${comment.commentNo}' />";
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