<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">

/* 	alert("아이디: " + document.loginForm.id.value + "\n" +
			"암호: " + document.loginForm.pw.value )
 */
/* function checkForm(){
 
 	if(document.loginForm.id.value == ""){
 		preventDefault();
 		alert("아이디를 입력해주세요");
 		form.id.focus();
 		return false;
 		
 	}else if(document.loginForm.pw.value == ""){
 		preventDefault();
 		alert("비밀번호를 입력해주세요");
 		form.pw.focus();
 		
 		return false;
 	}

 }
 */ 

 
 function checkform(event) {
	 
	 
	 if(!isNaN(document.loginForm.id.value.substr(0,1))){
		 event.preventDefault();
		 alert("hey!");
		 document.getElementById("id").focus();

	 }

 }

</script>


<!-- 유효성 검사는 사용자가 입력한 데이터 값이 서버로 전송되기 전에 규칙에 맞는지 검사하여
검증하는것. 사용자가 실수로 유효하지 않은 데이터 값을 입력하게 되면 부적합하다고 판단하여
다시 입력하다고 알려줌
 -->

<form  id="fo" name="loginForm" action="tt.jsp">
아이디: <input type="text" name="id" id="id">
비번: <input type="password" name="pw">
<input type="submit" onclick="checkform(event);" value="submit">

</form>

</body>
</html>