<%@page import="jdbc.*"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단톡방</title>


<style>
<style>
@import url('https://fonts.googleapis.com/css2?family=Merriweather+Sans:wght@700&display=swap');
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap');
h2 {
	color: white;
}
body {
font-family: 'Merriweather Sans','Noto Sans KR', sans-serif;

}
</style>
</head>
<body>
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">
	<div class="container shadow bg-success mx-auto mt-5 p-5"
		style="width: 430px;">
		<form action="feedAddTest.jsp" method="post"
			enctype="multipart/form-data">
			<table align=center>
				<tr>
					<h2>톡작성</h2>
				</tr>


				<div class="mb-3">
					<label for="exampleInputEmail1" class="form-label">아이디 </label> <input
						type="text" class="form-control" id="exampleInputEmail1"
						aria-describedby="emailHelp" name="uid">
				</div>

				<div class="mb-3">


					<div class="form-floating">
						메세지
						<textarea class="form-control" placeholder="Leave a comment here"
							id="floatingTextarea2" style="height: 100px" name="ucon"></textarea>
						<label for="floatingTextarea2"></label>
					</div>
					<br>


					<div>이미지</div>
					<input type="file" name="uimage">

					<tr>
						<td colspan=2 align=center height=40><input type="submit"
							value="등록"></td>
					</tr>
			</table>
		</form>
	</div>
	<div class="container shadow bg-success mx-auto mt-5 p-5"
		style="width: 430px;">
		<table align=center>
			<br>
			<tr>
				<h2>톡보기</h2>
			</tr>
			<%
			ArrayList<FeedDTO> feeds = (new FeedDAO()).getList();
			for (FeedDTO feed : feeds) {
				String img = feed.getImages();
				String imgstr = "";
				if (img != null) {
					imgstr = "<img src='images/" + img + "' width=300px height=300px>";
				}
			%>
			<tr>
					<div style="color:white; font-size:20px; margin-bottom:5px;">🐶 &nbspBy&nbsp<%=feed.getId()%></div>
				<div
					style="margin-bottom: 20px;, margin-top:5px; align-content: center; background-color: white; border-radius: 10px; justify-content: center;">
				<br>
					<div style="margin-left: 20px; padding-bottom:10px;"><%=feed.getTs()%></div>
					<div style="margin-left: 15px;"><%=imgstr%></div>
					<div style="margin-left: 20px; margin-top:10px; padding-bottom:10px;"><%=feed.getContent()%></div>

				</div>
			</tr>
			<%
			}
			%>



		</table>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>