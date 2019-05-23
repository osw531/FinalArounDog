package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.FreeComment;

@Repository
public class MybatisFreeCommentDAO implements FreeCommentDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public List selectAll() {
		List fcList=sqlSessionTemplate.selectList("FreeComment.selectAll");
		return fcList;
	}

	public int delete(int freecomment_id) {
		return sqlSessionTemplate.delete("FreeComment.delete", freecomment_id);
	}

	@Override
	public int insert(FreeComment freeComment) {
		return sqlSessionTemplate.insert("FreeComment.insert", freeComment);
	}

	@Override
	public int update(FreeComment freeboard) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List select(int freeboard_id) {
		List freeList=sqlSessionTemplate.selectList("FreeComment.select", freeboard_id);
		return freeList;
	}

	public int commentAdd(FreeComment freeComment) {
		return sqlSessionTemplate.insert("FreeComment.commentAdd", freeComment);
	}

	public int deleteByFreeboardId(int freeboard_id) {
		return sqlSessionTemplate.delete("FreeComment.deleteByFreeboardId", freeboard_id);
	}

	public int deleteByTeam(FreeComment freeComment) {
		return sqlSessionTemplate.delete("FreeComment.deleteByTeam",freeComment);
	}

	public int deleteByCommentId(int freecomment_id) {
		return sqlSessionTemplate.delete("FreeComment.deleteByCommentId",freecomment_id);
	}

	@Override
	public int insertFirst(FreeComment freeComment) {		
		return sqlSessionTemplate.insert("FreeComment.insertFirst", freeComment);
	}

}
