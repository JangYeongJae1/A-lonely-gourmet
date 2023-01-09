<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet" />
</head>
<body>
	<h2>해당 시스템은 로그인 후 이용 가능 합니다.</h2>
	<hr>
	<form action="login.do" method="post" id="login">
	아이디 :	<input type="text" name="id"><br>
	비밀번호 :	<input type="password" name="password"><br>
	<button id="btn">로그인</button><br>
	</form>
	<a href="<%=request.getContextPath() %>/member/join.do">[회원가입]</a>
</body>
</html>