package com.aroundog.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aroundog.common.exception.DeleteFailException;
import com.aroundog.common.exception.EditFailException;
import com.aroundog.common.exception.RegistFailException;
import com.aroundog.model.domain.FreeBoard;
import com.aroundog.model.repository.FreeBoardDAO;
@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	@Autowired
	private FreeBoardDAO freeBoardDAO;
	
	//모든 자유게시판 가져오기
	public List selectAll() {
		List freeBoardList=freeBoardDAO.selectAll();
		return freeBoardList;
	}
	
	public void delete(int freeboard_id) throws EditFailException{
		int result=freeBoardDAO.delete(freeboard_id);
		if (result == 0) {
	         throw new EditFailException("삭제 실패!!");
	    }	
	}

	public void insert(FreeBoard freeboard) throws EditFailException{
		int result=freeBoardDAO.insert(freeboard);
		if (result == 0) {
	         throw new EditFailException("등록 실패!!");
	    }	
	}

	public void update(FreeBoard freeboard) throws EditFailException{
		int result=freeBoardDAO.update(freeboard);
		if (result == 0) {
	         throw new EditFailException("자유게시판 수정 실패!!");
	    }
		
	}

	public FreeBoard select(int freeboard_id) {
		FreeBoard freeboard=freeBoardDAO.select(freeboard_id);
		return freeboard;
	}

	public void updateHitCnt(int freeboard_id) throws EditFailException{
		int result=freeBoardDAO.updateHitCnt(freeboard_id);
		if (result == 0) {
	         throw new EditFailException("히트 카운트 업데이트 실패!!");
	    }	
	}

	public List selectByWriter(int member_id) {
		List searchList=freeBoardDAO.selectByWriter(member_id);
		return searchList;
	}

	public List selectByTitle(String searchword) {	
		List searchList=freeBoardDAO.selectByTitle(searchword);
		return searchList;
	}

}
