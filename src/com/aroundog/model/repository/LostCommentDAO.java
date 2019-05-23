package com.aroundog.model.repository;

import java.util.List;

import com.aroundog.model.domain.LostComment;

public interface LostCommentDAO {
   public int insert(LostComment lostComment);
   public List selectAll();
   public int delete(int lostcomment_id);
   public int commentAdd(LostComment lostComment);
   public int deleteByLostBoardId(int lostboard_id);
   public int deleteByTeam(LostComment lostcomment);
   public int deleteByCommentId(int lostcomment_id);
   public List select(int lostboard_id);
   public List selectByboardId(int lostboard_id);
   public int insertFirst(LostComment lostComment);
}