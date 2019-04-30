package com.aroundog.model.repository;

import java.util.List;

import com.aroundog.model.domain.FreeBoard;

public interface FreeBoardDAO {
	public List selectAll();
	public int delete(int freeboard_id);
	public int insert(FreeBoard freeboard);
	public int update(FreeBoard freeboard);
	public FreeBoard select(int freeboard_id);
	public int updateHitCnt(int freeboard_id);
	public List selectByWriter(int member_id);
	public List selectByTitle(String searchWord);
	
}
