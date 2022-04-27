<%@ page import="jdbc.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
 <%
  request.setCharacterEncoding("UTF-8");
   
   String uid = request.getParameter("uid");
   String upw = request.getParameter("upw");
   String uname = request.getParameter("uname");
   String ugender = request.getParameter("ugender");
   String ubirth = request.getParameter("ubirth");

   
   UserDAO_k dao = new UserDAO_k();
   // db에 유저정보 저장
   boolean result = dao.userInsert(uid, upw, uname, ugender, ubirth);
   
   
   // 저장에 문제가 없으면 로그인 페이지로 이동
   if(result == true) {
  	 response.sendRedirect("/login/login.jsp");
   }else{
   // 저장에 문제가 있으면 로그인 페이지로 이동
  	 response.sendRedirect("/user/useradd.jsp");
   }
  %>
 
 