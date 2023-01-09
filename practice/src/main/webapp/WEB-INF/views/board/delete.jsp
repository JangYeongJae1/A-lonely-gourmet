<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet" />
</head>
<body>
	<c:if test="${login == null}">
		<a href="<%=request.getContextPath() %>/member/login.do">로그인</a>
	</c:if>
	<c:if test="${login != null}">
		<a href="<%=request.getContextPath() %>/member/logout.do">로그아웃</a>
	</c:if>
	<h2>커뮤니티/삭제 부분입니다.</h2>
	<form action="delete.do" method="post">
		<input type ="hidden" name="bidx" value="${vo.bidx}">
		[${vo.category}]	${vo.title}
		<hr>
		${vo.nickname}<br>
		${vo.wdate}	조회수${vo.hit}<br>
		${vo.contents}<br>
		<button>삭제</button>
		<button type="reset" onclick="location.href='view.do?bidx=${vo.bidx}'">취소</button>
	</form>
</body>
</html>