package com.aroundog.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.aroundog.common.exception.AdoptboardRegistFailException;
import com.aroundog.common.exception.DeleteFailException;
import com.aroundog.common.exception.EditFailException;
import com.aroundog.common.exception.RegistFailException;
import com.aroundog.common.file.AdoptboardUploader;
import com.aroundog.common.file.FileManager;
import com.aroundog.model.domain.Adoptboard;
import com.aroundog.model.domain.Adoptdog;
import com.aroundog.model.repository.AdoptboardDAO;
import com.aroundog.model.repository.AdoptdogDAO;

@Service
public class AdoptboardServiceImpl implements AdoptboardService{
   
   @Autowired
   private AdoptboardDAO adoptboardDAO;
   @Autowired
   private AdoptdogDAO adoptdogDAO;
   
   private AdoptboardUploader uploader=new AdoptboardUploader();
   
   // 관리자 : 입양  게시물 한건 등록하기
   @Transactional("transactionManager")
   public void insert(Adoptboard adoptboard, String realPath) throws AdoptboardRegistFailException{   //오류나면 롤백시킴 
      String img=uploader.reNamePhoto(adoptboard, realPath); //등록할 사진의 이름 교체
      System.out.println("변환한 이미지의 이름"+img);
      if(img!=null) {//이름 교체 후 입양 게시물 1건 등록!
         adoptboard.getAdoptdog().setImg(img);
         int result=adoptdogDAO.insert(adoptboard.getAdoptdog());  //adoptdog의 pk채워지게 됨..
         int result2=adoptboardDAO.insert(adoptboard); //board 등록
         if(result==0 || result2==0) {
               throw new AdoptboardRegistFailException("입양게시물 등록 실패");
         }else {
            uploader.insertUpload(adoptboard, realPath, img);//사진 업로드!!
         }   
      }else{//사진 이름 교체 실패
         System.out.println("입양 게시물의 이름 변환 실패");
         throw new AdoptboardRegistFailException("입양게시물 등록 실패");
      }
   }
   // 관리자: 입양 게시물 수정
   @Transactional("transactionManager")
      public void update(Adoptboard adoptboard, String realPath) throws EditFailException{
          int result=adoptdogDAO.update(adoptboard.getAdoptdog());
         int result2=adoptboardDAO.update(adoptboard);
         
         if(result==0 || result2==0) {
            throw new EditFailException("입양게시물 수정 실패");
         }else {
            uploader.updateUpload(adoptboard, realPath); //사진 교체!
         }
      }
   
   // 관리자: 입양 게시물 삭제
      @Transactional("transactionManager")
      public void delete(int adoptboard_id, String realPath) throws DeleteFailException{
         Adoptboard adoptboard=adoptboardDAO.select(adoptboard_id); //선택한 게시물 가져오기
         
         int result=adoptdogDAO.delete(adoptboard.getAdoptdog().getAdoptdog_id()); //가져온 게시물에 열결된 adoptdog 삭제
         int result2=adoptboardDAO.delete(adoptboard_id); //게시물 삭제
         if(result==0 || result2==0) {
            throw new DeleteFailException("입양게시물 삭제 실패");
         }else {
            uploader.delete(adoptboard, realPath);
         }
      }
   
   // 관리자: 입양 게시물 목록 보기
   public List selectAll() {
      return adoptboardDAO.selectAll();
   }
   
   // 관리자: 입양 게시물 1건 상세보기
   public Adoptboard select(int adoptboard_id) {
      return adoptboardDAO.select(adoptboard_id);
   }
   
}