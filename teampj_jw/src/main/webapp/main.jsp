<%@page import="jdbc.*"%>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단톡방</title>
</head>

<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
<script>


function getLocation() {
	  if (navigator.geolocation) { // GPS를 지원하면
	    navigator.geolocation.getCurrentPosition(function(pos) {
	    	var la = pos.coords.latitude;
            var lo = pos.coords.longitude;
           	
	    });
	  } else {
	    alert("GPS를 지원하지 않습니다");
	  }
	}
	getLocation();

</script>

<body>
<form action = "feedAdd.jsp" method = "post" enctype="multipart/form-data">
<table align=center>
<tr><td colspan=2 align=center height=40><b>톡작성</b></td></tr>
<tr><td align=right>아이디</td>
<td><input type="text" name="uid" placeholder="글작성자 아이디" required></td></tr>
<tr><td align=right>글작성</td>
<td><textarea name = "ucon" rows=3 cols=20></textarea></td></tr>
<tr><td align=right>이미지</td>
<td><input type="file" name="uimage"></td></tr>
<tr><td align=right>동영상</td>
<td><input type="file" name="uvideo"></td></tr>

<tr><td colspan=2 align=center height=40><input type="submit" value="등록"></td></tr>
</table>
</form>






</body>
</html>