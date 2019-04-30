package com.aroundog.model.service;

import java.util.List;

import com.aroundog.model.domain.Notice;

public interface NoticeService {
	public List selectAll();
	public void delete(int notice_id);
	public void insert(Notice notice);
	public void update(Notice notice);
	public Notice select(int notice_id);
	public void updateHitCnt(int notice_id);
}
