<%@page import="jdbc.UserDAO"%>
<%@page import="jdbc.UserDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 목록</title>
</head>
<body>
<!-- 유저 목록 -->
<div>
	<h2>유저 목록</h2>
	<!-- 유저 정보 가져오기 -->
	<% 
	ArrayList<UserDTO> users = (new UserDAO()).getList();
	for (UserDTO user : users) {
		if(user.getUid().equals("admin")){
			break;
		}
	%>
		<!-- 게시물 정보 -->
		<%=user.getUid() %>
		<%=user.getUpw() %>
		<%=user.getUname() %>
		<%=user.getUgender() %>
		<%=user.getUbirth() %>
		<%=user.getUsignup() %>
		<%=user.getLikeIt() %>
	<%
	}
	%>
</div>
</body>
</html>