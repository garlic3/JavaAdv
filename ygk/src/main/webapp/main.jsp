<%@page import="jdbc.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Kakao 지도 시작하기</title>
</head>

<%
String lat = request.getParameter("lat");
String lon = request.getParameter("lon");

request.setAttribute("lat", lat);
request.setAttribute("lon", lon);
%>
<body>
	<!-- 맵 기능 및 출력 -->
	
	<%@ include file="./header/header.jsp" %>

	
	<div id="map" style="width: 50%; height: 350px;"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=524d840e60a5b519f048cc6e69baa8ad"></script>

	<script>
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(<%=lat%>, <%=lon%>), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};

		var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
		 
		// 마커를 표시할 위치와 title 객체 배열입니다 
		var positions = [];
	</script>

	<form name="blist" action="bAdd.jsp" method="post">
		<table align=right>
			<tr>
				<td><input type="hidden" name="lat" value=<%=lat%>> <input
					type="hidden" name="lon" value=<%=lon%>></td>
			</tr>
			<tr>
				<td align=rigth><input type="submit" value="게시물 등록" />
			</tr>
		</table>
	</form>


	<!-- 게시물 목록 출력(마커위치 저장) 및 거리계산 -->
	<table align=right>


		<%
		ArrayList<BoardDTO> feeds = (new BoardDAO()).allPost();
		for (BoardDTO feed : feeds) {
			String img = feed.getImages();
			String imgstr = "";
			String vid = feed.getVideos();

			double lon1 = Double.valueOf(lon);
			double lon2 = Double.valueOf(feed.getLon());

			double lat1 = Double.valueOf(lat);
			double lat2 = Double.valueOf(feed.getLat());

			double theta = lon1 - lon2;
			double dist = Math.sin(lat1 * Math.PI / 180.0) * Math.sin(lat2 * Math.PI / 180.0)
			+ Math.cos(lat1 * Math.PI / 180.0) * Math.cos(lat2 * Math.PI / 180.0) * Math.cos(theta * Math.PI / 180.0);

			dist = Math.acos(dist);
			dist = dist * 180 / Math.PI;
			dist = dist * 60 * 1.1515;
			dist = dist * 1609.344;

			if (img != null) {
				imgstr = "<img src='images/" + img + "' width = 240>";
			}
			// 범위내에 게시물만 표시 단위는 미터(m)
			if (dist < 700) {
		%>

		<tr>
			<td colspan=2><hr></td>
		</tr>
		<tr>
			<td><%=feed.getBid()%></td>
		</tr>
		<tr>
			<td><%=feed.getUid()%></td>
			<td><%=feed.getTs()%></td>
		</tr>
		<tr>
			<td colspan=2><%=imgstr%></td>
		</tr>
		<tr>
			<td colspan=2><%=feed.getContent()%></td>
		</tr>

		<script>
			
				var uid = '<%=feed.getUid()%>
			';
			var glat =
		<%=feed.getLat()%>
			;
			var glon =
		<%=feed.getLon()%>
			;

			positions.push({
				content : '<div>' + uid + '</div>',
				latlng : new kakao.maps.LatLng(glat, glon)
			});
		</script>
		<%
		}
		}
		%>
		<%@ include file="./footer/footer.jsp" %>
	</table>
	<script>
		// 마커 표시 코드

		// 마커 이미지의 이미지 주소입니다
		var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png";

		for (var i = 0; i < positions.length; i++) {

			// 마커 이미지의 이미지 크기 입니다
			var imageSize = new kakao.maps.Size(24, 35);

			// 마커 이미지를 생성합니다    
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
				map : map, // 마커를 표시할 지도
				position : positions[i].latlng, // 마커를 표시할 위치
				title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
				image : markerImage
			// 마커 이미지 
			});

			// 마커에 표시할 인포윈도우를 생성합니다 
			var infowindow = new kakao.maps.InfoWindow({
				content : positions[i].content
			// 인포윈도우에 표시할 내용
			});

			// 마커에 이벤트를 등록하는 함수 만들고 즉시 호출하여 클로저를 만듭니다
			// 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
			(function(marker, infowindow) {
				// 마커에 mouseover 이벤트를 등록하고 마우스 오버 시 인포윈도우를 표시합니다 
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					infowindow.open(map, marker);
				});

				// 마커에 mouseout 이벤트를 등록하고 마우스 아웃 시 인포윈도우를 닫습니다
				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});
			})(marker, infowindow);
		}
	</script>


</body>
</html>