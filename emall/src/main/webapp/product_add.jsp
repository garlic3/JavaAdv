<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<!-- 부스트랩 css  -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!-- summernote css  -->
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">

</head>
<body>

	<%!String title = "상품 등록";%>

	<%@ include file="/_header.jsp"%>

	<div class="alert alert-primary" role="alert"
		style="text-align: center;">
		<%=title%>
	</div>


			
	<div class="container" style="padding-top: 30px;">
		<form action="product_addDB.jsp" method="post"
			enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품 코드</label>
				<div class="col-sm-3">
					<input type="text" name="pid" class="form-control">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품명</label>
				<div class="col-sm-3">
					<input type="text" name="pname" class="form-control">
				</div>
			</div>


			<div class="form-group row">
				<label class="col-sm-2">상품 가격</label>
				<div class="col-sm-3">
					<input type="text" name="pprice" class="form-control">
				</div>
			</div>


			<div class="form-group row">
				<label class="col-sm-2">상품 설명</label>
				<div class="col-sm-3">
							<textarea id="summernote" name="pdsec"></textarea>
					
				</div>
				
			</div>

			<div class="form-group row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="pmanu" class="form-control">
				</div>
			</div>


			<div class="form-group  row">
				<label class="col-sm-2">상품상태</label>
				<div class="col-sm-3">
					<input name="pcondi" type="radio" value="신상">신상 <input
						name="pcondi" type="radio" value="중고">중고<input
						name="pcondi" type="radio" value="재고">재고

				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2">상품 분류</label>
				<div class="col-sm-3">
					<select class="form-select form-select-sm"
						aria-label=".form-select-sm example">

						<option selected>Open this select menu</option>
						<option value="스마트폰">스마트폰</option>
						<option value="태블릿">태블릿</option>
						<option value="컴퓨터">컴퓨터</option>
						<option value="노트북">노트북</option>
						<option value="주변기기">주변기기</option>

					</select>
				</div>
			</div>

			<div class="form-group row">
				<label for="formFileSm" class="form-label">첨부파일</label>
				<div class="col-sm-5">
					<input class="form-control form-control-sm" id="formFileSm"
						type="file" name="images">
				</div>
			</div>


			<div class="col-sm-offset-5 col-sm-5">
				<input type="submit" class="btn btn-dark" value="상품등록 "> <input
					type="reset" class="btn btn-danger" value="취소" onclick="reset()">
			</div>



		</form>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	<!-- 제이쿼리 js-->
	<script type="text/javascript"
		src="//code.jquery.com/jquery-3.6.0.min.js"></script>
		
	<!-- summernote js -->
	<script
		src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

	<script>
		$('#summernote').summernote({
			placeholder : 'Hello Bootstrap 5',
			tabsize : 2,
			height : 100
		});
	</script>
</body>
</html>
