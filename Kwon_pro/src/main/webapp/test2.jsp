<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% String username = "TEST"; 
	String name = "GOOD!!!";

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form>
<label>이름을 입력하세요</label>
 
<input type="button" id="submit" value="입력">   
</form>
<br><br>
<div id="message"></div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
$(document).ready(function(){
	$('#submit').click(function(){   //submit 버튼을 클릭하였을 때
		let senddata = "<%=username%>"; 
		let name = "<%=name%>";
		
		$.ajax({
			type:'post',   //post 방식으로 전송
			url:'test1.jsp',   //데이터를 주고받을 파일 주소
			data:{"username":senddata, "name":name},   //위의 변수에 담긴 데이터를 전송해준다.
			success : alert("성공!")/* function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
		});
	});
});
</script>
</html>