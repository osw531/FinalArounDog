package com.aroundog.common.file;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.aroundog.model.domain.Adoptboard;
import com.aroundog.model.domain.LostBoard;

public class AdoptboardUploader {
   private FileManager fileManager = new FileManager();
   
   //관리자: 강아지 입양 게시물 사진 이름 바꾸기
   public String reNamePhoto(Adoptboard adoptboard, String realPath) {
      //파일 처리
      String img=adoptboard.getAdoptdog().getMyFile().getOriginalFilename();
      System.out.println("업로더에서 변환할 파일의 오리지날 이름"+img);
      File uploadFile=new File(realPath+"/"+img);
      System.out.println("uploadFile"+uploadFile);
      System.out.println("uploadFile"+uploadFile.getName());
      img=fileManager.reNameByDate(uploadFile, realPath);
      System.out.println("업로더에서 변환한 파일의 이름"+img);
      
      return img;
   }
   //관리자: 강아지 입양 게시물 사진 업로더
   public void insertUpload(Adoptboard adoptboard, String realPath, String img) {
      MultipartFile myFile=adoptboard.getAdoptdog().getMyFile();
      //파일 처리
      try {
         myFile.transferTo(new File(realPath+"/"+img)); //업로드!
      } catch (IllegalStateException | IOException e) {
         e.printStackTrace();
      }
   }
   
   //관리자: 강아지 입양 게시물 사진 교체
   public void updateUpload(Adoptboard adoptboard, String realPath) {
       //수정하고싶은 파일
       MultipartFile myFile=adoptboard.getAdoptdog().getMyFile();
       //원본 파일의 이름
       String img=adoptboard.getAdoptdog().getImg();
      try {
        if(myFile!=null) {
           myFile.transferTo(new File(realPath+"/"+img)); //사진만 교체!
        }
      } catch (IllegalStateException | IOException e) {
         e.printStackTrace();
         System.out.println("파일이 없습니다");
      }
   }
   //관리자: 강아지 입양 게시물 사진 1건 삭제
   public void delete(Adoptboard adoptboard, String realPath) {
     //삭제할 파일의 이름
      String fileName=adoptboard.getAdoptdog().getImg();
      fileManager.deleteFile(fileName, realPath);
   }

}