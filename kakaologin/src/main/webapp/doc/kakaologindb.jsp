<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String birthday = request.getParameter("birthday");
	String email = request.getParameter("email");
	String nickname = request.getParameter("nickname");
	String gender = request.getParameter("gender");
%>

<%= birthday %><br>
<%= email %><br>
<%= nickname %><br>
<%= gender %>
</body>
</html>