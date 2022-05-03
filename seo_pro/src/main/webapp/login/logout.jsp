<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="jdbc.*" %>
    
    
<%


request.setCharacterEncoding("UTF-8");

UserDAO dao = new UserDAO();

Cookie[] cookies = request.getCookies();
for (int i = 0;  i < cookies.length; i++){
	String name = cookies[i].getName();
	String value = cookies[i].getValue();
	
	int result = dao.idCheck(value);
	if(result == 0){
		response.sendRedirect("login.jsp");
	} else{
		cookies[i].setMaxAge(0);
		out.print("<script>alert('로그아웃 되었습니다');</script>");
		

	}
}

%>
    
    