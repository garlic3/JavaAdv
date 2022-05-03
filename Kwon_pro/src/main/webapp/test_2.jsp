<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<% String username = "hello"; 
	String name = "yoo!!!";

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
 
<input type="button" id="submit" value="입력" hidden="hidden">   
</form>
<br><br>
<div id="message"></div>
</body>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.5.1.min.js"></script>


<script>

let senddata = "<%=username%>"; 
let name = "<%=name%>";
$(document).ready(function(){
	$('#submit').click(function(){   //submit 버튼을 클릭하였을 때
 		/* let sendData = "username="+$('input[name=username]').val();   //폼의 이름 값을 변수 안에 담아줌 */
<%--  */		let senddata = "<%=username%>"; 
		let name = "<%=name%>"; --%>
		
		$.ajax({
			type:'post',   //post 방식으로 전송
			url:'test1.jsp',   //데이터를 주고받을 파일 주소
			data:{"username":senddata, "name":name},   //위의 변수에 담긴 데이터를 전송해준다.
/* 			dataType:'html',   //html 파일 형식으로 값을 담아온다.
 */			success : function(data){   //파일 주고받기가 성공했을 경우. data 변수 안에 값을 담아온다.
				/* $('#message').html(data); */  //현재 화면 위 id="message" 영역 안에 data안에 담긴 html 코드를 넣어준다. 
			alert("성공!");			
 }
		});
	});
});
</script>
</html>