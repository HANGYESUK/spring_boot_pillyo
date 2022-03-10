<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<%-- <%
	if (application.getAttribute("Counter") != null) {
		String strCounter = String.valueOf(application.getAttribute("Counter"));
		int counter = Integer.parseInt(strCounter) + 1; 
		// 페이지에 새로운 접속이 시도될때 application 변수에 Counter를 1씩 증가시킨다. 
		application.setAttribute("Counter", counter);
		} else {
			application.setAttribute("Counter", 1); } %> --%>
<% 
	 Integer count = (Integer)application.getAttribute("count");
	 Integer newCount = null;
	 
	 if(count == null) {
	  application.setAttribute("count", 1);
	  
	 } else {
	  
		  if(session.isNew()) {
		   newCount = count + 1;
		   application.setAttribute("count", newCount);
		  } 
	 }
%>


<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>관리자 메인</title>
		<script src="<c:url value='/js/jquery-3.6.0.min.js'/>"></script>
		
	</head>
	<body>
		<div id="wrap">
			
			<!-- TOP -->
			<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
			<div id="navMargin"></div>
			
			<section id="section">
			
				<div id="adminContainer">
			
				<jsp:include page="/WEB-INF/views/admin/adminMainMenu.jsp" flush='true' />
			
				<div id="adminSection">			
					<div id="adminArticle">
						
						<div class="adminInfoBox">
							<div id="userCnt">
							 	회원수:
								<span>${userCnt}명</span>
							</div>
						</div>
						
						<div class="adminInfoBox">
								방문자수 : 
								<span><%=application.getAttribute("count")%>명</span>
						</div>
						
						<div class="adminInfoBox">
								문자 건수: 건
						</div>	
					</div>					
				
				<div id="adminbottomArticle" >
					<img src="" alt="" onerror="this.src='/img/medicap.jpg'" width="1000px" height="500px"/>
					
				</div>
					
				</div>
				
				
				</div> <!-- adminContainer -->
			</section>
	        
			<!-- BOTTOM  -->
			<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
      </div> <!-- wrap -->
	</body>
</html>