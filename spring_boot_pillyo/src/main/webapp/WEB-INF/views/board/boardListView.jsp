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
	#section{
	    padding-top: 1px;
    padding-left: 115px;
	}

	input[type="radio" i] {
	display:none;
	
	}
	.boardBody {
    width: fit-content; /* 태그의 넓이를 500px로 */
	margin:0 auto; /* 양쪽 여백을 위아래는 0 좌우는 자동으로 잡아주겠다! */
	/* margin-top : 40px; */
/* 	box-shadow: 0px 1px 4px #c4c4c4;   /*  height: 700px; */
 */    border-radius: 11px;
    
	}
	
	.displayNone {
		display:none;
	}
	
	.displayNone2 {
		display:none;
	}
	
	#more-Btn{
		color: #3f63b5;
   	}
	
	#more-Btn h3{
		text-align:center;
   	    margin: 10px 10px 10px 0px;
   	}
   		#more-Btn2{
		color: #3f63b5;
		display:none;
   	}
	
	#more-Btn2 h3{
		text-align:center;
   	    margin: 10px 10px 10px 0px;
   	}
   	
   	.b{
   	font-size: 30px;
    padding-left: 14px;
    color: #3f63b4;
    font-weight: 500;
   	}
   	
   	hr{
/*    	background-color: blue;
 */   	border:0;
   	height: 1px;
    /* background-color: #e6e6e6; */
    box-shadow: 1px 7px 0px 0px #bababa;
}
   	
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
		                    <div class="page-btns" style="display:none;">
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
				            <jsp:include page="/WEB-INF/views/member/myPageMenu2.jsp" flush='true' />
		
		
<!-- 		<div id="sidemenu">		
		<div>
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
		
	
	<div>
	<label for="orderPay">
						<div class="ctgMenuItemSub">
							<input type="radio" id="orderPay" name="boardCtg" value="orderPay">주문/결제
						</div>
					</label>
					<label for="trade">
						<div class="ctgMenuItemSub">
							<input type="radio" id="trade" name="boardCtg" value="trade">교환/반품
						</div>
					</label>
					<label for="product">
						<div class="ctgMenuItemSub">
							<input type="radio" id="product" name="boardCtg" value="product">제품
						</div>
					</label>
					<label for="member">
						<div class="ctgMenuItemSub">
							<input type="radio" id="member" name="boardCtg" value="member">회원
						</div>
					</label>
	</div>
</div>
		 -->
		
		
		
		
		
		
		
		
		
		
		
			<div class="boardBody">
			<br>		
				<!-- <div class="ctgMenuBox">
					<ul><label for="boardNews">
						<div class="ctgMenuItem">
							<input type="radio" id="boardNews" name="boardCtg" value="boardNews" checked>알약요 소식
						</div>
					</label></ul>
					<ul><label for="boardQna">
						<div class="ctgMenuItem">
							<input type="radio" id="boardQna" name="boardCtg" value="boardQna">자주 묻는 질문
						</div>
					</label></ul>
				</div>
				<div id="ctgMenuItemtotalBox">
					<div class="ctgMenuItemtotal">
						<label for="orderPay">
							<div class="ctgMenuItemSub">
								<input type="radio" id="orderPay" name="boardCtg" value="orderPay">주문/결제
							</div>
						</label>
						<label for="trade">
							<div class="ctgMenuItemSub">
								<input type="radio" id="trade" name="boardCtg" value="trade">교환/반품
							</div>
						</label>
						<label for="product">
							<div class="ctgMenuItemSub">
								<input type="radio" id="product" name="boardCtg" value="product">제품
							</div>
						</label>
						<label for="member">
							<div class="ctgMenuItemSub">
								<input type="radio" id="member" name="boardCtg" value="member">회원
							</div>
						</label>
					</div>
				</div> -->
				<div id="boardContent">
					<!-- 소식 -->
					<div id="boardNewsContent">
						<table class="table table-striped">
							<thead>
							<a class="b">알약요 소식</a> <hr>
								<!-- <tr>
									공지사항 
									<th style="width:90px;">분류</th>
									<th style="width:470px;">제목</th>
									<th style="background-color: #eeeeee; text-align: center; width:100px;">작성자</th>
									<th style="width:100px;">작성일</th>
								</tr> -->
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
						<br><br>
			   		</div><div id="more-Btn" class="low" onclick="more()"><h3>더보기</h3><br></div>
					
					<!-- 자주묻는질문 -->
			   		<div id="boardQnaContent">
			   			<table class="table table-striped">
							<thead>
							<a class="b">자주묻는질문</a> <hr>
								<!-- <tr>
									<th style="width:90px;">분류</th>
									<th style="width:470px;">제목</th>
									<th style="background-color: #eeeeee; text-align: center; width:100px;">작성자</th>
									<th style="width:100px;">작성일</th>
								</tr> -->
							</thead>
							<tbody>
								<c:forEach items="${boardQnaList}" var="board">
							  		<c:if test="${board.boardCtgNo eq '2'}">
							  			<tr class="drugBox2">
							  				<td>주문/결제</td>
							  				<td><a href="<c:url value='/boardDetailView/${board.boardNo}'/>">${board.boardTitle }</a></td>
<%-- 											<td>${board.boardWriteDate}</td>
 --%>										</tr>
							  		</c:if>
							  		<c:if test="${board.boardCtgNo eq '3'}">
							  			<tr class="drugBox2">
							  				<td>교환/반품</td>
							  				<td><a href="<c:url value='/boardDetailView/${board.boardNo}'/>">${board.boardTitle }</a></td>
<%-- 											<td>${board.boardWriteDate}</td>
 --%>										</tr>
							  		</c:if>
							  		<c:if test="${board.boardCtgNo eq '4'}">
							  			<tr class="drugBox2">
							  				<td>제품</td>
							  				<td><a href="<c:url value='/boardDetailView/${board.boardNo}'/>">${board.boardTitle }</a></td>
<%-- 											<td>${board.boardWriteDate}</td>
 --%>										</tr>
							  		</c:if>
							  		<c:if test="${board.boardCtgNo eq '5'}">
							  			<tr class="drugBox2">
							  				<td>회원</td>
							  				<td><a href="<c:url value='/boardDetailView/${board.boardNo}'/>">${board.boardTitle }</a></td>
<%-- 											<td>${board.boardWriteDate}</td>
 --%>										</tr>
							  		</c:if>
						   		</c:forEach>
					   		</tbody>
						</table><br><br>
			   		</div><div id="more-Btn2" class="low" onclick="more1()"><h3>더보기</h3><br></div>
			   		
			   		<!-- 자문질 - 주문결제 -->
			   		<div id="boardOrderPayContent">
			   			<table class="table table-striped">
							<thead>
							<a class="b">자주묻는질문</a> <hr>
								<!-- <tr>
									<th style="width:90px;">분류</th>
									<th style="width:470px;">제목</th>
									<th style="background-color: #eeeeee; text-align: center; width:100px;">작성자</th>
									<th style="width:100px;">작성일</th>
								</tr> -->
							</thead>
							<tbody>
								<c:forEach items="${boardOrderPayList}" var="board">
							  		<c:if test="${board.boardCtgNo eq '2'}">
							  			<tr class="drugBox3">
							  				<td>주문/결제</td>
							  				<td><a href="<c:url value='/boardDetailView/${board.boardNo}'/>">${board.boardTitle }</a></td>
<%-- 											<td>${board.boardWriteDate}</td>
 --%>										</tr>
							  		</c:if>
						   		</c:forEach>
					   		</tbody>
						</table><br><br>
			   		</div>
			   		
			   		<!-- 자묻질 - 교환반품 -->
			   		<div id="boardTradeContent">
			   			<table class="table table-striped">
							<thead>
							<a class="b">자주묻는질문</a> <hr>
								<!-- <tr>
									<th style="width:90px;">분류</th>
									<th style="width:470px;">제목</th>
									<th style="background-color: #eeeeee; text-align: center; width:100px;">작성자</th>
									<th style="width:100px;">작성일</th>
								</tr> -->
							</thead>
							<tbody>
								<c:forEach items="${boardTradeList}" var="board">
							  		<c:if test="${board.boardCtgNo eq '3'}">
							  			<tr class="drugBox3">
							  				<td>교환/반품</td>
							  				<td><a href="<c:url value='/boardDetailView/${board.boardNo}'/>">${board.boardTitle }</a></td>
<%-- 											<td>${board.boardWriteDate}</td>
 --%>										</tr>
							  		</c:if>
						   		</c:forEach>
					   		</tbody>
						</table><br><br>
			   		</div>
			   		
			   		<!-- 자묻질 - 제품 -->
			   		<div id="boardProductContent">
			   			<table class="table table-striped">
							<thead>
							<a class="b">자주묻는질문</a> <hr>
								<!-- <tr>
									<th style="width:90px;">분류</th>
									<th style="width:470px;">제목</th>
									<th style="background-color: #eeeeee; text-align: center; width:100px;">작성자</th>
									<th style="width:100px;">작성일</th>
								</tr> -->
							</thead>
							<tbody>
								<c:forEach items="${boardProductList}" var="board">
							  		<c:if test="${board.boardCtgNo eq '4'}">
							  			<tr class="drugBox3">
							  				<td>제품</td>
							  				<td><a href="<c:url value='/boardDetailView/${board.boardNo}'/>">${board.boardTitle }</a></td>
<%-- 											<td>${board.boardWriteDate}</td>
 --%>										</tr>
							  		</c:if>
						   		</c:forEach>
					   		</tbody>
						</table><br><br>
			   		</div>
			   		
			   		<!-- 자묻질 - 회원 -->
			   		<div id="boardMemberContent">
			   			<table class="table table-striped">
							<thead>
							<a class="b">자주묻는질문</a> <hr>
								<!-- <tr>
									<th style="width:90px;">분류</th>
									<th style="width:470px;">제목</th>
									<th style="background-color: #eeeeee; text-align: center; width:100px;">작성자</th>
									<th style="width:100px;">작성일</th>
								</tr> -->
							</thead>
							<tbody>
								<c:forEach items="${boardMemberList}" var="board">
							  		<c:if test="${board.boardCtgNo eq '5'}">
							  			<tr class="drugBox3">
							  				<td>회원</td>
							  				<td><a href="<c:url value='/boardDetailView/${board.boardNo}'/>">${board.boardTitle }</a></td>
<%-- 											<td>${board.boardWriteDate}</td>
 --%>										</tr>
							  		</c:if>
						   		</c:forEach>
					   		</tbody>
						</table><br><br>
			   		</div>
				
					<a href="<c:url value = '/boardForm'/>"><button>글쓰기</button></a>
					<!-- <div id="more-Btn" class="low" onclick="more()"><h3>더보기</h3><br></div> -->
			</div>
		</section>
		<!-- <article>             
		                <div class="slider-1">
		                    <div class="slides">
		                        <div class="active" style="background-image:url(image/slide_img_01.jpg);"></div>
		                        <div style="background-image:url(image/slide_img_02.jpg);"></div>
		                        <div style="background-image:url(image/slide_img_03.jpg);"></div>
		                        <div style="background-image:url(image/slide_img_05.jpg);"></div>
		                        <div style="background-image:url(image/slide_img_04.jpg);"></div>
		                    </div>
		                    <div class="page-btns" style="    display: none;">
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
		            </article> -->
		        
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
		        for(let i=count; i<drugBox.length; i++) {
		        	drugBox[i].classList.remove('displayNone')
		        	if(i >= count + 9) {
		        		break;
		        	}
		        }
		        count += 10
	        }
	   
	        
    	</script>
    	
    	<script>
	        let count = 10;
	        let drugBox2 = document.getElementsByClassName("drugBox2")
	        
	        for(let i=count; i<drugBox2.length; i++) {
	        	drugBox2[i].classList.add('displayNone2')
	        }
	        
	        function more1() {
		        for(let i=count; i<drugBox2.length; i++) {
		        	drugBox2[i].classList.remove('displayNone2')
		        	if(i >= count + 9) {
		        		break;
		        	}
		        }
		        count += 10
	        }
	   
	        
    	</script>
<script type="text/javascript">
	$('input[name="boardCtg"]').change(function(){
			var radioId = $('input[name="boardCtg"]:checked').val();
			console.log(radioId);
			if (radioId == "boardNews") {
				$(boardNewsContent).css('display', 'block');
				$(boardQnaContent).css('display', 'none');
				$(".ctgMenuItemSub").css('display', 'none');
				$(boardOrderPayContent).css('display', 'none');
				$(boardTradeContent).css('display', 'none');
				$(boardProductContent).css('display', 'none');
				$(boardMemberContent).css('display', 'none');
				$("#more-Btn").css('display', 'block');
				$("#more-Btn2").css('display', 'none');
			} else if (radioId == "boardQna") {
				$(boardNewsContent).css('display', 'none');
				$(boardQnaContent).css('display', 'block');
				$(".ctgMenuItemSub").css('display', 'block');
				$(boardOrderPayContent).css('display', 'none');
				$(boardTradeContent).css('display', 'none');
				$(boardProductContent).css('display', 'none');
				$(boardMemberContent).css('display', 'none');
				$("#more-Btn").css('display', 'none');
				$("#more-Btn2").css('display', 'block');
			} 

			else if (radioId == "orderPay") {
				$(boardQnaContent).css('display', 'none');
				$(boardNewsContent).css('display', 'none');
				$(".ctgMenuItemSub").css('display', 'block');
				$(boardOrderPayContent).css('display', 'block');
				$(boardTradeContent).css('display', 'none');
				$(boardProductContent).css('display', 'none');
				$(boardMemberContent).css('display', 'none');
				$("#more-Btn").css('display', 'none');
				$("#more-Btn2").css('display', 'none');
			} else if (radioId == "trade") {
				$(boardQnaContent).css('display', 'none');
				$(boardNewsContent).css('display', 'none');
				$(".ctgMenuItemSub").css('display', 'block');
				$(boardOrderPayContent).css('display', 'none');
				$(boardTradeContent).css('display', 'block');
				$(boardProductContent).css('display', 'none');
				$(boardMemberContent).css('display', 'none');
				$("#more-Btn").css('display', 'none');
				$("#more-Btn2").css('display', 'none');
			} else if (radioId == "product") {
				$(boardQnaContent).css('display', 'none');
				$(boardNewsContent).css('display', 'none');
				$(".ctgMenuItemSub").css('display', 'block');
				$(boardOrderPayContent).css('display', 'none');
				$(boardTradeContent).css('display', 'none');
				$(boardProductContent).css('display', 'block');
				$(boardMemberContent).css('display', 'none');
				$("#more-Btn").css('display', 'none');
				$("#more-Btn2").css('display', 'none');
			} else if (radioId == "member") {
				$(boardQnaContent).css('display', 'none');
				$(boardNewsContent).css('display', 'none');
				$(".ctgMenuItemSub").css('display', 'block');
				$(boardOrderPayContent).css('display', 'none');
				$(boardTradeContent).css('display', 'none');
				$(boardProductContent).css('display', 'none');
				$(boardMemberContent).css('display', 'block');
				$("#more-Btn").css('display', 'none');
				$("#more-Btn2").css('display', 'none');
			}
	});
</script>
</html>