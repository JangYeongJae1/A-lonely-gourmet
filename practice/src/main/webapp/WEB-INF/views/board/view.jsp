<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.*" %>
<%@ page import="spring.practice.vo.ReplyVo" %>
<%
	List<ReplyVo> list = (List<ReplyVo>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet" />
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>
<script>
	function loginLike(){
		alert("로그인을 하셔야 추천할 수 있습니다.");
	}
	
	function mineLike(){
		alert("본인 글은 추천하실 수 없습니다.")
	}
	
	function like(){
		
		var bidx = $("#bidx").val();
		
		$.ajax({
			url:"like.do",
			data:"bidx="+bidx,
			success:function(likeCheck){
				
				if(likeCheck == 0){
					alert("추천완료");
					location.reload();
				}else if(likeCheck == 1){
					alert("이미 추천한 글입니다.");
					location.reload();
				}
			}	
		})
	}
	
	function reply(){
		
		var bidx = $("#bidx").val();
		var content = $("[name=content]").val();
		
		if(content == ""){
			alert("내용을 입력해주세요.");
		}
		
		$.ajax({
			url:"reply.do",
			data:{bidx:bidx,
				content:content},
			success:function(list){
				location.reload();
				
			}
		})
	}
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
	<h2>커뮤니티/내용 부분입니다.</h2>
	<input type="hidden" id="bidx" value="${vo.bidx}">
		[${vo.category}] ${vo.title}
		<hr>
		${vo.nickname}<br>
		${vo.wdate}	조회수	${vo.hit}<br>
		${vo.contents}<br>
		?개의 댓글
	<c:if test="${login == null}">
		<button type="button" onclick="loginLike();">추천</button>
	</c:if>
	<c:if test="${(login != null) && (login.midx == vo.midx)}">
		<button type="button" onclick="mineLike();">추천</button>
	</c:if>
	<c:if test="${(login != null) && (login.midx != vo.midx)}">
		<button type="button" onclick="like();">추천</button>
	</c:if>
		${vo.likeCnt}
	<hr>
	<c:if test="${login.midx == vo.midx}">
		<button onclick="location.href='modify.do?bidx=${vo.bidx}' ">수정</button>	
		<button onclick="location.href='delete.do?bidx=${vo.bidx}' ">삭제</button>
	</c:if>
		<button onclick="location.href='list.do' ">목록</button>
	<hr>
	<c:if test="${login == null}">
		<input type="text" name="content" placeholder="따뜻한 댓글 부탁드립니다.">
		<button onclick="location.href='<%=request.getContextPath() %>/member/login.do' ">등록</button>
	</c:if>
	<c:if test="${login != null}">
		<input type="text" name="content" placeholder="따뜻한 댓글 부탁드립니다.">
		<button onclick="reply();">등록</button>
	</c:if>	
	<hr>
	<c:forEach items="${list}" var="vo2">
		${vo2.writer} ${vo2.wdate} 추천 비추천 신고 <br>
		${vo2.content} 답글<hr>
	</c:forEach>
</body>
</html>