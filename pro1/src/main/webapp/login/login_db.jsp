<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*" %>    

<%
	String uid = request.getParameter("uid");
	String upw = request.getParameter("upw");

	UserDAO dao = new UserDAO();
	
	int result = dao.login(uid, upw);

	if (result == 1) { 
		response.sendRedirect("login_form.jsp");
												// 회원정보 없는 경우 안내창 띄운 후 로그인으로 이동
	} 
	
	
	else if ( result == 2) {
		response.sendRedirect("login_form.jsp");  // 비밀번호가 틀린 경우 안내창 띄운 후 로그인으로 이동
	} 
	
	else{
		session.setAttribute("id", uid);
		response.sendRedirect("main.jsp"); 
		// 로그인 성공시 세션이나 쿠키 생성 후 메인페이지로 이동
 
	}
%>

	<script>
	
	function login() {
		if (<%=result%> == 1){
			alert("일치하는 회원 정보가 없습니다");
		}
		
		else if(<%=result%> == 2){
			alert("비밀번호가 일치하지 않습니다");
		}
	}
	
	login();
	</script>
