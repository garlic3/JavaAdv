<%@page import="java.util.ArrayList"%>
<%@page import="jdbc.BoardDAO"%>
<%@page import="jdbc.BoardDTO"%>
<%@page import="jdbc.UserDAO"%>
<%@page import="jdbc.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
<link rel="stylesheet" href="./css/mypage.css">
</head>
<!-- 로그인 여부 확인 -->
<%
// 쿠키 정보 불러오기
Cookie[] cookies = request.getCookies();
String uid = "";
uid = cookies[0].getValue();
// test용 아이디
//String uid = "test@test.com";

// 로그인 상태 확인
UserDTO userInfo = new UserDTO(); //초기화
if(uid==null){ // 로그인 상태가 아니라면 로그인하도록 안내
%>
<script type="text/javascript">
	alert("로그인 후 이용해주세요");
	window.location = "login.jsp"; // 로그인 페이지로 이동
</script>
<%
}else{
	userInfo = (new UserDAO()).getDetail(uid); // 로그인 상태라면 데이터값 불러오기
}
%>
<!-- 로그인 여부 확인 종료 -->

<!-- 내 게시물  목록 불러오기 -->
<%
ArrayList<BoardDTO> myboards = (new BoardDAO()).getMylist(uid); // 게시물 목록 가져오기
%>
<!-- 내 게시물  종료 -->

<!-- 회원 탈퇴 -->
<script type="text/javascript">
	function secession() {
		if(confirm("정말 탈퇴하시겠습니까?")){
			window.location = "secessiondb.jsp"; // db의 회원정보 제거 페이지
		}else{
			console.log("탈퇴취소");	
		}
	}
</script>
<!-- 회원 탈퇴 종료 -->

<body>
<h1>마이페이지</h1>
<div class="container">
	<!-- 내 정보  -->
	<div class="myInfo">
		<div class="name">
			이름
			<p><%=userInfo.getUname()%></p>
		</div>
		<div>
			성별
			<p><%=userInfo.getUgender()%></p>
		</div>
		<div>
			생년월일
			<p><%=userInfo.getUbirth()%></p>
		</div>
	</div>
	<div class="line"></div>
	
	<!-- 내 게시물 목록 -->
	<%
	for (BoardDTO myboard : myboards) {
	%>
	<div class="myBoard">
		<%=myboard.getId() %>	
		<%=myboard.getContent() %>	
		<%=myboard.getImages() %>	
		<%=myboard.getVideos() %>	
		<%=myboard.getTs() %>
		<%=myboard.getLatitude() %>
		<%=myboard.getLongitude() %>
	</div>			
	<%
	}
	%>
	<div class="line"></div>
	
	<!-- 회원 탈퇴 -->
	<div class="secession">
		<button onclick="secession()">회원 탈퇴</button>
	</div>
</div>

</body>
</html>