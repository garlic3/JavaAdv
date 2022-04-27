<%@page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
  		request.setCharacterEncoding("UTF-8");
 		/* Cookie[] cookies = request.getCookies();
 		String seruid = "";
 		seruid = cookies[0].getValue(); */
 		
 	   String seruid = "hello";	
       String sertitle = request.getParameter("sertitle");
       String sercate = request.getParameter("sercate");
       String sercontent = request.getParameter("sercontent");
       String seremail = request.getParameter("seremail");
       String serstatus = "1";

       
       
       ServiceDAO dao = new ServiceDAO();
       int result = dao.insert(seruid, sertitle, sercate, sercontent, seremail, serstatus);
       
       if(result == 1) {
      	 response.sendRedirect("/servicecenter.jsp");
       }else{
      	 response.sendRedirect("/servicecenter.jsp");
       }
  %>