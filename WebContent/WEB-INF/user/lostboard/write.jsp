<%@page import="com.aroundog.model.domain.Type"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>
<%@ include file="/WEB-INF/user/inc/head.jsp"%>
<style>
.banner-areawon {
  background: url(/img/dog2.jpg) center;
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
      $("input[name='regist']").click(
            function() {
               if ($("#title").val() == "" || $("#type_id").val() == "견종 선택"
                     || $("#startdate").val() == ""
                     || $("#enddate").val() == ""
                     || $("#content").val() == ""
                     || $("#area").val() == "지역 선택"
                     || markers.length == 0) {
                  alert("빈칸을 채워주세요!!");
               } else {
                  regist();
               }
            });
      $("input[name='list']").click(function() {
         location.href="/user/lostboard/lostboardlist"
      });
   });

   function regist(){
      alert("등록 되었습니다!");
      $("form").attr({
         method : "post",
         action : "/user/lostboard"
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
         $($("form").find("input[name='lati']")).val(event.latLng.lat()); //서버에 위도 경도 넘겨주어야하니까 히든 값 설정
         $($("form").find("input[name='longi']")).val(event.latLng.lng());   
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
               <h2 class="text-white">길 잃은 강아지를 보호하고 계신가요?</h2>
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
                  <h1 class="mb-20">길 잃은 강아지를 보호하고 있다면 게시물을 작성해주세요!!</h1>
                  <p>아래의 양식을 빠짐없이 입력하고 '글 등록' 버튼을 눌러주세요</p>                  
               </div>
            </div>
         </div>
         <div class="row justify-content-center">
            <form class="col-lg-9" enctype="multipart/form-data">
               <input type="hidden" name="member_id" value="<%=member.getMember_id()%>" />
               <div class="form-group">
                  <label for="first-name">제목</label> 
                  <input type="text" name="title"   class="form-control" placeholder="제목을 작성해주세요" id="title">
               </div>
               
               <label for="first-name">견종</label>  
               <div class="select-option" id="service-select">
                  <select id="type_id" name="type_id"  >
                     <option>견종 선택</option>
                     <c:forEach var="typeList" items="${typeList}">
                        <option value='<c:out value="${typeList.type_id}" />'>
                        <c:out value="${typeList.info}"/>
                        </option>
                     </c:forEach>
                  <!--
                     <option value="1">골든 리트리버</option>
                     <option value="3">닥스훈트</option>
                     <option value="7">말티즈</option>
                     <option value="14">불독</option>
                     <option value="18">비글</option>
                     <option value="19">비숑 프리제</option>
                     <option value="20">사모예드</option>
                     <option value="21">삽살개</option>
                     <option value="25">시바견</option>
                     <option value="26">시베리안 허스키</option>
                     <option value="42">진돗개</option>
                     <option value="44">치와와</option>
                     <option value="36">요크셔 테리어</option>
                     <option value="46">포메라니안</option>
                     <option value="48">푸들</option> -->
                     
                  </select>                   
               </div>
               <br> <br>
               <div class="form-group">
                  <label for="first-name">보호 기간</label> <input type="text"
                     name="startdate" class="form-control"
                     placeholder="보호 시작 날짜  xxxx.xx.xx" id="startdate"> <br>
                  <input type="text" name="enddate" class="form-control"
                     placeholder="보호 종료 날짜  xxxx.xx.xx" id="enddate">
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
               <br> <br> <label for="note">▶지도에서 정확한 위치를 클릭해주세요!</label>
               <!-- Google Map 관련 -->

               <div class="select-option" id="service-select">
                  <div id="googleMap" style="width: 100%; height: 500px;"></div>
                  <input type="hidden" name="lati" /> 
                  <input type="hidden" name="longi" />
               </div>
               <hr>
               <!-- Google Map 끝 -->
               <div class="form-group" style="width: 100%" id="fileDiv">
                  <label for="note">상세내용</label>
                  <textarea class="form-control" name="content" rows="5"
                     placeholder="보호하고 있는 동물에 대해서 상세한 내용을 적어주세요" id="content"></textarea>
                  <hr>
                  <label for="note">사진이 있다면 첨부해주세요!</label> <br> <label
                     for="note">▶최대 3개</label> <br>
                      <input type="file" id="myFile"  name="myFile" multiple /> 
                      <label for="myFile" class="btn-2">upload</label>
                      <input type="button" name="regist"     value="작성하기" class="primary-btn float-right" /> 
                      <input type="button" name="list" value="목록으로"
                     class="primary-btn float-right" />
               </div>
            </form>
         </div>
      </div>
   </section>
   <!-- End Volunteer-form Area -->

   <!-- start footer Area -->
   <%@include file ="/WEB-INF/user/inc/footer.jsp" %>
   
   <!-- End footer Area -->
   <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7s3c6u5G3n7koVQkGfBn_qLQarZjjHlc&callback=myMap" />
   <%@include file="/WEB-INF/user/inc/tail.jsp"%>
</body>
</html>