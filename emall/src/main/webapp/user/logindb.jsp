<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String uid = request.getParameter("uid");
String upw = request.getParameter("upw");

UserDAO = new UserDAO();

int result = dao.login(uid, upw);

if (result == 1){
	
	response.sendRedirect("");
}else if(result ==2){
	
}

%>