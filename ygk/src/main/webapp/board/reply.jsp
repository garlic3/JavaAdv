<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<!-- CSS only -->
	
	<form action="reply_add.jsp" method="post">
			<div>
			<input type="text" name="reply"size=40> 
			<input type="submit" value="등록">
		</div>
	</form>

	<%
	request.setCharacterEncoding("UTF-8");
	String bid = request.getParameter("bid"); 
	ReplyDAO dao = new ReplyDAO();
	ArrayList<ReplyDTO> replies = (new ReplyDAO()).getReply(bid);

	for (ReplyDTO reply : replies) {
		String uid = reply.getUid();
		String content = reply.getContent();
		String ts = reply.getTs();
	%>


		<h1><%= reply.getUid()%></h1>
		<h1><%= reply.getContent()%></h1>
		<h1><%= reply.getTs()%></h1>


	<%
	
	}
	%>

</body>
</html>