<%@page import="jdbc.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 삭제</title>
</head>
<% 
// 쿠기에서 아이디 정보 가져오기
Cookie[] cookies = request.getCookies();
String uid = "";
uid = cookies[0].getValue();

// 회원 정보 삭제
UserDAO secession = new UserDAO();
secession.delUser(uid);
response.sendRedirect("login.jsp");
%>
<body>
</body>
</html>