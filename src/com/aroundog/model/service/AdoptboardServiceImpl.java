package com.aroundog.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.aroundog.common.exception.AdoptboardRegistFailException;
import com.aroundog.common.exception.DeleteFailException;
import com.aroundog.common.exception.EditFailException;
import com.aroundog.common.exception.RegistFailException;
import com.aroundog.model.domain.Adoptboard;
import com.aroundog.model.domain.Adoptdog;
import com.aroundog.model.repository.AdoptboardDAO;
import com.aroundog.model.repository.AdoptdogDAO;

@Service
public class AdoptboardServiceImpl implements AdoptboardService{
	
	@Autowired
	private AdoptboardDAO adoptboardDAO;
	@Autowired
	private AdoptdogDAO adoptdogDAO;
	
	// 관리자 : 입양  게시물 한건 등록하기
	@Transactional("transactionManager")
	public void insert(Adoptboard adoptboard) throws AdoptboardRegistFailException{   //오류나면 롤백시킴 
		int result=adoptdogDAO.insert(adoptboard.getAdoptdog());  //adoptdog의 pk채워지게 됨..
		int result2=adoptboardDAO.insert(adoptboard); //board 등록
		if(result==0 || result2==0) {
			throw new AdoptboardRegistFailException("입양게시물 등록 실패");
		}
	}
	
	// 관리자: 입양 게시물 삭제
		@Transactional
		public void delete(int adoptboard_id) throws DeleteFailException{
			Adoptboard adoptboard=adoptboardDAO.select(adoptboard_id); //선택한 게시물 가져오기
			int result=adoptdogDAO.delete(adoptboard.getAdoptdog().getAdoptdog_id()); //가져온 게시물에 열결된 adoptdog 삭제
			int result2=adoptboardDAO.delete(adoptboard_id); //게시물 삭제
			if(result==0 || result2==0) {
				throw new DeleteFailException("입양게시물 삭제 실패");
			}
		}
	
	// 관리자: 입양 게시물 목록 보기
	public List selectAll() {
		return adoptboardDAO.selectAll();
	}
	
	// 관리자: 입양 게시물 1건 상세보기
	public Adoptboard select(int adoptboard_id) {
		return adoptboardDAO.select(adoptboard_id);
	}
	
	// 관리자: 입양 게시물 수정
	public void update(Adoptboard adoptboard) throws EditFailException{
		int result=adoptboardDAO.update(adoptboard);
		if(result==0) {
			throw new EditFailException("입양게시물 수정 실패");
		}
	}
	
	
}