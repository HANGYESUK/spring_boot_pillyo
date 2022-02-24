<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>약리스트</title>
		<link rel="stylesheet" href="<c:url value='/css/drug/drug.css'/>">	
<!-- 		<link rel="stylesheet" href="/css/test.css" />
 -->		<script
	    src="https://code.jquery.com/jquery-3.6.0.min.js"
	    integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	    crossorigin="anonymous"></script>
	</head>
	
	<style>
		.drugBox > img {
	    width: 100%;
   		 height: 50%;
   		 padding-bottom: 10px;
		}
		.drugBox itemName{
	   	    color: #1450b1;
		}
		body{
		    text-align: -webkit-center;
		
		}
		#searchBody{
		
		background: linear-gradient(
0deg
, #f7f9fb, #ffffff);
}
#search_result_container > h3{
color: #0d3bb1;
    font-size: 24px;
}

#search_result_container > small{
font-size: 20px;
    color: #3d61c0;
}
.displayNone {
		display:none;
	}
	
	#more-Btn > h3{
	color: #0d3bb1;
    font-size: 35px;
    
    width: 200px;
    height: 50px;
    /* margin-top: 14px; */
    padding-top: 10px;
    border-radius: 25px;
	}
	</style>
	
	
	<body>
		<div id="search_result_container">
			
				<h3>약 검색 결과</h3>
				<small>총 <fmt:formatNumber value="${fn:length(druglist)}" pattern="#,###" /> 건</small>
				<hr />
				
			<c:choose>
	    	 <c:when test="${fn:length(druglist) == 0}">
	       		 조회결과가 없습니다.
			 </c:when>
		     <c:otherwise>
		     
		    <div id="searchBody"> 
				<div id="searchResult">
				
					<c:forEach items="${druglist}" var="drug" varStatus="status">
							
							<div class="drugBox">
								<img src="${drug.itemImage}" >
								<div class="drugBoxText">
								<a class="itemName" href="<c:url value='/drugDetailView/${drug.drugInfoNo}'/>">${drug.itemName}</a><br>
								<a class="shapeInfo">${drug.entpName}</a>
								
								<%-- <c:if test="${drug.itemName eq '('}"><br></c:if> --%>
								</div>
							</div>
							
					</c:forEach>
					
				</div>
				<div id="more-Btn" class="low" onclick="more()"><h3>더보기</h3></div><br>
			</div>
			   </c:otherwise> 
			</c:choose>
			
		

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
    	</div> <!-- wrap -->
    	
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
			
		
    	</div> <!-- searchResult_container -->
	</body>
</html>