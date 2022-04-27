<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*" %>    

<%
    String uid = request.getParameter("uid");
    	String upw = request.getParameter("upw");

    	UserDAO_k dao = new UserDAO_k();
    	
    	int result = dao.login(uid, upw);

    	// 회원정보 없는 경우 안내창 띄운 후 로그인으로 이동
    	if (result == 1) { 						 
    		out.print("<script>alert('일치하는 회원정보가 없습니다');</script>");
    	    out.print("<script>location.href='login.jsp';</script>");

    /* 	 	response.sendRedirect("login.jsp"); */ 
    	} 
    	
    	// 비밀번호가 틀린 경우 안내창 띄운 후 로그인으로 이동
    	else if ( result == 2) {
    		out.print(result);
    		out.print("<script>alert('비밀번호가 일치하지 않습니다');</script>");
    		out.print("<script>location.href='login.jsp';</script>");
     		/* response.sendRedirect("login.jsp"); */  
     	} 
    	
    	else{
    		Cookie cookie = new Cookie("uid", uid);
    		response.addCookie(cookie);
    /* 		cookie.setComment("회원 아이디");
    		cookie.setMaxAge() */
    		response.sendRedirect("mypage.jsp"); 
    		// 로그인 성공시 세션이나 쿠키 생성 후 메인페이지로 이동
     
    	}
    %>

