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
	String title = "고객센터 문의";%>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">

	<%@ include file="/header.jsp"%>
	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1 class="display-3">
				<%=title%>
			</h1>
		</div>
	</div>

	<div class="container" align="Center">
		<form action="serviceemail.jsp" method="post">
		
		
			<div class="form-group row">
				<label class="col-sm-2">제목</label>
				<div class="col-sm-3">
					<input type="text" name="sertitle" class="form-control">
				</div>

			</div>
			


			
			<div class="form-group row">
				<label class="col-sm-2">문의 내용</label>
				<div class="col-sm-3">
					<textarea name="sercontent" cols="50" rows="8" class="form-control">
					</textarea>
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
				
			

			
		</form>
	</div>







	<%@ include file="/footer.jsp"%>


	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>



</body>
</html>	
		