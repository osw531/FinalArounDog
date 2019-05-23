<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<%@ include file="/WEB-INF/user/inc/head.jsp"%>
<style>
.banner-areawon {
  background: url(/img/dog1.jpg) center;
  background-size: cover;
}

.banner-areawon .primary-btn {
  padding-left: 30px;
  padding-right: 30px;
}

.banner-areawon .overlay-bg {
  background-color: rgba(0, 0, 0, 0.4);
}
/*파일 업로드 꾸미기 */
[type="file"] {
  height: 0;
  overflow: hidden;
  width: 0;
}

[type="file"] + label {
  background: #f15d22;
  border: none;
  border-radius: 5px;
  color: #fff;
  cursor: pointer;
  display: inline-block;
   font-family: 'Poppins', sans-serif;
   font-size: inherit;
  font-weight: 600;
  margin-bottom: 1rem;
  outline: none;
  padding: 1rem 50px;
  position: relative;
  transition: all 0.3s;
  vertical-align: middle;
  
  &:hover {
    background-color: darken(#f15d22, 10%);
  }
  &.btn-2 {
    background-color: #99c793;
    border-radius: 50px;
    overflow: hidden;
    
    &::before {
      color: #fff;
      content: "\f382";
      font-family: "Font Awesome 5 Pro";
      font-size: 100%;
      height: 100%;
      right: 130%;
      line-height: 3.3;
      position: absolute;
      top: 0px;
      transition: all 0.3s;
    }

    &:hover {
      background-color: darken(#99c793, 30%);
        
      &::before {
        right: 75%;
      }
    }
  }
}
</style>
<script>
/*파일 업로드 꾸미기 */
$(document).ready(function(){
   $("input[type=file]").change(function(){
      var fileInput = document.getElementById("myFile");
      var files=fileInput.files;
      var file;
      for(var i=0;i<files.length;i++){
         file=files[i];
         $("#fileDiv").append('<div><label for="file">'+file.name+'</label><div>');
      }
   });
});
   //제출 기능 시작 ---------------------------
   $(function() {
      $("input[type='button']").click(function() {

         if ($("#title").val() == ""||$("#phone").val() == ""||$("#email").val() == ""||$("#content").val() == ""||$("#area").val() == "지역 선택"||markers.length==0) {
            alert("빈칸을 채워주세요!!");
         }else {
            report();
         }
      });
   });
   function report() {
      alert("등록 되었습니다!");
      $("form").attr({
         method : "post",
         action : "/user/report/regist"
      });
      $("form").submit();

   }

   //----------------------------------제출 기능 끝

   // -------------------------------------------------------Google Map 관련------------------------

   //강아지 발견한 위치 지도에 찍기 -------------
   var map;
   function myMap() {
      var latLng = new google.maps.LatLng(37.571066, 126.992255);
      var mapProp = {
         center : latLng,
         zoom : 12
      };
      map = new google.maps.Map(document.getElementById("googleMap"), mapProp);
      google.maps.event.addListener(map, 'click', function(event) {
         deleteMarker();
         addMarker(map, event.latLng);
      });

      google.maps.event.addListener(map, 'click', function(event) {
         //alert( "Latitude: "+event.latLng.lat()+" "+", longitude: "+event.latLng.lng() );  // <- 클릭한 위도 경도 값 확인
         $($("form").find("input[name='lati']")).val(event.latLng.lat()); //서버에 위도 경도 넘겨주어야하니까 히든 값 설정
         $($("form").find("input[name='longi']")).val(event.latLng.lng());
         //alert($($("form").find("input[name='area_lati']")).val()); // 히든값 제대로 들어오는거 확인   
      });
   }
   var markers = [];
   function addMarker(map, area) {
      var marker = new google.maps.Marker({
         position : area,
         icon : "/img/find_marker.png",
         map : map
      });
      markers.push(marker);
   }
   function deleteMarker() {
      for (var i = 0; i < markers.length; i++) {
         markers[i].setMap(null);
      }
      markers = [];
   }

   // -------------강아지 발견한 위치 지도에 찍기 끝

   //select 바꾸면 지도 줌 바꾸기 -------------
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
   //-------------select 바꾸면 지도 줌 바꾸기  끝
</script>
</head>
<body>
<%@include file="/WEB-INF/user/inc/header.jsp" %>
   <!-- start banner Area -->
   <section class="banner-areawon relative" id="home">
      <div class="overlay overlay-bg"></div>
      <div class="container">
         <div class="row d-flex align-items-center justify-content-center">
            <div class="about-content col-lg-12">
               <h1 class="text-white">제보하기</h1>
            </div>
         </div>
      </div>
   </section>
   <!-- End banner Area -->

   <!-- Start Volunteer-form Area -->
   <section class="Volunteer-form-area section-gap">
      <div class="container">
         <div class="row d-flex justify-content-center">
            <div class="menu-content pb-60 col-lg-9">
               <div class="title text-center">
                  <h1 class="mb-20">가여운 동물을 제보해주세요</h1>
                  <p>아래의 양식을 빠짐없이 입력하고 '제보하기' 버튼을 눌러주세요</p>
               </div>
            </div>
         </div>
         <div class="row justify-content-center">
            <form class="col-lg-9" enctype="multipart/form-data">
               <input type="hidden" name="member_id" value="1" />
               <div class="form-group">
                  <label for="first-name">제목</label> <input type="text" name="title"
                     class="form-control" placeholder="제목을 작성해주세요" id="title">
               </div>
               <div class="form-group">
                  <label for="first-name">전화번호</label> <input type="text"
                     name="phone" class="form-control" placeholder="연락받을 전화번호"
                     id="phone">
               </div>

               <div class="form-group">
                  <label for="last-name">이메일</label> <input type="text" name="email"
                     class="form-control" placeholder="연락받을 이메일" id="email">
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
                  <!-- Google Map 관련 -->

                  <div class="select-option" id="service-select">
                     <div id="googleMap" style="width: 80%; height: 500px;"></div>
                     <input type="hidden" name="lati" /> <input type="hidden"
                        name="longi" />
                  </div>
                  <hr>
                  <!-- Google Map 끝 -->
                  <div class="form-group" style="width: 100%" id="fileDiv">
                     <label for="note">상세내용</label>
                     <textarea class="form-control" name="content" rows="5"
                        placeholder="제보하려는 동물에 대해서 상세한 내용을 적어주세요" id="content"></textarea>
                     <hr>
                     <label>▶길 잃은 아이의 사진을 첨부해주세요!</label>
                     <br>
                     <label>&nbsp;※최대 3개</label>
                     <br>
                     <input type="file"     id="myFile" name="myFile" multiple /> 
                     <label for="myFile" class="btn-2">upload</label>
                     <input type="button"   value="제보하기" class="primary-btn float-right" />                
                  </div>
            </form>
         </div>
      </div>
   </section>
   <!-- End Volunteer-form Area -->

   <!-- start footer Area -->   
   <%@include file="/WEB-INF/user/inc/footer.jsp" %>
   <!-- End footer Area -->
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7s3c6u5G3n7koVQkGfBn_qLQarZjjHlc&callback=myMap" />
   <%@include file="/WEB-INF/user/inc/tail.jsp"%>
</body>
</html>