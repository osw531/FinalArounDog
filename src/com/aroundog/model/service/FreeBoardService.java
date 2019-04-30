package com.aroundog.model.service;

import java.util.List;

import com.aroundog.model.domain.FreeBoard;

public interface FreeBoardService {
	public List selectAll();
	public void delete(int freeboard_id);
	public void insert(FreeBoard freeboard);
	public void update(FreeBoard freeboard);
	public FreeBoard select(int freeboard_id);
	public void updateHitCnt(int freeboard_id);
	public List selectByWriter(int member_id);
	public List selectByTitle(String searchWord);
}
