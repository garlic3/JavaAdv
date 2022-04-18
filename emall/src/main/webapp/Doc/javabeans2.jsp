<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<%-- 자바 빈즈 작성규칙
1. 클래스를 만들때는 java.io.Serializable 인터페이스를 구현해야함 
2. 인수가 없는 기본 생성자가 있어야함
3. 모든 멤버 변수는 private으로 설정해야함
4. Getter/Setter() 메서드가 모든 변수에 존재해야함

* 자바 빈즈 사용시 코드 
<jsp:useBean id = "member" class="com.dto.MemberBean" scope="page"/>

* 자바 코드 
MemberBean member = (MemberBean) request.getAttribute("member");
if(member == null){
member = new MemberBean();
request.setAttribute("member", member);

--%>

<jsp:useBean id="date" class="java.util.Date"/>
<!-- 자바 빈즈로 Date 클래스를 사용하도록 useBean 액션태그를 작성 -->

<%
	out.print("오늘의 날짜와 시각");
%>

<!-- useBean 액션태그의 id 속성값으로 현재 날짜와 시각을 출력하도록 표현문 태그 작성-->
<%=date %>
</body>
</html>