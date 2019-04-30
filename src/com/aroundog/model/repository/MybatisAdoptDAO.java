package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.Adopt;

@Repository
public class MybatisAdoptDAO implements AdoptDAO{
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	// 유저 : 입양 신청 한건 등록하기
	public int insert(Adopt adopt) {	
		return sessionTemplate.insert("Adopt.insert", adopt);
	}
	
	// 관리자: 입양요청 게시글 목록 보기
	public List selectAll() {
		return sessionTemplate.selectList("Adopt.selectAll");
	}
	
	// 관리자: 입양요청 게시글 1건 상세보기
	public Adopt select(int adopt_id) {
		return sessionTemplate.selectOne("Adopt.select", adopt_id);
	}
	
	// 관리자: 입양요청 게시글 수정 & 확인완료
	public int update(Adopt adopt) {
		return sessionTemplate.update("Adopt.update", adopt);
	}
}