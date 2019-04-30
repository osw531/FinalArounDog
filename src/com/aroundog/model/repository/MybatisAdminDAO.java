
package com.aroundog.model.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.aroundog.model.domain.Admin;

@Repository
public class MybatisAdminDAO implements AdminDAO{
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	//로그인 체크
	public Admin loginCheck(Admin admin) {
		Admin obj=sqlSessionTemplate.selectOne("Admin.login", admin);
		return obj;
	}

}
