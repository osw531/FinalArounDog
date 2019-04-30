package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.LostComment;

@Repository
public class MybatisLostCommentDAO implements LostCommentDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	@Override
	public int insert(LostComment lostComment) {
		return sqlSessionTemplate.insert("LostComment.insert", lostComment);
	}
	@Override
	public List selectAll() {
		return sqlSessionTemplate.selectList("LostComment.selectAll");
	}
	@Override
	public int delete(int lostcomment_id) {
		return sqlSessionTemplate.delete("LostComment.delete",lostcomment_id);
	}
	@Override
	public int commentAdd(LostComment lostComment) {
		return sqlSessionTemplate.insert("LostComment.commentAdd", lostComment);
	}
	@Override
	public int deleteByLostboardId(int lostboard_id) {
		return sqlSessionTemplate.delete("LostComment.deleteByLostboardId",lostboard_id);
	}
	@Override
	public int deleteByTeam(int team) {
		return sqlSessionTemplate.delete("LostComment.deleteByTeam",team);
	}
	@Override
	public int deleteByCommentId(int lostcomment_id) {
		return sqlSessionTemplate.delete("LostComment.deleteByCommentId", lostcomment_id);
	}

}
