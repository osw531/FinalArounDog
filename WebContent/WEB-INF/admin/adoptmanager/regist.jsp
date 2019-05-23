<%@page import="com.aroundog.model.domain.Admin"%>
<%@page import="com.aroundog.model.domain.Type"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   Admin admin=(Admin)request.getSession().getAttribute("admin");
   List<Type> typeList=(List)request.getAttribute("typeList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
* {box-sizing: border-box;}

input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=button] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=button]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}
</style>
<script src="//cdn.ckeditor.com/4.11.3/standard/ckeditor.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
$(function(){
   CKEDITOR.replace('content');
   
  /*  $($("input[type='button']")[0]).click(function(){
      regist();
   }); */
   $($("input[type='button']")[1]).click(function(){
      location.href="/admin/adoptboardList";
   });
   
    $("#myFile").change(function(e){
       preview(e);//미리보기 함수 호출!!
      });
});
// [스프링] REST API 를 이용한 웹서비스 구축
function regist(){
   console.log($("#lati").val(), $("#longi").val());
   $("form").attr({
      method:"post",
      action:"/admin/adoptmanager/regist"
   });
  $("form").submit();
}
//사진 미리보기
function preview(e){
    var reader=new FileReader();
    reader.readAsDataURL(e.target.files[0]);//파일을 읽는 시점!! (파일읽기)
    
    reader.onload=function(){//파일 로드 이벤트 
       var img=document.createElement("img");
       img.style.width=200+"px";
       img.src=this.result;//이미지의 소스는 reader가 보유하고 있음..
       document.querySelector("img").remove();
       document.querySelector("#view").appendChild(img);
    };
}
   
//select 바꾸면 지도 영역 바꾸기 -------------
function areaChange() {
   $.ajax({
      url : "/user/map/area",
      type : "get",
      data : {
         area : $("select[name='area']").val()
      },
      success : function(result) {
         var json = JSON.parse(result);
         map.setCenter(new google.maps.LatLng(json.lati, json.longi));
      }
   });
}   

// 구글맵 관련
// key : AIzaSyBxIe99Ps8dxuqi8E79QxSK06pPdB6gT0E
var map;
function initMap(){
   var latLng = new google.maps.LatLng(37.571066, 126.992255); // 맵 센터 위치 지정
   var mapOption={
      zoom: 12, 
      center: latLng,
      scrollwheel : true
   };
   
   map= new google.maps.Map(document.getElementById("googleMap"), mapOption); // 맵 생성

   // 마커 클릭 이벤트
   google.maps.event.addListener(map, 'click', function(event) {
      $("#lati").val(event.latLng.lat()); // form으로 전송하기 위해 hidden값의 value 주기
      $("#longi").val(event.latLng.lng());
      deleteMarker();
      setMarker(event.latLng);
   });
}
var markers = [];
function setMarker(location) {
  var marker = new google.maps.Marker({
      position: location, 
      icon : "/img/find_marker.png",
      map: map
  });
  //map.setCenter(location);
  markers.push(marker);
}
function deleteMarker(){
   for(var i=0;i<markers.length;i++){
      markers[i].setMap(null);
   }
   markers = [];
}

</script>
</head>
<body>

<h3>입양 강아지 등록하기</h3>

<div class="container">
  <form enctype="multipart/form-data">
     <input type="hidden" id="lati" name="adoptdog.lati" />
    <input type="hidden" id="longi" name="adoptdog.longi"/>
      <div style="width:25%" >
         <div id="view" ><img  src=""></div>
         <input type="file" id="myFile" name="adoptdog.myFile" />
      </div>
      
      <div style="width:75%">
        <select name="adoptdog.type.type_id" style="width:60%">
            <option value="0">===종류 선택===</option>
            <%for(int i=0;i<typeList.size();i++){ %>
           <%Type type=typeList.get(i); %>
            <option value="<%=type.getType_id()%>"><%=type.getInfo()%></option>
            <%} %>
        </select>
        <select name="adoptdog.gender" style="width:60%">
            <option value="0">===성별 선택===</option>
            <option value="남아">남</option>
            <option value="여아">여</option>
        </select>
        <select name="adoptdog.vaccin_id" style="width:60%">
            <option value="0">===백신 유무 선택===</option>
            <option value="1">유</option>
            <option value="2">무</option>
        </select>
        <select name="adoptdog.neut_id" style="width:60%">
            <option value="0">===중성화  유무선택===</option>
            <option value="1">유</option>
            <option value="2">무</option>
        </select>
       <input type="text" name="adoptdog.age" placeholder="나이" style="width:60%">
      </div>
      <div class="form-row" style="display: block">
        <div class="col-6 mb-30">
           <label for="City">발견위치</label>
           <div class="select-option" id="service-select">
             <select name="area" id="area" onchange="areaChange()" required>
                <option data-display="지역 선택">지역 선택</option>
                <option value="서울">서울</option>
                <option value="경기도">경기도</option>
                <option value="인천">인천</option>
                <option value="강원도">강원도</option>
                <option value="부산">부산</option>
                <option value="광주">광주</option>
                <option value="대전">대전</option>
             </select>
         </div>
       </div>
      </div>
      <br>
      <!-- 구글 맵 -->
      <div id="googleMap" style="width: 80%; height: 500px;">
      </div>
      <br>
      <!-- 구글 맵 끝 -->
      <div>
          <input type="text" name="title" placeholder="제목">
          <textarea id="subject" name="adoptdog.feature" placeholder="특이사항" style="height:100px"></textarea>
          <textarea id="subject" name="content" placeholder="상세페이지" style="height:600px"></textarea>
      </div>
      <br/>
      <div>
          <input type="button" value="등록" onClick="regist()">
          <input type="button" value="목록">
      </div>
  </form>
</div>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBxIe99Ps8dxuqi8E79QxSK06pPdB6gT0E&callback=initMap" async defer></script>
<!-- async defer -->
</body>
</html>