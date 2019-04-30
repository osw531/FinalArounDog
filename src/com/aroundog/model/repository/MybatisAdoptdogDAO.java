package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.Adopt;
import com.aroundog.model.domain.Adoptdog;

@Repository
public class MybatisAdoptdogDAO implements AdoptdogDAO{
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	// 관리자 : 입양  강아지 한건 등록하기
	public int insert(Adoptdog adoptdog) {
		return sessionTemplate.insert("Adoptdog.insert", adoptdog);
	}

	// 관리자: 입양 강아지 목록 보기
	public List selectAll() {
		return sessionTemplate.selectList("Adoptdog.selectAll");
	}

	// 관리자: 입양 강아지 1건 상세보기
	public Adoptdog select(int adoptdog_id) {
		return sessionTemplate.selectOne("Adoptdog.select", adoptdog_id);
	}

	// 관리자: 입양 강아지 수정
	public int update(Adoptdog adoptdog) {
		return sessionTemplate.update("Adoptdog.update", adoptdog );
	}

	// 관리자: 입양 강아지 삭제
	public int delete(int adoptdog_id) {
		return sessionTemplate.delete("Adoptdog.delete", adoptdog_id);
	}

	

}