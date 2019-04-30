package com.aroundog.common.file;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.aroundog.model.domain.LostBoard;

public class LostBoardImgUploader {
   private FileManager fileManager = new FileManager();
   
   public String[] returnFilename(MultipartFile[] myFile, LostBoard lostBoard, 
         String realPath) {
	   System.out.println("로스트이미지업로더 실행");
      String[] filenameList = new String[myFile.length];
      for (int i = 0; i < myFile.length; i++) {
         String filename = myFile[i].getOriginalFilename();
         File uploadFile = null;
         try {
        	 System.out.println(i+"번째 파일이름"+filename);
            uploadFile = new File(realPath + "/" + filename);
            System.out.println("업로드파일은"+uploadFile);
            myFile[i].transferTo(new File(realPath + "/" + filename));
            filename = fileManager.reNameByHash(uploadFile, realPath);
           System.out.println(filename+"이 바뀐 이름이구나");
            if (filename != null) {
               filenameList[i] = filename;
            }
         } catch (IllegalStateException | IOException e) {
            System.out.println("이 사용자는 파일을 등록하지 않았습니다");
         }
      }
      return filenameList;
   }
}