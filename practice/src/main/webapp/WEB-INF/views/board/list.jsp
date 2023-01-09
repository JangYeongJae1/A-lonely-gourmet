<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="spring.practice.vo.BoardVo" %>
<%
	List<BoardVo> list = (List<BoardVo>)request.getAttribute("datalist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet" />
</head>
<body>
	${login.nickname} 님 안녕하세요.
	<c:if test="${login == null}">
		<a href="<%=request.getContextPath() %>/member/login.do">로그인</a>
	</c:if>
	<c:if test="${login != null}">
		<a href="<%=request.getContextPath() %>/member/logout.do">로그아웃</a>
	</c:if>
	<h2>커뮤니티</h2>
	<select>
		<option value="">카테고리</option>
		<option value="잡담">잡담</option>
		<option value="꿀팁">꿀팁</option>
		<option value="후기">후기</option>
	</select>
	<select>
		<option value="최신순">최신순</option>
		<option value="조회순">조회순</option>
		<option value="추천순">추천순</option>
	</select>
	<c:if test="${login != null}">
		<button onclick="location.href='write.do'">글쓰기</button>
	</c:if>
	<table border="1">
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>						
			<th>조회</th>						
			<th>좋아요</th>						
		</tr>
		<c:forEach items="${datalist}" var="vo">
		<tr>
			<td>${vo.bidx}</td>
			<td>[${vo.category}] <a href="view.do?bidx=${vo.bidx}">${vo.title}</a></td>
			<td>${vo.nickname}</td>
			<td>${vo.wdate}</td>
			<td>${vo.hit}</td>
			<td>${vo.likeCnt}</td>
		</tr>
		</c:forEach>
	</table>
	<c:if test="${login != null}">
		<button onclick="location.href='write.do'">글쓰기</button>
	</c:if>
	<form action="list.do" method="get">
		<select name="searchType">
			<option value="title" <c:if test="${param.searchType eq 'title' }">selected</c:if>>제목</option>
			<option value="nickname" <c:if test="${param.searchType eq 'nickname' }">selected</c:if>>작성자</option>
			<option value="contents" <c:if test="${param.searchType eq 'contents' }">selected</c:if>>내용</option>
		</select>
		<input type="text" name="searchVal" value="${param.searchVal}">
		<button>검색</button>
	</form>
</body>
</html>