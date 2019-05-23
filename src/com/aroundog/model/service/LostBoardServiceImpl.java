package com.aroundog.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.aroundog.common.exception.DeleteFailException;
import com.aroundog.common.exception.EditFailException;
import com.aroundog.common.exception.ReportFailException;
import com.aroundog.common.file.FileManager;
import com.aroundog.common.file.LostBoardImgUploader;
import com.aroundog.model.domain.LostBoard;
import com.aroundog.model.domain.LostBoardImg;
import com.aroundog.model.domain.ReportImg;
import com.aroundog.model.repository.LostBoardDAO;
import com.aroundog.model.repository.LostCommentDAO;

@Service
public class LostBoardServiceImpl implements LostBoardService{
   @Autowired
   private LostBoardDAO lostBoardDAO;
   
   // 댓글 삭제 트랜잭션 처리
   @Autowired
   private LostCommentDAO dao;
   
   private FileManager manager = new FileManager();
   private LostBoardImgUploader uploader = new LostBoardImgUploader();
   
   @Override
   public void insert(LostBoard lostBoard) throws ReportFailException{
      int result = lostBoardDAO.insert(lostBoard);
      if(result==0) {
         throw new ReportFailException("등록 실패");
      }
   }

   @Override
   public void insertImg(MultipartFile[] myFile, LostBoard lostBoard,
         String realPath) throws ReportFailException{
      String[] imgList = uploader.returnFilename(myFile, lostBoard, realPath);
      //System.out.println("서비스에서 받은 리스트 크기는"+imgList.size());
      int result = 0;
      for(int i=0;i<imgList.length;i++) {
         LostBoardImg lbi = new LostBoardImg();
         lbi.setLostboard(lostBoard);
         lbi.setImg(imgList[i]);
         result = lostBoardDAO.insertImg(lbi);
      }
      if (result == 0) {
         throw new ReportFailException("등록 실패!!");
      }
      
   }

   @Override
   public List selectAll() {
      return lostBoardDAO.selectAll();
   }

   @Override
   public LostBoard select(int lostboard_id) {
      return lostBoardDAO.select(lostboard_id);
   }

   @Override
   public List selectImg(int lostboard_id) {
      return lostBoardDAO.selectImg(lostboard_id);
   }

   @Override
   public void update(int lostboard_id) throws EditFailException{
      int result = lostBoardDAO.update(lostboard_id);
      if(result==0){
         throw new EditFailException("수정 실패");
      }   
   }

   @Override
   public LostBoardImg selectThumb(int lostboard_id) {
      return lostBoardDAO.selectThumb(lostboard_id);
   }

   @Override
   public List selectAllImg() {
      return lostBoardDAO.selectAllImg();
   }

   @Override
   public List getKeyWordList(List lostBoardList) {
      List<LostBoardImg> thumbList = new ArrayList();
      List<Integer> idList= new ArrayList();
      for(int i=0;i<lostBoardList.size();i++) {
        LostBoard lb = (LostBoard) lostBoardList.get(i);      
        int lb_id = lb.getLostboard_id();
        LostBoardImg lbi=selectThumb(lb_id);
        lbi.setLostboard_id(lb_id);
        thumbList.add(lbi);
        idList.add(lb_id);
        }
      List keyWordList = new ArrayList();
      keyWordList.add(thumbList);
      keyWordList.add(idList);
      return keyWordList;
   }
   
   @Override
   public void delete(int lostboard_id) throws EditFailException{
      int result = lostBoardDAO.delete(lostboard_id);
      if(result==0) {
         throw new EditFailException("삭제 실패");
      }      
   }

   @Override
   public void deleteImg(int lostboard_id,List<LostBoardImg> fileList,String realPath) throws EditFailException{
      String[] oriList = new String[fileList.size()];
      for(int i=0;i<oriList.length;i++) {
         String oriName = fileList.get(i).getImg();
         oriList[i]= oriName;
      }
      int result = lostBoardDAO.deleteImg(lostboard_id);
      manager.deleteFile(oriList, realPath);
      if(result ==0) {
         throw new EditFailException("삭제 실패");
      }
   }

   @Override
   public void updateLostBoard(LostBoard lostBoard) throws EditFailException{
      int result = lostBoardDAO.updateLostBoard(lostBoard);
      if(result ==0) {
         throw new EditFailException("수정 실패");
      }
   }

   @Override
   public void updateLostBoardImg(MultipartFile[] myFile,List<LostBoardImg> fileList,LostBoard lostBoard, String realPath,int lostboard_id) throws EditFailException{
      
      String[] imgList = uploader.returnFilename(myFile, lostBoard, realPath);
         int result = 0;
         List<LostBoardImg> list = lostBoardDAO.selectImg(lostboard_id);
        for(int i=0;i<imgList.length;i++) {
           LostBoardImg lbi = list.get(i);
           lbi.setLostboard(lostBoard);
           lbi.setImg(imgList[i]);         
           result = lostBoardDAO.updateLostBoardImg(lbi);           
         }      
       String[] oriList = new String[fileList.size()];
       for(int i=0;i<oriList.length;i++) {
         String oriName = fileList.get(i).getImg();
         oriList[i]= oriName;
         }
       manager.deleteFile(oriList, realPath);
       if (result == 0) { 
           throw new EditFailException("수정 실패!!"); 
      }
   }
   @Override
   public LostBoard selectById(int lostboard_id) {
      return lostBoardDAO.selectById(lostboard_id);
   }
   
   // 관리자: 임시보호 게시물 삭제
   @Transactional
   public void deleteTransaction(int lostboard_id) throws EditFailException{
      int result=lostBoardDAO.delete(lostboard_id); // 게시글 삭제 
      int result2=1;
      int result3=1;
      List commentList=dao.select(lostboard_id);
      if(commentList.size()!=0) {
   	  
    	  result2=dao.deleteByLostBoardId(lostboard_id); // 댓글 삭제
    	  result3= lostBoardDAO.deleteImg(lostboard_id); 
    	  
      }
      System.out.println("deleteTransaction 호출!!  result :"+result+", result2 : "+result2+", result3 : "+result3);
      if(result==0 || result2==0 || result3==0) {
         throw new EditFailException("임시보호 게시글 삭제 실패");
      }
      
      
   }

}