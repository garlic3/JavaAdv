<!--
login에서 넘어와서 현재위치를 받고, maindb로 넘어감 
가장 코드가 더럽고 쓸모없는것 투성이(main과 같은코드 투성이). 나중에 정리할게요.
 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="http://localhost:8080/project/main.css"> <!-- 토스트용  -->
    <meta charset="utf-8">
    <title>요기콕</title>
    
</head>
<body>
<style> 
.centered_map { margin: 0 auto; border: 1px solid black;}  
</style> 

<div class="centered_map" id="map" style="width:80%;height:350px;"></div>
<%
String ulan = request.getParameter("ulan");
String ulon = request.getParameter("ulon");

%>

성별 : <%=ulan %><br>
별명 : <%=ulon %><br>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=524d840e60a5b519f048cc6e69baa8ad"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.4508, 126.570657), // 지도의 중심좌표(디폴트-카카오센터))
        level: 3 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">나 여기있어!</div>'; // 인포윈도우에 표시될 내용입니다
          
<%--             
		var messgeDAO = "<%TestDAO dao = new TestDAO();        if (dao.insert(%>" 
				+ ulan+ ","
				+ ulon+'<%})) {response.sendRedirect("main.jsp"); }%>'
   --%>       
        
<%--         var checkmsg = '<%DistanceCheck check = new DistanceCheck();%>' --%>
       
location.href='maindb.jsp?ulan='+lat+'&ulon='+lon;
         // 마커와 인포윈도우를 표시합니다
            displayMarker(locPosition, message);
            
            
///////////////////////////////////////////////////////////////// 다충 출력
        var positions = [
            {
                title: '카카오', 
                latlng: new kakao.maps.LatLng(37.500126901, 127.035447801)
            },
            {
                title: '생태연못', 
                latlng: new kakao.maps.LatLng(37.693199157714844, 127.02958679199219)
            }
        ];

        // 마커 이미지의 이미지 주소입니다
        var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
            
        for (var i = 0; i < positions.length; i ++) {
            
            // 마커 이미지의 이미지 크기 입니다
            var imageSize = new kakao.maps.Size(24, 35); 
            
            // 마커 이미지를 생성합니다    
            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
            
            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
                map: map, // 마커를 표시할 지도
                position: positions[i].latlng, // 마커를 표시할 위치
                title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
                image : markerImage // 마커 이미지 
            });
            marker.setMap(map); // 마커한거 지도에 출력
        }
         
//////////////////////////////////////////////////////////////////// 
        
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
      
        message = '현재위치를 사용할수 없어요..'
        alert(message) /* 이거 채크하셔야함  */
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
}    
</script>

</body>
</html>