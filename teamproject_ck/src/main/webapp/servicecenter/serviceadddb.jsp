<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
 request.setCharacterEncoding("UTF-8");
 
 String serid = request.getParameter("serid");
 String sertitle = request.getParameter("sertitle");
 String sercate = request.getParameter("sercate");
 String sercontent = request.getParameter("sercontent");
 String seremail = request.getParameter("seremail");

 
 
 serviceDAO dao = new serviceDAO();
 int result = dao.insert(serid, sertitle, sercate, sercontent, seremail);
 
 if(result == 1) {
	 response.sendRedirect("/servicecenter.jsp");
 }else{
	 response.sendRedirect("/servicecenter.jsp");
 }
 %>