<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="jdbc.*" %>
<%
request.setCharacterEncoding("UTF-8");

String content = request.getParameter("reply");
String uid = "test";
String bid = "aa";
ReplyDAO dao = new ReplyDAO();
dao.replyInsert(bid, uid, content);

response.sendRedirect("reply.jsp");
%>
