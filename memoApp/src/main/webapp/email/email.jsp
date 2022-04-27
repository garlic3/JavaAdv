<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action = "email_send.jsp" method="post">
보내는  사람 <input type="text" name="from">
받 는  사람 <input type="text" name="to"><br>
형     식 text<input type="radio" name="format" value="text" checked>
		 html<input type="radio" name="format" value="html"><br>
본     문 <br>
<textarea name="content" cols="60" rows="10"></textarea>
<br>
<button type="submit">전송</button>
</form>
</body>
</html>