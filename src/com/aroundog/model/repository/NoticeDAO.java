package com.aroundog.model.repository;

import java.util.List;

import com.aroundog.model.domain.Notice;

public interface NoticeDAO {
	public List selectAll();
	public int delete(int notice_id);
	public int insert(Notice notice);
	public int update(Notice notice);
	public Notice select(int notice_id);
	public int updateHitCnt(int notice_id);
}
