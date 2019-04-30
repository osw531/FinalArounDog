package com.aroundog.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.aroundog.common.exception.DeleteFailException;
import com.aroundog.model.repository.LostCommentsDAO;

@Service
public class LostCommentsServiceImpl implements LostCommentsService{
	
	@Autowired
	private LostCommentsDAO dao;
	
	public List select(int lostboard_id) {
		return dao.select(lostboard_id);
	}
	
	public void delete(int lostboard_id) throws DeleteFailException{
		int result= dao.delete(lostboard_id);
		if(result==0) {
			throw new DeleteFailException("댓글 삭제 실패");
		}
	}
	
}
