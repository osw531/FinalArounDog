package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MybatisLostCommentsDAO implements LostCommentsDAO{

	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public List select(int lostboard_id) {
		return sessionTemplate.selectList("LostComments.select", lostboard_id);
	}
	public int delete(int lostboard_id) {
		return sessionTemplate.delete("LostComments.delete", lostboard_id);
	}

}
