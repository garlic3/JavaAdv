<%@page import="jdbc.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스트 삭제</title>
</head>
<%
	String bid = request.getParameter("bid");
	BoardDAO boardid = new BoardDAO();
	
	// 입력받은 bid가 db상에 존재하는지 확인(1=있음/0=없음)
	if(boardid.isExist(bid)==0){
%>
<script>
		alert("해당 게시물은 존재하지 않습니다");
		window.location = "boarddelpage.jsp"; // bid 입력창으로 이동 
</script>
<%
	}else{
		boardid.delBoard(bid); // 게시물 삭제
%>
<script>
		alert("게시물이 삭제되었습니다");
</script>	
<%
	}
%>
<body>

</body>
</html>