<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script src="http://code.jquery.com/jquery-1.11.0.js"></script>
	<script>
	function posission(){
		navigator.geolocation.getCurrentPosition(function(pos) {
			var la = pos.coords.latitude; // 위도 
			var lo = pos.coords.longitude; // 경도 

			location.href = 'main.jsp?lat=' + la + '&lon=' + lo;
		}, function(error) {
			alert("위치 정보를 가져올 수 없습니다.");
			location.href='toMain.jsp';
		});
	}
	posission();
	</script>
</body>
</html>
