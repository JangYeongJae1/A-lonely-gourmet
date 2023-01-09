<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="spring.practice.vo.MemberVo" %>
<%
	List<MemberVo> list = (List<MemberVo>)request.getAttribute("datalist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트입니다.</title>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet" />
</head>
<body>
	<h2>회원 목록</h2>
	<form action="list.do" method="get">
		<select name="searchType">
			<option value="id" <c:if test="${param.searchType eq 'id' }">selected</c:if>>아이디</option>
			<option value="nickname" <c:if test="${param.searchType eq 'nickname' }">selected</c:if>>닉네임</option>
			<option value="name" <c:if test="${param.searchType eq 'name' }">selected</c:if>>이름</option>
			<option value="addr" <c:if test="${param.searchType eq 'addr' }">selected</c:if>>주소</option>
		</select>
		<input type="text" name="searchVal" value="${param.searchVal}">
		<button>검색</button>
	</form>
	<table border="1">
		<tr>
			<th>회원번호</th>
			<th>아이디</th>
			<th>닉네임</th>
			<th>이름</th>
			<th>이메일</th>
			<th>연락처</th>
			<th>주소</th>
			<th>가입일</th>
		</tr>
		<c:forEach items="${datalist}" var="vo">
		<tr>
			<td>${vo.midx}</td>
			<td>${vo.id}</td>
			<td>${vo.nickname}</td>
			<td>${vo.name}</td>
			<td>${vo.email}</td>
			<td>${vo.phone}</td>
			<td>${vo.addr}</td>
			<td>${vo.rdate}</td>
		</tr>
		</c:forEach>						
	</table>
</body>
</html>