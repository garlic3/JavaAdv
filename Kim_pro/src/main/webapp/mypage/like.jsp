<%@page import="jdbc.LikeDAO"%>
<%@page import="jdbc.LikeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요한 목록</title>
</head>
<body>
<!-- 유저 아이디 -->
<%
/* Cookie[] cookies = request.getCookies();
String uid = cookies[0].getValue(); */
String uid = "test@test.com";
%>
<!-- 좋아요한 목록 -->
<% 
	ArrayList<LikeDTO> likes = (new LikeDAO()).getLike(uid);
	for (LikeDTO like : likes) {
	%>
		<!-- 게시물 정보 -->
		<%=like.getBid() %>
		<a href="boarddetail.jsp"><%=like.getContent() %></a>
		<%=like.getTs() %>
		<%=like.getImages() %>
		<%=like.getVideos() %>
		<%=like.getLatitude() %>
		<%=like.getLongitude() %>
	<%	
	}
	%>


</body>
</html>