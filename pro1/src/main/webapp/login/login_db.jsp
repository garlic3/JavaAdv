<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*" %>    

<%
	String uid = request.getParameter("uid");
	String kid = request.getParameter("kid");
	String upw = request.getParameter("upw");	

	
	UserDAO dao = new UserDAO();
	
	int result = dao.idCheck(uid);
	
	// 회원정보가 없는경우 
	if (result == 1){
		out.print("<script>alert('일치하는 회원정보가 없습니다');</script>");
	    out.print("<script>location.href='login.jsp';</script>");
	}
	
	
	// 회원정보가 있는 경우 - 카카오 로그인 X
	else{
	
		UserDTO dto = (new UserDAO()).idCheck(uid);
		
		
		
		
	}
	
	

	if(kid.equals(dto.getUid())){
		response.sendRedirect("login.jsp"); 
	}
	else{
		

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
/* 		cookie.setComment("회원 아이디");
		cookie.setMaxAge() */
		response.sendRedirect("main.jsp"); 
		// 로그인 성공시 세션이나 쿠키 생성 후 메인페이지로 이동
	} 
	}
%>

