<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>


<!DOCTYPE html>

<%
request.ge

UserDAO_k dao = new UserDAO_k();

int result = dao.insert(uid, upw, uname, ugender, ubirth, uemail, uphone, uaddr);

if(result == 1){
	response.sendRedirect("");
}else{
	response.sendRedirect("/user/user_add.jsp");
	
}
%>