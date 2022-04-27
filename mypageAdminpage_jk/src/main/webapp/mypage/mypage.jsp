<%@page import="jdbc.UserDAO_k"%>
<%@page import="jdbc.UserDTO_k"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
</head>
<%
// 로그인 상태 확인
//String uid = (String)session.getAttribute("id");
Cookie[] cookies = request.getCookies();
String uid = "";
uid = cookies[0].getValue();

//String uid = "test@test.com"; // test용

UserDTO_k userInfo = new UserDTO_k(); //초기화
if(uid==null){ // 로그인 상태가 아니라면 로그인하도록 안내
%>
<script type="text/javascript">
	alert("로그인 후 이용해주세요");
	window.location = "login.jsp"; // 로그인 페이지로 이동
</script>
<%
}else{
	userInfo = (new UserDAO_k()).getDetail(uid); // 로그인 상태라면 데이터값 불러오기
}
%>
<body>
<h1>마이페이지</h1>

이름
<p><%=userInfo.getUname()%></p>
성별
<p><%=userInfo.getUgender()%></p>
생년월일
<p><%=userInfo.getUbirth()%></p>

</body>
</html>