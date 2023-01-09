<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet" />
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>
<script>
	$(function(){
		$("#writeBtn").click(function(){
			var title = $("#title").val();
			var contents = $("#contents").val();
			
			if(title == ""){
				alert("제목을 입력해주세요.");
				document.frm.title.focus();
				return false;
			}else if(contents == ""){
				alert("내용을 입력해주세요.");
				document.frm.contents.focus();
				return false;
			}
			return true;
		});
	});
</script>
</head>
<body>
	${login.nickname} 님 안녕하세요.
	<c:if test="${login == null}">
		<a href="<%=request.getContextPath() %>/member/login.do">로그인</a>
	</c:if>
	<c:if test="${login != null}">
		<a href="<%=request.getContextPath() %>/member/logout.do">로그아웃</a>
	</c:if>
	<h2>커뮤니티 글쓰기 페이지입니다.</h2>
	<form name="frm" action="write.do" method="post">
		<select name="category">
			<option>잡담</option>
			<option>꿀팁</option>
			<option>후기</option>
		</select>
		<input type="text" name="title" id="title" placeholder="제목"> <br>
		<textarea name="contents" id="contents" placeholder="내용"></textarea><br>
		<input type="text" value="${login.nickname}" readonly><br>
		<input type="file" name="filename">
		<button id="writeBtn">등록</button>
		<button type="reset" onclick="location.href='list.do' ">취소</button>
	</form>
</body>
</html>