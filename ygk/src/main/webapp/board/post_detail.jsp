<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세</title>
<style>
body {
	/* 	display: flex; */
	justify-content: center;
}

.container {
	width: 1008px;
	border: 1px solid black;
}
</style>
</head>
<body>

	<%
	request.setCharacterEncoding("UTF-8");

	String bid = request.getParameter("bid");
	BoardDAO dao = new BoardDAO();
	BoardDTO board = dao.getPostDetail(bid);

	UserDAO dao2 = new UserDAO();
	String uid = "";
	Cookie[] cookies = request.getCookies();
	for (int i = 0; i < cookies.length; i++) {
		String name = cookies[i].getName();
		String value = cookies[i].getValue();

		int result = dao2.idCheck(value);
		if (result == 1) {
			uid = cookies[i].getValue();
			break;
		}
	}
	
	String like = "1";
	%>
	

	<div class="container">
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
		<div>
			작성자 아이디:
			<%=board.getBid()%></div>
		<div>
			작성시간:
			<%=board.getTs()%></div>
		<div>
			내용:<%=board.getContent()%></div>
		<form>
			<input type="image" id="submit" src="heart-regular.svg" width="50px">
		</form>
	</div>


	<script type="text/javascript"
		src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script>
		let bid = "<%=bid%>"; 
		let uid = "<%=uid%>"; 
		let like = "<%=like%>";

		$(document).ready(function() {
			$('#submit').click(function() { //submit 버튼을 클릭하였을 때
				$.ajax({
					type : 'post', //post 방식으로 전송
					url : 'board_like.jsp', //데이터를 주고받을 파일 주소
					data : {
						"like" : like,
						"uid" : uid,
						"bid" : bid
					}, //위의 변수에 담긴 데이터를 전송해준다.
					success : function(data) { //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
						alert("성공!");
					}
				});
			});
		});
	</script>
	
</body>
</html>