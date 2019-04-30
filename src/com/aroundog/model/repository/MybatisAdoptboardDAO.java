package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.Adoptboard;

@Repository
public class MybatisAdoptboardDAO implements AdoptboardDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	// 관리자 : 입양  게시물 한건 등록하기
	public int insert(Adoptboard adoptboard) {
		return sessionTemplate.insert("Adoptboard.insert", adoptboard);
	}
	
	// 관리자: 입양 게시물 목록 보기
	public List selectAll() {
		return sessionTemplate.selectList("Adoptboard.selectAll");
	}
	
	// 관리자: 입양 게시물 1건 상세보기
	public Adoptboard select(int adoptboard_id) {
		return sessionTemplate.selectOne("Adoptboard.select", adoptboard_id);
	}
	
	// 관리자: 입양 게시물 수정
	public int update(Adoptboard adoptboard) {
		return sessionTemplate.update("Adoptboard.update", adoptboard);
	}
	
	// 관리자: 입양 게시물 삭제
	public int delete(int adoptboard_id) {
		return sessionTemplate.delete("Adoptboard.delete", adoptboard_id);
	}

}