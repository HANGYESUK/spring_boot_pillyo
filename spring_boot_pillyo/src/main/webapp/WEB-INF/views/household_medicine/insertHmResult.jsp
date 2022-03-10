<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>우리집 상비약 목록</title>
		<link rel="stylesheet" href="/css/hm/insertHmResult.css" />
		
		
	</head>
	<body>
		<div id="wrap">
		
		<!-- TOP -->
		<jsp:include page="/WEB-INF/views/layout/top.jsp" flush='true' />
		
		<div id="navMargin"></div>
		<section id="section">
		<div class="main-Content-Body low">
				<div class="basket-Item-Container colunm" style="width: 100%;">
					<h2>우리집 약관리</h2>

						<div class="colum">
							<c:if test="${not empty sessionScope.sid}">
								<div class="low">
									<h4 id="UserName" style="color: #81B89A;">${sessionScope.sid} 님</h4>
									<p>등록된 약 전체 리스트 입니다</p>
								</div>
								
								<div style="margin-top: 20px" class="low">
									<a href="/hmForm"><input type="button" class="btn" value="우리집 약관리 가기"></a>
									<a href="/insertHmForm"><input type="button" class="btn" value="등록 하러 가기"></a>
								</div>
								<br><br>
							</c:if>
						</div>
						
					<div id="tab">
					<!-- 등록 폼에서 등록버튼 누르면 방금 입력했던 폼이 나오는 것 -->
					<c:forEach items="${hmList}" var="hm">
						<div id="table_tab">
						<table>
							<tr> <td colspan ='2'> <img src="<c:url value='/images/${hm.hmImg}'/>" id = "hmImg"></td></tr>
							<tr> <th>약품명</th> <td  style="width: 120px;">${hm.hmName}</td></tr>
							<tr> <th>사용기한</th> <td>${hm.hmUseByDate}</td></tr>
							<tr> <th>메모</th> <td>${hm.hmMemo}</td></tr>
							<tr> <tH>카테고리</th> <td>${hm.hmCtgNo}</td></tr>
							<tr> <td><a style="    text-decoration-line: none;
    color: #4f58c9;" href="<c:url value='/updateHmForm/${hm.hmNo}'/>">정보 수정</a></td>
								 <td><a style="    text-decoration-line: none;
    color: #c94f5a;" href="javascript:deleteCheck(${hm.hmNo});">등록 삭제</a></td></tr>
						</table>
						</div>
					</c:forEach>
					</div>
				</div>
			</div>
					
					<!-- 등록 폼에서 등록버튼 누르면 방금 입력했던 폼이 나오는 것 -->		
		 			<script type="text/javascript">
						function deleteCheck(no){
							var answer = confirm("선택한 "+ no +"번 상비약 정보를 삭제하시겠습니까?");
							if(answer == true){
								location.href="<c:url value='/deleteHm/"+no+"'/>";
							}
						}
					</script>
		</section>

		<!-- BOTTOM  -->
		<jsp:include page="/WEB-INF/views/layout/bottom.jsp" flush='true' />
		
		</div><!-- wrap -->
	</body>
</html>
