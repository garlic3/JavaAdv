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
%>
 --%>
<%




%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	p

			/* String id = request.getParameter("id"); */
			String id = "23";
			BoardDAO dao = new BoardDAO();
			BoardDTO board = dao.getBoardDetail(bid);
			
			String uid = board.getUid();
			String bid = board.getId();
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
						vidstr = "<source src='videos/" + video + "'>";

					}
					%>
			</div>
			<video controls width="250">
				<%=vidstr%>
			</video>
			<div><%=uid%></div>
			<div><%=board.getTs()%></div>
			<div><%=board.getContent()%></div>

		</div>
	</div>
<button id="like" value="like" class="like">like</button>


<div id="message"></div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#like').click(function(){   //submit 버튼을 클릭하였을 때
		//let sendData = "username="+$('input[name=username]').val();   //폼의 이름 값을 변수 안에 담아줌
			let uid = "<%=uid%>";
			let bid = "<%=bid%>";
		
		$.ajax({
			
			type:'post',   //post 방식으로 전송
			url:'board_like.jsp',   //데이터를 주고받을 파일 주소
			data:{"watch":"1", "like":"1","uid":uid, "bid":bid},   //위의 변수에 담긴 데이터를 전송해준다.
/*  			dataType:'html',   //html 파일 형식으로 값을 담아온다.
 */ 			success :alert("성공!"),
 				 function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				$('#message').html(data);  //현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다. 
			} 
		});
	});
});
</script>

</body>
</html>