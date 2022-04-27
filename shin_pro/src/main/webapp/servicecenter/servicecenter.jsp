<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "jdbc.*" %>	
<%-- <%
	String uid = (String) session.getAttribute("uid");
	if (uid == null) {
		response.sendRedirect("/user/login.jsp");
		return;
	} //세션 정보를 확인해서 로그인 상태인지 확인한후 진입 허용 
%>   --%>


<%-- <%
// 쿠키 정보 불러오기
Cookie[] cookies = request.getCookies();
String uid = "";
uid = cookies[0].getValue();
// 로그인 상태 확인
UserDTO userInfo = new UserDTO(); //초기화
if(uid==null){ 
	// 로그인 상태가 아니라면 로그인하도록 안내
}
%>
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고객센터 문의</title>
</head>
<body>
	<%!// 선언문
	String title = "고객센터 문의";%>

	<%@ include file="/header.jsp"%>
	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1 class="display-3">
				<%=title%>
			</h1>
		</div>
	</div>
	
	

	<div class="container" align="Center">
		<form action="serviceadddb.jsp" method="post">
		
		
			<div class="form-group row">
				<label class="col-sm-2">제목</label>
				<div class="col-sm-3">
					<input type="text" name="sertitle" class="form-control">
				</div>

			</div>
			


			
			<div class="form-group row">
				<label class="col-sm-2">문의 내용</label>
				<div class="col-sm-3">
					<input type="text" name="sercontent">
				</div>

			</div>
			
			
			<div class="form-group row">
				<label class="col-sm-2">이메일</label>
				<div class="col-sm-3">
					<input type="text" name="seremail" class="form-control">
				</div>

			</div>
			
			
			<div class="col-sm-6">
				<input type="submit" class="btn btn-primary" value="등록">
			
			<div class="col-sm-6">
				<input type="reset" class="btn btn-danger" value="취소">
			</div>	
			</div>
				
			

			
		</form>
	</div>







	<%@ include file="/footer.jsp"%>



</body>
</html>	
		