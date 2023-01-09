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
	<h2>커뮤니티/수정 부분입니다.</h2>
	<form action="modify.do" method="post">
		<input type ="hidden" name="bidx" value="${vo.bidx}">
		<select name="category">
			<option>${vo.category}</option>
			<option value='잡담' <c:if test="${vo.category eq '잡담' }">selected</c:if>>잡담</option>
			<option value='꿀팁'>꿀팁</option>
			<option value='후기'>후기</option>
		</select> 
		<input type="text" name="title" value="${vo.title}">
		<hr>
		${vo.nickname}<br>
		${vo.wdate}	조회수	${vo.hit}<br>
		<input type="text" name="contents" value="${vo.contents}"><br>
		<button>수정</button>
		<button type="reset" onclick="location.href='view.do?bidx=${vo.bidx}' ">취소</button>
	</form>
</body>
</html>