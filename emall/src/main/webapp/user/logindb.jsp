<%@page import="jdbc.UserDAO_k"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");

	UserDAO_k dao = new UserDAO_k();
	
	int result = dao.login(uid, upw);

	if (result == 1) { // 실패 케이스  1 아이디가 아예 없다. 
		response.sendRedirect("user_add.jsp"); //회원 가입으로 
	} else if ( result == 2) {
		response.sendRedirect("login.jsp") ;  //비번이 틀린케이스이므로 다시 로그인
	} else{
		session.setAttribute("id", uid);
		response.sendRedirect("/product/product_list.jsp");
	}
%>