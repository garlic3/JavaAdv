<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jdbc.*"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name= "viewport" content="width=device-width, initial-scale=1, user-scalable=0">
<style>
.alert alert-warnin {
	width: 50px;
}

.title {
	margin-top:10px;
	margin-left:20px;
}
</style>
</head>
<body>
	<!-- CSS only -->
	<link
		href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
		rel="stylesheet"
		integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
		crossorigin="anonymous">

<div align=center>
<div class="btn-group" role="group" aria-label="Basic mixed styles example" style="margin-left:20px; margin-top:20px;">
  <button type="button" class="btn btn-danger">메모 목록</button>
  <button type="button" class="btn btn-warning">완료 목록</button>
  <button type="button" class="btn btn-success">회원 목록</button>
</div>

	<form action="memo_add.jsp" method="post">
		<div class="alert alert-warning" role="alert"
			style="width: 500px; margin: 10px;">
			<input type="text" name="memo" class="todo" size=40> <input
				type="submit" value="등록">
		</div>
	</form>

	<div class="title"> 내용 아이디 작성시간</div>
	<%
	request.setCharacterEncoding("UTF-8");
	MemoDAO dao = new MemoDAO();
	ArrayList<MemoDTO> memos = (new MemoDAO()).getList();

	for (MemoDTO mem : memos) {
		String mid = mem.getUid();
	%>

	<div class="alert alert-warning" role="alert"
		style="width: 500px; margin: 10px;">
		<input type="checkbox" name="todo" style="width: 15px; height: 15px;"
			onclick=delete()>
		<%=mem.getUid()%>
		<%=mem.getMemo()%>
		<%=mem.getMdate()%>
		<a href="memo_del.jsp?mid=<%=mem.getMid()%>">삭제</a>
	</div>
	<script>
	function delete(){
		location.href='/memo_del.jsp?mid=<%=mem.getMid()%>';
	}
	</script>


	<%
	}
	%>

	<hr>
	<div class="title">&nbsp&nbsp완료목록</div>
	<%
	request.setCharacterEncoding("UTF-8");
	MemoDAO dao2 = new MemoDAO();
	ArrayList<MemoDTO> memos2 = dao2.getDoneList();

	for (MemoDTO mem : memos2) {
	%>



	<div class="alert alert-warning" role="alert"
		style="width: 500px; margin: 10px;">
		<input type="checkbox" name="todo" style="width: 15px; height: 15px;"
			checked>
		<%=mem.getUid()%>
		<%=mem.getMemo()%>
		<%=mem.getMdate()%>
		<a href="memo_udel.jsp?mid=<%=mem.getMid() %>">복구</a>
	</div>
<script></script>

	<%
	}
	%>
	<!-- JavaScript Bundle with Popper -->


	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>


</body>
</html>