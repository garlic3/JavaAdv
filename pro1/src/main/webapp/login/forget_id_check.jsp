<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
<link rel="stylesheet" type="text/css" href="styles.css">

</head>
<body>
<%
String uid = request.getParameter("ueamil");

	UserDAO_k dao = new UserDAO_k();
	
	String result = dao.findId(uid);

	if (result != "") { 						 
		out.print("<div class='container'>");
		out.print("안녕하세요&nbsp" + result + "님"); 
		out.print("<div><a href='login.sjp'>로그인 하러가기</a>");
		out.print("<div><a href='fotget_pw'.sjp'>비밀번호 찾기</a>");
		out.print("</div>");
	} 
	// 회원정보 없는 경우 안내창 띄운 후 로그인으로 이동
	else{
		out.print("<script>alert('회원정보가 존재하지 않습니다.')</script>");
		out.print("<script>history.back();</script>");		
	}
%>

</body>
