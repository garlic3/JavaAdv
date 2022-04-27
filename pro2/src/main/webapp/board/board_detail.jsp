<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%-- <%
	String uid = (String) session.getAttribute("id");
	if (uid == null) {
		response.sendRedirect("/user/login.jsp");
		return;
	} //세션 정보를 확인해서 로그인 상태인지 확인한후 진입 허용 
%>
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String bid = request.getParameter("bid");
	BoardDAO dao = new BoardDAO();
	BoardDTO board = dao.getDetail(bid);
	%>

	<div class="container">
		<div class="row">
			<div>
			<video controls width="250">
			
			<%
				String img = board.getImages();
				String videos = board.getVideos();

				/* String imgstr = "";
				if (img != null) {
					imgstr = "<img src='images/" + img + "' width=300px height=300px>";
				} */
				String vidstr = "";
				if (videos != null){
					vidstr = "<source src='videos/" + videos +"";
					
				}
				%>
				</video>
			</div>
			<div><%=board.getId() %></div>
			<div><%=board.getTs() %></div>
			<div><%=board.getContent() %></div>
			
		</div>
	</div>




</body>
</html>