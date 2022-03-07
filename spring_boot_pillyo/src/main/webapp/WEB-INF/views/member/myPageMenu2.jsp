<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>마이페이지 메뉴</title>
 		<link rel="stylesheet" href="/css/layout/myPage2.css" />
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
	</head>
	
	<style>
		li > a{
		        font-size: 20px;
			    color: #305ec7;
			    font-weight: 49;
			        line-height: 43px;
		}
	</style>
	<body>
		
	
			
			<div id="myPageMenuBox2">
			
			<c:forEach items="${sessionScope.SFamList}" var="fam">
								 <a href="">${fam.famName}</a>
							</c:forEach>
			
			<ul id="myPageItemBox2">
				<li><label for="boardNews">
			<div class="ctgMenuItem" style=" margin-bottom: 15px;">
				<input type="radio" id="boardNews" name="boardCtg" value="boardNews" checked>알약요 소식
			</div>
		</label></li>
				<li><label for="boardQna">
			<div class="ctgMenuItem" style="margin-bottom: 5px;">
				<input type="radio" id="boardQna" name="boardCtg" value="boardQna">자주 묻는 질문
			</div>
		</label></li>
				<li><label for="orderPay">
						<div class="ctgMenuItemSub">
							<input type="radio" id="orderPay" name="boardCtg" value="orderPay">주문/결제
						</div>
					</label></li>
				<li><label for="trade">
						<div class="ctgMenuItemSub">
							<input type="radio" id="trade" name="boardCtg" value="trade">교환/반품
						</div>
					</label></li>
				<li><label for="product">
						<div class="ctgMenuItemSub">
							<input type="radio" id="product" name="boardCtg" value="product">제품
						</div>
					</label></li>
				<li><label for="member">
						<div class="ctgMenuItemSub">
							<input type="radio" id="member" name="boardCtg" value="member">회원
						</div>
					</label>
				
				</li>
			</ul>
			</div>
			
		
						
	</body>
</html>