<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type ="text/javascript">
function CheckForm() {
// 숫자 인지 여부검사
/* 	if(!isNaN(document.loginForm.id.value.substr(0,1))){ */
// 첫글자가 소문자인지 확인
	var ch = form.loginForm.id.value.charAt(0);
	if((ch <'a' || ch >'z')&&(ch >'A' || ch <'Z')) %% (ch >'0' || ch<'9')
		alert("아이디는 숫자로 시작할 수 없습니다.");
		document.loginForm.id.select();
		return false;
	}
    form.submit();
}

</script>
<form name="loginForm" action="/doc/test.jsp">
아이디 : <input type="text" name="id">
비   번 : <input type="password" name="pw">
<input type="submit" onclick="CheckForm()">
</form>
</body>
</html>