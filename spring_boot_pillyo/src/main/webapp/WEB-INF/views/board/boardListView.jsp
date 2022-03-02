<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		<link href="<c:url value='/css/board/board.css'/>" rel="stylesheet" type="text/css">	
		<script src="<c:url value='/js/mainBanner.js'/>"></script>
	    <link href="<c:url value='/css/mainBanner.css'/>" rel="stylesheet" type="text/css">	

<title>전체 게시글 목록</title>

</head>

<style>
	.boardBody {
    width: fit-content; /* 태그의 넓이를 500px로 */
	margin:0 auto; /* 양쪽 여백을 위아래는 0 좌우는 자동으로 잡아주겠다! */
	margin-top : 40px;
	box-shadow: 0px 1px 4px #0d3bb1;   /*  height: 700px; */
    border-radius: 11px;
    
	}
	
	.displayNone {
		display:none;
	}
	
	#more-Btn{
		color: #3f63b5;
   	}
	
	#more-Btn h3{
		text-align:center;
   	    margin: 10px 10px 10px 0px;
   	}
	
</style>

<body>

	<div id="wrap">
				
				<!-- TOP -->
				<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
				<div id="navMargin"></div>
				
				
				 <article>             
		                <div class="slider-1">
		                    <div class="slides">
		                        <div class="active" style="background-image:url(image/slide_img_01.jpg);"></div>
		                        <div style="background-image:url(image/slide_img_02.jpg);"></div>
		                        <div style="background-image:url(image/slide_img_03.jpg);"></div>
		                        <div style="background-image:url(image/slide_img_05.jpg);"></div>
		                        <div style="background-image:url(image/slide_img_04.jpg);"></div>
		                    </div>
		                    <div class="page-btns">
		                        <div class="active" ></div>
		                        <div></div>
		                        <div></div>
		                        <div></div>
		                    </div>
		                    <div class="side-btns">
		                        <div>
		                            <span><i class="fas fa-angle-left"></i></span>
		                        </div>
		                        <div>
		                            <span><i class="fas fa-angle-right"></i></span>
		                        </div>
		                    </div>
		                </div>
		            </article>
		
				
		<section id="section" style="    padding-top: 1px;">
			<div class="boardBody">
			<br>
				<div class="ctgMenuBox">
					<label for="boardNews">
						<div class="ctgMenuItem">
							<input type="radio" id="boardNews" name="boardCtg" value="boardNews" checked>알약요 소식
						</div>
					</label>
					<label for="boardQna">
						<div class="ctgMenuItem">
							<input type="radio" id="boardQna" name="boardCtg" value="boardQna">자주 묻는 질문
						</div>
					</label>
				</div>
				<div id="ctgMenuItemtotalBox">
					<div class="ctgMenuItemtotal">
						<div class="ctgMenuItemSub">
						<a href="<c:url value='/listAllBoardQna2'/>">주문/결제</a></div>
						<div class="ctgMenuItemSub">
						<a href="<c:url value='/listAllBoardQna3'/>">교환/반품</a></div>
						<div class="ctgMenuItemSub">
						<a href="<c:url value='/listAllBoardQna4'/>">제품</a></div>
						<div class="ctgMenuItemSub">
						<a href="<c:url value='/listAllBoardQna5'/>">회원</a>
					</div>
				</div>
				<div id="boardContent">
					<div id="boardNewsContent">
						<table class="table table-striped">
							<thead>
								<tr>
									<th style="width:90px;">분류</th>
									<th style="width:470px;">제목</th>
									<!-- <th style="background-color: #eeeeee; text-align: center; width:100px;">작성자</th> -->
									<th style="width:100px;">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardNewsList}" var="board">
							  		<c:if test="${board.boardCtgNo eq '0'}">
							  			<tr class="drugBox">
							  				<td>소식</td>
							  				<td><a href="<c:url value='/boardDetailView/${board.boardNo}'/>">${board.boardTitle }</a></td>
											<td>${board.boardWriteDate}</td>
										</tr>
							  		</c:if>
							  		<c:if test="${board.boardCtgNo eq '1'}">
							  			<tr class="drugBox">
							  				<td>카드뉴스</td>
							  				<td><a href="<c:url value='/boardDetailView/${board.boardNo}'/>">${board.boardTitle }</a></td>
											<td>${board.boardWriteDate}</td>
										</tr>
							  		</c:if>
						   		</c:forEach>
							</tbody>
						</table>
			   		</div>
					   		
			   		<div id="boardQnaContent">
			   			<table class="table table-striped">
							<thead>
								<tr>
									<th style="width:90px;">분류</th>
									<th style="width:470px;">제목</th>
									<!-- <th style="background-color: #eeeeee; text-align: center; width:100px;">작성자</th> -->
									<th style="width:100px;">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${boardQnaList}" var="board">
							  		<c:if test="${board.boardCtgNo eq '2'}">
							  			<tr class="drugBox">
							  				<td>주문/결제</td>
							  				<td><a href="<c:url value='/boardDetailView/${board.boardNo}'/>">${board.boardTitle }</a></td>
											<td>${board.boardWriteDate}</td>
										</tr>
							  		</c:if>
							  		<c:if test="${board.boardCtgNo eq '3'}">
							  			<tr class="drugBox">
							  				<td>교환/반품</td>
							  				<td><a href="<c:url value='/boardDetailView/${board.boardNo}'/>">${board.boardTitle }</a></td>
											<td>${board.boardWriteDate}</td>
										</tr>
							  		</c:if>
							  		<c:if test="${board.boardCtgNo eq '4'}">
							  			<tr class="drugBox">
							  				<td>제품</td>
							  				<td><a href="<c:url value='/boardDetailView/${board.boardNo}'/>">${board.boardTitle }</a></td>
											<td>${board.boardWriteDate}</td>
										</tr>
							  		</c:if>
							  		<c:if test="${board.boardCtgNo eq '5'}">
							  			<tr class="drugBox">
							  				<td>회원</td>
							  				<td><a href="<c:url value='/boardDetailView/${board.boardNo}'/>">${board.boardTitle }</a></td>
											<td>${board.boardWriteDate}</td>
										</tr>
							  		</c:if>
						   		</c:forEach>
					   		</tbody>
						</table>
			   		</div>

				
					<a href="<c:url value = '/boardForm'/>"><button>글쓰기</button></a>
					<div id="more-Btn" class="low" onclick="more()"><h3>더보기</h3><br></div>
			</div>
		</section>
		        
		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
			
	</div> <!-- wrap -->
			
</body>
<script>
	let count = 10;
       let drugBox = document.getElementsByClassName("drugBox")
       
       for(let i=count; i<drugBox.length; i++) {
       	drugBox[i].classList.add('displayNone')
       }
       
       function more() {
       	
       	console.log('string')
        for(let i=count; i<drugBox.length; i++) {
        	drugBox[i].classList.remove('displayNone')
        	if(i >= count + 9) {
        		break;
        	}
        }
        count += 10
       }
</script>
<script type="text/javascript">
	$('input[type="radio"]').change(function(){
			var radioId = $('input[name="boardCtg"]:checked').val();
			console.log(radioId);
			if (radioId == "boardNews") {
				$(boardQnaContent).css('display', 'none');
				$(boardNewsContent).css('display', 'block');
				$(".ctgMenuItemSub").css('display', 'none');
			} else if (radioId == "boardQna") {
				$(boardQnaContent).css('display', 'block');
				$(boardNewsContent).css('display', 'none');
				$(".ctgMenuItemSub").css('display', 'block');
			}
	});
</script>
</html>