<%@page import="jdbc.ProductDAO"%>
<%@page import="jdbc.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>
</head>
<body>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	<%@ include file="/_header.jsp"%>

	<!-- 표현문 -->
	<%!String title = "상품 등록";%>
	<div class="alert alert-secondary" role="alert">
		<div class="container">
			<h1><%=title%></h1>
		</div>
	</div>

	<div class="container">
		<form action="productadddb.jsp" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2">상품코드</label>
				<div class="col-sm-3">
					<input type="text" name="pid" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품이름</label>
				<div class="col-sm-3">
					<input type="text" name="pname" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">가격</label>
				<div class="col-sm-3">
					<input type="text" name="pprice" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품설명</label>
				<div class="col-sm-3">
					<textarea name="pdec" class="form=col-sm-2" rows="5" cols="50"></textarea>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">제조사</label>
				<div class="col-sm-3">
					<input type="text" name="pmanu" class="form-control">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품분류</label>
				<div class="col-sm-3">
					<select name="pcate" class="form-select form-select-sm" aria-label=".form-select-sm example">
						<option selected>Open this select menu</option>
						<option value="스마트퐅">스마트폰</option>
						<option value="테블릿">테블릿</option>
						<option value="컴퓨터">컴퓨터</option>
						<option value="노트북">노트북</option>
						<option value="주변기기">주변기기</option>
					</select>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2">상품종류</label>
				<div class="col-sm-3">
					<input class="form-check-input" value="신상" type="radio" name="pcondi" id="flexRadioDefault1" checked>
  						<label class="form-check-label" for="flexRadioDefault1">
					    	신상
					    </label>
					<input class="form-check-input" value="중고" type="radio" name="pcondi" id="flexRadioDefault2" checked>
  						<label class="form-check-label" for="flexRadioDefault2">
					    	중고
					    </label>
					<input class="form-check-input" value="재고" type="radio" name="pcondi" id="flexRadioDefault3" checked>
  						<label class="form-check-label" for="flexRadioDefault3">
					    	재고
					    </label>
					<input class="form-check-input" value="기타" type="radio" name="pcondi" id="flexRadioDefault4" checked>
  						<label class="form-check-label" for="flexRadioDefault4">
					    	기타
					    </label>
				</div>
			</div>
			
			<div class="form-group row">
				<div class="mb-3">
					<label for="formFileSm" class="col-sm-3">사진 선택</label>
					<div class="col-sm-3">
						<input name="pimages" class="form-control form-control-sm" id="formFileSm" type="file">
					</div>
				</div>
			</div>
			
			<div class="form-group row" align="center">
				<div class="col-sm-10">
					<input type="submit" class="btn btn-primary" value="등록">
					<input type="reset" class="btn btn-danger" value="취소">
				</div>
			</div>
		</form>
	</div>

	<%@ include file="/_footer.jsp"%>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>