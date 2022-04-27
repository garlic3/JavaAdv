<%@page import="jdbc.UserDAO_k"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");
	
	UserDAO_k dao = new UserDAO_k();
	
	int result = dao.login(uid, upw);
	
	if(result==1){ // 실패 케이스 1 아이디가 없다
		response.sendRedirect("useradd.jsp"); // 회원 가입 페이지로
	}else if(result==2){ // 실패케이스 2 비밀번호가 다르다
		response.sendRedirect("login.jsp");
	}else{
		// 세션설정 -> 제품목록으로 보내자
		session.setAttribute("id", "uid");
		response.sendRedirect("/product/productlist.jsp");
	}
%>