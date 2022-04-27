<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Declaration</title>
</head>
<body>
	<%! int data=50; %>
	
	<% out.print(data); %>
	
	<%= new java.util.Date() %>
</body>
</html>