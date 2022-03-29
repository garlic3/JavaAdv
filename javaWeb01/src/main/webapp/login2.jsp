<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% 
//request.setChracterEncoding("utf-8");
String uid = request.getParameter("id");
String upw = request.getParameter("pw");
String res = "<h3>User ID: " + uid + "</h3>";
String res2 = "<h3>User PW: " + upw + "</h3>";
out.print(res);
out.print(res2);

%>

</body>
</html>