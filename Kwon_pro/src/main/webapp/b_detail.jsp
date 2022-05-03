<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%--  <%
	String uid = (String) session.getAttribute("id");
	if (uid == null) {
		response.sendRedirect("/user/login.jsp");
		return;
	} //세션 정보를 확인해서 로그인 상태인지 확인한후 진입 허용 
%> --%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	String id = "23";

			BoardDAO dao = new BoardDAO();
			BoardDTO board = dao.getBoardDetail(id);
	%>

	<div class="container">
		<div class="row">
			<div>
				<%
				String img = board.getImages();
				String video = board.getVideos();

				String imgstr = "";
				String vidstr = "";
				if (img != null) {
					imgstr = "<img src='images/" + img + "' width=300px height=300px>";
				} else if (video != null) {

					vidstr = "<source src='videos/" + video + "' type='video/webm'>";

				}
				%>
			</div>
			<video controls width="250">
				<%=vidstr%>
			</video>
			<div><%=board.getId()%></div>
			<div><%=board.getTs()%></div>
			<div><%=board.getContent()%></div>
			
			<input type="checkbox" name="like" value="좋아요" onClick="like()" >
		</div>
	</div>
	>

<script>
$(like()){
	
}

</script>

</body>
</html>