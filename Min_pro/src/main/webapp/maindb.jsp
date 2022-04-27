<!--
maintest에서 넘어와서 현재 위도 경도값을 db에 저장(아직 DAO 안되서 저장 안됨)하고 main으로 넘어감
  -->

<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.*"%>
<%@page import="util.*"%>
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
String lan = request.getParameter("ulan");
String lon = request.getParameter("ulon");
%>

 
 
<%TestDAO dao = new TestDAO();        
if (true) 
{response.sendRedirect("main.jsp?ulan="+lan+"ulon="+lon); }%>
</body>
</html>