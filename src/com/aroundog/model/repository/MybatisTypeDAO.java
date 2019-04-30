
package com.aroundog.model.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.Type;



@Repository
public class MybatisTypeDAO implements TypeDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;

	//관리자 : 타입 리스트 불러오기
	public List selectAll() {
		return sqlSessionTemplate.selectList("Type.selectAll");
	}

	@Override
	public Type select(int type_id) {
		return sqlSessionTemplate.selectOne("Type.select", type_id);
	}
	
}
