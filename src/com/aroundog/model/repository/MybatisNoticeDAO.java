package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.FreeBoard;
import com.aroundog.model.domain.Notice;
@Repository
public class MybatisNoticeDAO implements NoticeDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	public List selectAll() {
		List noticeList=sqlSessionTemplate.selectList("Notice.selectAll");
		return noticeList;
	}

	@Override
	public int delete(int notice_id) {
		return sqlSessionTemplate.delete("Notice.delete", notice_id);
	}

	@Override
	public int insert(Notice notice) {
		return sqlSessionTemplate.insert("Notice.insert", notice);
	}

	@Override
	public int update(Notice notice) {
		return sqlSessionTemplate.update("Notice.update", notice);
	}

	@Override
	public Notice select(int freeboard_id) {
		return sqlSessionTemplate.selectOne("Notice.select", freeboard_id);
	}

	@Override
	public int updateHitCnt(int freeboard_id) {
		return sqlSessionTemplate.update("Notice.updateHitCnt", freeboard_id);
	}

}
