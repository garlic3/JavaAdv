<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>목록에 관리자 페이지추가</title>
</head>


<%
// 로그인 상태 확인
/* Cookie[] cookies = request.getCookies();
String uid = "";
uid = cookies[0].getValue(); */
//String uid = "test"; // test용 일반 사용자
String uid = "admin"; // test용 관리자
%>
<script>
var uid = "<%=uid%>";
if(uid==="admin"){ 
    window.onload = function () {
      const elNode = document.getElementById("test");
      const newNode = document.createElement("li");
      newNode.innerHTML = '<a href="#">관리자</a>';

      elNode.append(newNode);
    };
}
</script>


<body>
	<div>
      <p>삭제할 게시물 번호</p>
      <ul id="test">
        <li>1</li>
        <li>2</li>
        <li>3</li>
        <li>4</li>
      </ul>
    </div>
</body>
</html>