<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 문의</title>
</head>
<body>
	<%!// 선언문
	String title = "답변";%>
	<!-- CSS only -->

	<h1 class="display-3">
		<%=title%>
	</h1>


	<div>
		<form action="serviceanswersend.jsp" method="post">

			<%
/* 			String email = request.getParameter("seruid");
 */			
 			String email = "yup_yup@naver.com";
 			%>
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input type="text" name="seremail" class="form-control"
						value="<%=email%>">
				</div>

			</div>

			<div class="form-group row">
				<label class="col-sm-2">답변</label>
				<div class="col-sm-3">
					<input type="text" name="seranswer">
				</div>

			</div>


			<div class="col-sm-6">
				<input type="submit" class="btn btn-primary" value="등록">

				<div class="col-sm-6">
					<input type="reset" class="btn btn-danger" value="취소">
				</div>
				</div>
		</form>
</body>
</html>
