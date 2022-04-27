<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좋아요한 목록</title>
</head>
<body>
<!-- 유저 아이디 -->
Cookie[] cookies = request.getCookies();
String uid = cookies[0].getValue();
<!-- 게시물 번호 -->
String bid = request.getParameter("bid");


</body>
</html>