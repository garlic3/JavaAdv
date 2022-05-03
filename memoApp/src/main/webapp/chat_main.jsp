<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<script>
	function chatWinOpen() {
		var id = document.getElementById("chatId");
		if (id.value == "") {
			alert("대화명을 입력하세요");
			id.focus();
			return;
		}
		window.open("chat_window.jsp?chatId=" + id.value, "",
				"width=320, height=400")
		id.value = "";
	}
</script>
<body>
	<div>
		<h3>대화명을 입력하시고 채팅창으로 입장하세요</h3>
		대화명: <input type="text" id="chatId">
		<button onclick="chatWinOpen();">채팅 입장</button>
	</div>

</body>
</html>