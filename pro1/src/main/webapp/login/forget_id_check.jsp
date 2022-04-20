<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*" %>

<%
	String uid = request.getParameter("ueamil");

	UserDAO dao = new UserDAO();
	
	String result = dao.findId(uid);

	if (result != "") { 						 
		out.print("안녕하세요" + result + "님"); 
		
	} 
	// 회원정보 없는 경우 안내창 띄운 후 로그인으로 이동
	else{
		out.print("<script>alert('회원정보가 존재하지 않습니다.')</script>");
		out.print("<script>history.back();</script>");		
	}
	
	
%>

