package com.aroundog.model.service;

import java.util.List;

import com.aroundog.model.domain.LostComment;

public interface LostCommentService {
   public void insert(LostComment lostComment);
   public List selectAll();
   public void delete(int lostcomment_id);
   public void commentAdd(LostComment lostComment);
   public void deleteByLostBoardId(int lostboard_id);
   public void deleteByTeam(LostComment lostcomment);
   public void deleteByCommentId(int lostcomment_id);
   public List select(int lostboard_id); 
   public List selectByboardId(int lostboard_id);
   public void insertFirst(LostComment lostComment);
}