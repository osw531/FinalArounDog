package com.aroundog.model.service;

import java.util.List;

import com.aroundog.model.domain.LostComment;

public interface LostCommentService {
	public void insert(LostComment lostComment);
	public List selectAll();
	public void delete(int lostcomment_id);
	public void commentAdd(LostComment lostComment);
	public void deleteByLostboardId(int lostboard_id);
	public void deleteByTeam(int team);
	public void deleteByCommentId(int lostcomment_id);
}
