

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


 <%String uid = request.getParameter("username"); 
 String ucon = request.getParameter("name");
 String ufname = null;
 String uvname = null;
 String lat = null;
 String lon = null;
 
 
 %>

<%  FeedDAO dao = new FeedDAO();
	       if (dao.insert(uid, ucon, ufname, uvname, lat, lon)) {
	       	response.sendRedirect("test.jsp");
	       }else{
	    	   response.sendRedirect("test.jsp");   
	       }
	   %>
</body>
</html>