<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Arrays"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("utf-8");

	String[] item1 = request.getParameterValues("hobby");

	if (item1 != null) {
		out.print(Arrays.toString(item1) + "<br>");

		for (String item : item1) {
			out.print(item + "<br>");
		}
	}
	%>


</body>
</html>