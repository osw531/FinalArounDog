package com.aroundog.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aroundog.common.exception.LoginFailException;
import com.aroundog.model.domain.Admin;
import com.aroundog.model.repository.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	@Qualifier("mybatisAdminDAO")
	private AdminDAO adminDAO;

	public Admin loginCheck(Admin admin) throws LoginFailException{
       Admin obj=adminDAO.loginCheck(admin);
       if(obj==null) {
          throw new LoginFailException("아이디와 비밀번호를 확인해주세요");
       }
       return obj;
    }

}
