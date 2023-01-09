<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="<%=request.getContextPath() %>/resources/css/style.css" rel="stylesheet" />
<script src="<%=request.getContextPath() %>/resources/js/jquery-3.6.1.min.js"></script>
<script>
	
	var checkIdFlag = false;
	var checkIdVal= "";
	
	var checkNicknameFlag = false;
	var checkNicknameVal= "";

function checkId(){
	
	var idval = $("#id").val();

	$.ajax({
		url:"checkId.do",
		type:"post",
		data:"id="+idval,
		success:function(data){
		if(data==1){
			alert("이미 사용중인 Id입니다.");
			checkIdFlag = false;
			checkIdVal = "";
		}else{
			alert("사용할 수 있는  Id입니다.");
			checkIdFlag = true;
			checkIdVal = idval;
			}
		}
	});	
}

function checkNickname(){
	
	var nicknameval = $("#nickname").val();

	$.ajax({
		url:"checkNickname.do",
		type:"post",
		data:"nickname="+nicknameval,
		success:function(data){
		if(data==1){
			alert("이미 사용중인 닉네임입니다.");
			checkNicknameFlag = false;
			checkNicknameVal = "";
		}else{
			alert("사용할 수 있는  닉네임입니다.");
			checkNicknameFlag = true;
			checkNicknameVal = nicknameval;
			}
		}
	});	
}
	
$(function(){
	
	$("form").submit(function(){
		
		if($("#id").val() == ""){
			alert("아이디를 입력하세요.");
			return false;
		}else if(!checkIdFlag){
			alert("아이디 중복확인을 하세요.");
			return false;
		}else if($("#password").val() == ""){
			alert("비밀번호를 입력하세요.");
			return false;
		}else if($("#nickname").val() == ""){
			alert("닉네임을 입력하세요.");
			return false;
		}else if(!checkNicknameFlag){
			alert("닉네임 중복확인을 하세요.");
			return false;
		}else if($("#name").val() == ""){
			alert("이름을 입력하세요.");
			return false;
		}else if($("#email").val() == ""){
			alert("이메일을 입력하세요.");
			return false;
		}else if($("#phone").val() == ""){
			alert("연락처를 입력하세요.");
			return false;
		}else if($("#addr").val() == ""){
			alert("주소를 입력하세요.");
			return false;
		}else{
			alert("회원가입이 완료되었습니다.")
			return true;
		}
	});
})
	
function blurId(obj){
	
	var val = obj.value;
	
	if(checkIdFlag && val != checkIdVal){
		checkIdFlag = false;
	}
}

function blurNickname(obj){
		
	var val = obj.value;
		
	if(checkNicknameFlag && val != checkNicknameVal){
			checkNicknameFlag = false;
	}	
}	
		
</script>
</head>
<body>
	<h2>회원 가입 후 로그인하여 이용하세요.</h2>
	<hr>
	<form action="join.do" method="post">
		아이디 : <input type="text" name="id" id="id" onblur="blurId(this)">
		<button type="button" onclick="checkId()">아이디 중복확인</button><br>
		비밀번호 :	<input type="password" name="password" id="password"><br>
		닉네임 :	<input type="text" name="nickname" id="nickname" onblur="blurNickname(this)">
		<button type="button" onclick="checkNickname()">닉네임 중복확인</button><br>
		이름 :	<input type="text" name="name" id="name"><br>
		이메일 :	<input type="email" name="email" id="email"><br>
		연락처 :	<input type="number" name="phone" id="phone"><br>
		주소 :	<input type="text" name="addr" id="addr"><br>
		<button>회원가입</button>
	</form>
</body>
</html>