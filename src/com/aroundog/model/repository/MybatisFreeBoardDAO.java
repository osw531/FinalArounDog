package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.FreeBoard;
@Repository
public class MybatisFreeBoardDAO implements FreeBoardDAO{	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//모든 자유게시판 글 가져오기
	public List selectAll() {
		List freeBoardList=sqlSessionTemplate.selectList("FreeBoard.selectAll");
		return freeBoardList;
	}
	//게시글 한건 삭제
	public int delete(int freeboard_id) {		
		return sqlSessionTemplate.delete("FreeBoard.delete", freeboard_id);
	}

	public int insert(FreeBoard freeboard) {
		return sqlSessionTemplate.insert("FreeBoard.insert", freeboard);
	}
	@Override
	public int update(FreeBoard freeboard) {
		return sqlSessionTemplate.update("FreeBoard.update", freeboard);
	}
	@Override
	public FreeBoard select(int freeboard_id) {
		return sqlSessionTemplate.selectOne("FreeBoard.select", freeboard_id);
	}
	public int updateHitCnt(int freeboard_id) {
		return sqlSessionTemplate.update("FreeBoard.updateHitCnt", freeboard_id);
	}

	public List selectByWriter(int member_id) {
		return sqlSessionTemplate.selectList("FreeBoard.selectByWriter",member_id);
	}

	public List selectByTitle(String searchWord) {
		return sqlSessionTemplate.selectList("FreeBoard.selectByTitle",searchWord);
	}

	

}
