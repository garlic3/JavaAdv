<%@page import="jdbc.UserDAO"%>
<%@page import="jdbc.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mypage</title>
</head>
<%
// 로그인 상태 확인
//String uid = (String)session.getAttribute("id");
/* Cookie[] cookies = request.getCookies();
String uid = "";
uid = cookies[0].getValue(); */

String uid = "test@test.com"; // test용

UserDTO userInfo = new UserDTO(); //초기화
if(uid==null){ // 로그인 상태가 아니라면 로그인하도록 안내
%>
<script type="text/javascript">
	alert("로그인 후 이용해주세요");
	window.location = "../login/login.jsp"; // 로그인 페이지로 이동
</script>
<%
}else{
	userInfo = (new UserDAO()).getDetail(uid); // 로그인 상태라면 데이터값 불러오기
}
%>
<script type="text/javascript">
	function secession() {
		if(confirm("정말 탈퇴하시겠습니까?")){
			window.location = "secessiondb.jsp"; // db의 회원정보 제거 페이지
		}else{
			console.log("탈퇴취소");	
		}
	}
</script>
<body>
<h1>마이페이지</h1>
<div>
	<!-- 내 정보  -->
	<div>
		이름
		<p><%=userInfo.getUname()%></p>
		성별
		<p><%=userInfo.getUgender()%></p>
		생년월일
		<p><%=userInfo.getUbirth()%></p>
	</div>
	<!-- 회원 탈퇴 -->
	<div>
		<button onclick="secession()">회원 탈퇴</button>
	</div>
</div>

</body>
</html>