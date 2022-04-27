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
   /* alert("아이디 : " + document.loginForm.id.value + "\n" +
        "비   번 : " + document.loginForm.pw.value); */
	if(document.loginForm.id.value==""){
		alert("아이디를 입력해주세요");
		form.id.focus();
		return false;
	} else if(document.loginForm.pw.value==""){
		alert("비밀번호를 입력해주세요");
		form.pw.focus();
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