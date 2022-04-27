<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 번호 넘겨주기(임시)</title>
</head>
<%
// 로그인 상태 확인
/* Cookie[] cookies = request.getCookies();
String uid = "";
uid = cookies[0].getValue(); */
//String uid = (String)session.getAttribute("id");
//String uid = "test"; // test용 일반 사용자
String uid = "admin"; // test용 관리자

if(uid!="admin"){ // 관리자가 아니라면 로그인하도록 안내
%>
<script type="text/javascript">
	alert("관리자만 이용이 가능합니다");
	window.location = "/mypage/login.jsp"; // 로그인 페이지로 이동	
</script>
<%
}
%>
<script>
	// 삭제여부 재확인
	function check() {
    	if (confirm("정말 삭제하시겠습니까?")) {
      		var form = document.isform;
      		form.method = "post";
      		form.action = "boarddel.jsp";
      		form.submit();
    	} else {
      		console.log("삭제취소");
    	}
  	}
</script>
<body>
<!-- 게시물 목록 -->
<div>
	<h2>게시물 목록</h2>
	<!-- 게시물 가져오기 -->
	<% 
	ArrayList<BoardDTO> boards = (new BoardDAO()).getList();
	for (BoardDTO board : boards) {
	%>
		<!-- 게시물 정보 -->
		<%=board.getBid() %>
		<a href="./board/board_detail.jsp"><%=board.getBtitle() %></a>
		<%=board.getBts() %><br>
	<%	
	}
	%>
</div>
<hr>

<!-- 게시물 삭제 -->
<div>
	<form name="isform">
		<div>
			<p>삭제할 게시물 번호</p>
			<input type="text" name="bid" placeholder="삭제할 게시물의 번호를 입력하세요" style="width:300px">
			<button onclick="check()">삭제</button>
		</div>
	</form>
</div>
</body>
</html>