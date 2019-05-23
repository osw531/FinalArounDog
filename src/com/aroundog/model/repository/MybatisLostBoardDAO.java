package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.LostBoard;
import com.aroundog.model.domain.LostBoardImg;

@Repository
public class MybatisLostBoardDAO implements LostBoardDAO{
   @Autowired
   private SqlSessionTemplate sessionTemplate;
   @Override
   public int insert(LostBoard lostBoard) {
      return sessionTemplate.insert("LostBoard.insert", lostBoard);
   }

   @Override
   public int insertImg(LostBoardImg lostBoardImg) {
      return sessionTemplate.insert("LostBoardImg.insert_img", lostBoardImg);
   }

   @Override
   public List selectAll() {
      return sessionTemplate.selectList("LostBoard.selectAll");
   }

   @Override
   public LostBoard select(int lostboard_id) {
      return sessionTemplate.selectOne("LostBoard.select", lostboard_id);
   }

   @Override
   public List selectImg(int lostboard_id) {
      return sessionTemplate.selectList("LostBoardImg.selectImgList", lostboard_id);
   }

   @Override
   public int update(int lostboard_id) {
      return sessionTemplate.update("LostBoard.update", lostboard_id);
   }

   @Override
   public LostBoardImg selectThumb(int lostboard_id) {
      return sessionTemplate.selectOne("LostBoardImg.selectThumb", lostboard_id);
   }

   @Override
   public List selectAllImg() {
      return sessionTemplate.selectList("LostBoardImg.selectAll");
   }
   
   @Override
   public int delete(int lostboard_id) {
      return sessionTemplate.delete("LostBoard.delete", lostboard_id);
   }

   @Override
   public int deleteImg(int lostboard_id) {
      return sessionTemplate.delete("LostBoardImg.delete", lostboard_id);
   }


   @Override
   public int updateLostBoard(LostBoard lostBoard) {
      return sessionTemplate.update("LostBoard.updateLostBoard", lostBoard);
   }

   @Override
   public int updateLostBoardImg(LostBoardImg lostBoardImg) {
      return sessionTemplate.update("LostBoardImg.updateLostBoardImg", lostBoardImg);
   }

   
   @Override
   public LostBoard selectById(int lostboard_id) {
      return sessionTemplate.selectOne("LostBoard.selectById", lostboard_id);
   }

}