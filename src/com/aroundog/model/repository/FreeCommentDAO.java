package com.aroundog.model.repository;

import java.util.List;

import com.aroundog.model.domain.FreeBoard;
import com.aroundog.model.domain.FreeComment;

public interface FreeCommentDAO {
	public List selectAll();
	public int delete(int freecomment_id);
	public int insert(FreeComment freeComment);
	public int update(FreeComment freeboard);
	public FreeComment select(int freecomment_id);
	public int commentAdd(FreeComment freeComment);
	public int deleteByFreeboardId(int freeboard_id);
	public int deleteByTeam(int team);
	public int deleteByCommentId(int freecomment_id);
}
