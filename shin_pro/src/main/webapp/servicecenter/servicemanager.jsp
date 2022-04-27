
\
<%@page import="jdbc.ServiceDAO"%>
<%@page import="jdbc.ServiceDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터확인</title>
</head>
<body>



	<%!// 선언문
	String title = "고객센터 확인";%>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">


	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1 class="display-3">
				<%=title%>
			</h1>
		</div>
	</div>

	<div class="container">
		<div class="row" align="center">
		

		

</div>


<table class="table table-striped table-hover">
        <thead>
        <tr class="table-dark">
            <th>문의번호</th>
            <th>문의자 아이디</th>
            <th>제목</th>
            <th>분류</th>
            <th>내용</th>
            <th>이메일</th>
            <th>날짜</th> 
            <th>상태</th>
        </tr>
        </thead>
        <tbody>

		<%
			ArrayList<ServiceDTO> services = (new ServiceDAO()).getList();
			
		   for (ServiceDTO service : services) {
		%>

        <tr>
<td><%=service.getSerid() %></td>
<td><%=service.getSeruid() %></td>
<td><%=service.getSertitle() %></td>
<td><%=service.getSercate() %></td>
<td><%=service.getSercontent() %></td>
<td><%=service.getSeremail() %></td>
<td><%=service.getSerdate() %></td>
<td><%=service.getSerstatus() %></td>
<td><a href = "serviceanswer.jsp?seruid=<%=service.getSeruid()%>">[답변]</td>

        </tr>


<% } %>


        



		



		</div>
		<hr>
	</div>







	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>