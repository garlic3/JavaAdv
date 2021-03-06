<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>좌표로 주소를 얻어내기</title>
    
</head>
<body>
<div id="weather">
    <span></span><br>
    <span></span>
</div>

<script>
//  let city = response.result[0].structure.level1
//  let gu = response.result[0].structure.level2
//  let dong = response.result[0].structure.level4A
function onGeoOk(position) {
    const lat = position.coords.latitude;
    const lon = position.coords.longitude;
    // const url = `https://api.openweathermap.org/data/2.5/weather?lat=${lat}&lon=${lon}&appid=${API_KEY}&units=metric`;

    const url = `http://api.vworld.kr/req/address?service=address&request=getAddress&version=2.0&crs=epsg:4326&point=${lon},${lat}&type=both&zipcode=true&simple=false&key=630A0A56-CF1A-39EF-81E0-AA0E6CB3FAE6`;
    
    fetch(url).then((response) => response.json()).then((data) =>       weather.innerText = `시: ${data.response.result[0].structure.level1} / 구:${data.response.result[0].structure.level2} / 동:${data.response.result[0].structure.level4A}°C`);

    
}
    function onGeoError(){
    alert("Can't find you. No weather for you.");
}

navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError); 


</script>
</body>
</html>