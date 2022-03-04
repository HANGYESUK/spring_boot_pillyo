<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	바보<br>
				<c:forEach items="${commentList }" var="comment">
		   			댓글 번호 ${comment.commentNo}<br>
		   			작성자 ${comment.userId}<br>
		   			제목 ${comment.commentTitle}<br>
		   			내용 ${comment.commentContent}<br>
		   			작성일 ${comment.commentWriteDate}<br>	
				</c:forEach>
</body>
</html>