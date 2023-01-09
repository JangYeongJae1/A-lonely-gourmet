<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<html>
<head>
<title>혼밥의 고수입니다.</title>
</head>
<body>
	${login.nickname} 님 안녕하세요.
	<c:if test="${login == null}">
		<a href="<%=request.getContextPath() %>/member/login.do">로그인</a>
	</c:if>
	<c:if test="${login != null}">
		<a href="<%=request.getContextPath() %>/member/logout.do">로그아웃</a>
	</c:if>
	<a href="<%=request.getContextPath() %>/member/join.do">회원가입</a>
	<a href="<%=request.getContextPath() %>/member/list.do">회원 목록</a>
	<a href="<%=request.getContextPath() %>/board/list.do">커뮤니티</a>
</body>
</html>
