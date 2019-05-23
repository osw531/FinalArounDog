<%@page import="java.io.File"%>
<%@page import="com.aroundog.model.domain.Admin"%>
<%@page import="com.aroundog.model.domain.Adoptboard"%>
<%@page import="com.aroundog.model.domain.Type"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
   Admin admin=(Admin)request.getSession().getAttribute("admin");
   List<Type> typeList=(List)request.getAttribute("typeList");
   Adoptboard adoptboard=(Adoptboard)request.getAttribute("adoptboard");
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
var flag=false;

$(function(){
   CKEDITOR.replace('content');
   
   $($("input[type='button']")[0]).click(function(){//수정
      update();
   });
   
   $($("input[type='button']")[1]).click(function(){//삭제
      del();
   });
   $($("input[type='button']")[2]).click(function(){//목록
      location.href="/admin/adoptboardList";
   });
   $("#myFile").change(function(e){
       flag=true;
       showimg(e);
   });
});
//이미지 미리보기
function showimg(e){
   var files = e.target.files
    var thum = files[0].name;
     $("#thum").attr("src","/img/dogs/"+thum);
}

function update(){ //수정하기
   if(!confirm("수정하시겠어요?")){
      return;
   }
   //파일 선택했다면, 폼에 멀티파트/폼데이타 붙여야함...
   //if($("input[type='file']").val()!=""){
      //   $("form").encoding="multipart/form-data";
         //$("input[type='file']").attr( 'name', 'adoptdog.myFile' );
   //}
   //else{
      //$("form").encoding="application/x-www-form-urlencoded";
   //}
   
   if(flag){
      alert("사진교체!");
      /* $("form").encoding="multipart/form-data"; */
      $("form")
         .attr("enctype","multipart/form-data")
         .attr("encoding","multipart/form-data")
      ;
   }
   
   $("form").attr({
      method:"post",
      action:"/admin/adoptmanager/update"
   });
   $("form").submit(); 
}
function del(){ //삭제
   if(!confirm("삭제하시겠어요?")){
      return;
   }
   $("form").attr({
      method:"GET",
      action:"/admin/adoptmanager/delete"
   });
   $("form").submit(); 
}
</script>
</head>
<body>

<h3>입양 강아지 등록하기</h3>

<div class="container">
  <form >
<!--   <form enctype="multipart/form-data"> -->
     <input type="hidden" name="adoptboard_id" value="<%=adoptboard.getAdoptboard_id()%>"/>
     <input type="hidden" name="adoptdog.adoptdog_id" value="<%=adoptboard.getAdoptdog().getAdoptdog_id()%>"/>
     <input type="hidden" name="adoptdog.img" value="<%=adoptboard.getAdoptdog().getImg()%>"/>
      
      <div style="width:25%" >
            <img id="thum" width="100px" height="100px" src="/data/dogs/<%=adoptboard.getAdoptdog().getImg() %>" >
            <input type="file" name="adoptdog.myFile" id="myFile"/> 
<!--             <input type="file" name="adoptdog.myFile"/>  -->
      </div>
      
      <div style="width:75%">
        <select name="adoptdog.type.type_id" style="width:60%">
            <option value="0">===종류 선택===</option>
              <%for(int i=0;i<typeList.size();i++){ %>
           <%Type type=typeList.get(i); %>
              <%if(type.getType_id()==adoptboard.getAdoptdog().getType().getType_id()){ %>
               <option value="<%=type.getType_id()%>" selected><%=type.getInfo()%></option>
               <%}else{ %>
               <option value="<%=type.getType_id()%>" ><%=type.getInfo()%></option>
               <%} %>
            <%} %>
        </select>
        <select name="adoptdog.gender" style="width:60%">
            <option value="0">===성별 선택===</option>
           <%if("남아".equals(adoptboard.getAdoptdog().getGender())){ %>
            <option value="남아" selected>남아</option>
            <option value="여아" >여아</option>
            <%}else{ %>
            <option value="남아" >남아</option>
            <option value="여아" selected>여아</option>
            <%} %>
        </select>
        <select name="adoptdog.vaccin_id" style="width:60%">
            <option value="0">===백신 유무 선택===</option>
            <%if(1==adoptboard.getAdoptdog().getVaccin_id()){ %>
            <option value="1" selected>백신 유무 : 유</option>
            <option value="2" >백신 유무 : 무</option>
            <%}else{ %>
            <option value="1" selected>백신 유무 : 유</option>
            <option value="2" >백신 유무 : 무</option>
            <%} %>
        </select>
        <select name="adoptdog.neut_id" style="width:60%">
            <option value="0">===중성화  유무선택===</option>
             <%if(1==adoptboard.getAdoptdog().getNeut_id()){ %>
            <option value="1" selected>중성화 유무 : 유</option>
            <option value="2" >중성화 유무 : 무</option>
            <%}else{ %>
            <option value="1">중성화 유무 : 유</option>
            <option value="2" selected>중성화 유무 : 무</option>
            <%} %>
        </select>
       <input type="text" name="adoptdog.age" value="<%=adoptboard.getAdoptdog().getAge() %>" style="width:60%">
      </div>

      <div>
          <input type="text" name="title" value="<%=adoptboard.getTitle() %>"/>
          <textarea id="subject" name="adoptdog.feature" style="height:100px"><%=adoptboard.getAdoptdog().getFeature() %></textarea>
          <textarea id="subject" name="content" style="height:600px"><%=adoptboard.getContent() %></textarea>
      </div>
      <br/>
      <div>
          <input type="button" value="수정">
          <input type="button" value="삭제" >
          <input type="button" value="목록">
      </div>
  </form>
</div>

</body>
</html>