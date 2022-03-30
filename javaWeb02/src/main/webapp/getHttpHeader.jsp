<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration" %>    

<!-- 페이지 지시어로 import 속성을 사용하여 클래스를 import 선언 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

	Enumeration<String> en = request.getHeaderNames();
	// request 객체의 getHeaderNames() 함수를 사용하여 http 요청 
	// 메세지의 헤더에 포함된 모든 속성들의 이름을 가져옴
	// Enumeration<String> 타입의 변수 en 에 저장 
	// Enumeration은 리스트의 자료구조와 비슷하게 동작함 
	
	while(en.hasMoreElements()) 
	// en 객체에 요소가 남아 있는 경우 true 반환 
	
	{		
		String name = (String)en.nextElement();
		String value = request.getHeader(name);
		out.print(name + " : " + value + "<br>");
	}
	
%>


</body>
</html>