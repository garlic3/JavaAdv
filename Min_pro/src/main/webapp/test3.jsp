<%@page import="util.DistanceCheck"%>
<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
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
DistanceCheck check = new DistanceCheck();%>
1 : <%=check.distance(37.504198, 127.047967, 37.504198, 127.051967,"kilometer")%><br>
2 : <%=check.distance(37.504198, 127.047967, 37.504198, 127.052967,"kilometer")%><br>
3 : <%=check.distance(37.504198, 127.047967, 37.504198, 127.053967,"kilometer")%><br>
4 : <%=check.distance(37.504198, 127.047967, 37.504198, 127.054967,"kilometer")%><br>
5 : <%=check.distance(37.504198, 127.047967, 37.504198, 127.055967,"kilometer")%><br>
6 : <%=check.distance(37.504198, 127.047967, 37.504198, 127.056967,"kilometer")%><br>
7 : <%=check.distance(37.504198, 127.047967, 37.504198, 127.057967,"kilometer")%><br>

</body>
</html>