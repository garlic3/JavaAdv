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
//String uid = (String)session.getAttribute("id");
Cookie[] cookies = request.getCookies();
String uid = "";
uid = cookies[0].getValue();
//String uid = "test"; // test용 일반 사용자
//String uid = "admin"; // test용 관리자

if(uid!="admin"){ // 관리자가 아니라면 로그인하도록 안내
%>
<script type="text/javascript">
	alert("관리자만 이용이 가능합니다");
	window.location = "/mypage/test.jsp"; // 로그인 페이지로 이동	
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
<form name="isform">
	<div>
		<p>삭제할 게시물 번호</p>
		<input type="text" name="bid" placeholder="삭제할 게시물의 번호를 입력하세요" style="width:300px">
		<button onclick="check()">삭제</button>
	</div>
</form>
</body>
</html>