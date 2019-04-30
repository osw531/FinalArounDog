package com.aroundog.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aroundog.common.exception.AdoptRegistFailException;
import com.aroundog.model.domain.Adopt;
import com.aroundog.model.repository.AdoptDAO;

@Service
public class AdoptServiceImpl implements AdoptService{
	
	@Autowired 
	@Qualifier("mybatisAdoptDAO")
	private AdoptDAO adoptDAO;

	// 유저 : 입양 신청 한건 등록하기
	public void insert(Adopt adopt) throws AdoptRegistFailException{
		int result= adoptDAO.insert(adopt);
		if(result==0) {
			throw new AdoptRegistFailException("입양신청 양식이 보내지지 않았습니다");
		}
	}
	
	// 관리자: 입양요청 게시글 목록 보기
	public List selectAll() {
		return adoptDAO.selectAll();
	}
	
	// 관리자: 입양요청 게시글 1건 상세보기
	public Adopt select(int adopt_id) {
		return adoptDAO.select(adopt_id);
	}
	
	// 관리자: 입양요청 게시글 수정 & 확인완료
	public void update(Adopt adopt) throws AdoptRegistFailException{
		int result= adoptDAO.update(adopt);
		if(result==0) {
			throw new AdoptRegistFailException("수정에 실패하였습니다");
		}
	}
}