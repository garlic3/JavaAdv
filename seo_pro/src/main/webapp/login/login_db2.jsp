<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*" %>

<%
	String uid = request.getParameter("uid");
	String kid = request.getParameter("kid");
	String upw = request.getParameter("upw");	

	UserDAO dao = new UserDAO();
	int idcheck = dao.idCheck(uid);
	int kidcheck = dao.idCheck(kid);

	if (kid == null && uid != null && uid.equals("admin")){
		Cookie cookie = new Cookie("admin", "admin");
		response.addCookie(cookie);
 		response.sendRedirect("admintest.jsp"); 
		
	}
	
	// 카카오톡 로그인 사용 x 회원정보 o 
	else if (kid == null && idcheck == 1){		
		UserDTO user = dao.getDetail(uid);
		
		// 비밀번호 확인		
		// 일치 시 메인페이지로 연결
		
		 if(user.getUpw().equals(upw)){  
			Cookie cookie = new Cookie("uid", uid);
			response.addCookie(cookie);
 	 		response.sendRedirect("main.jsp"); 
			
		// 불일치 시 안내문 띄우고 로그인화면으로 재이동
		}else{
			out.print("<script>alert('비밀번호가 일치하지 않습니다');</script>");
	 		out.print("<script>location.href='login.jsp';</script>");
		}
	  
	}
	
	// 카카오톡 로그인 사용 x 회원정보 x 
	else if(kid == null && idcheck == 0){
		// 안내문 띄우고 회원가입으로 연결 
		out.print("<script>alert('일치하는 회원정보가 없습니다. 회원가입 후 이용해주세요');</script>");
/* 	    out.print("<script>location.href='login.jsp';</script>"); 
 */		out.print("<script>history.back();</script>");		
	}
	
	// 카카오톡 로그인 사용 o 회원정보 o
	else if(kid != null && kidcheck == 1){
		Cookie cookie = new Cookie("uid", kid);
		response.addCookie(cookie);
		// 메인페이지로 연결
 		response.sendRedirect("./main.jsp"); 
 	
		
	}
	
	// 카카오톡 로그인 사용 o 회원정보 x
	else if(kid != null && kidcheck == 0){
		// 회원가입 페이지로 이동(아이디 입력창 hidden)
 		out.print("<script>alert('일치하는 회원정보가 없습니다. 간편 회원가입 후 이용해주세요');</script>");
		out.print("<script>location.href='sign_up.jsp'</script>"); 

		
		
	}
	
	
%>

