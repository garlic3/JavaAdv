<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% Cookie[] cookies = request.getCookies();
String uid = "";
uid = cookies[0].getValue();%> 

쿠키: <%=uid %>
</body>
</html>