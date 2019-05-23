package com.aroundog.model.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.aroundog.model.domain.LostBoard;
import com.aroundog.model.domain.LostBoardImg;

public interface LostBoardService {
   public void insert(LostBoard lostBoard);
   public void insertImg(MultipartFile[] myFile, LostBoard lostBoard,
         String realPath);
   public List selectAll();
   public LostBoard select(int lostboard_id);
   public List selectImg(int lostboard_id);
   public void update(int lostboard_id);
   public LostBoardImg selectThumb(int lostboard_id);
   public List selectAllImg();
   public List getKeyWordList(List lostBoardList);
   public void delete(int lostboard_id);
   public void deleteImg(int lostboard_id,List<LostBoardImg> fileList,String dir);
   public void deleteTransaction(int lostboard_id);
   public void updateLostBoard(LostBoard lostboard);
   public void updateLostBoardImg(MultipartFile[] myFile,List<LostBoardImg> fileList,LostBoard lostBoard,String realPath,int lostboard_id);
   public LostBoard selectById(int lostboard_id);

}