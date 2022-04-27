<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<% String watch = request.getParameter("watch");
   String like = request.getParameter("like");
   String uid = request.getParameter("uid");
   String bid = request.getParameter("bid");
	

%>

<%=watch %>
<%=like %>
<%=uid %>
<%=bid %>

</body>
</html>