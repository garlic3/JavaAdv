<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="insert_process.jsp" method="post">
<div>학번 : <input type="text" name="num"></div>
<div>학과 : <input type="text" name="depart"></div>
<div>이름 : <input type="text" name="name"></div>
<div>주소 : <input type="text" name="address"></div>
<div>연락처: <input type="text" name="phone"></div>
<input type="submit" value="전송">
</form>
</body>
</html>