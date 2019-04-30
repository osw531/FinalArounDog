package com.aroundog.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aroundog.common.exception.DeleteFailException;
import com.aroundog.common.exception.RegistFailException;
import com.aroundog.model.domain.LostComment;
import com.aroundog.model.repository.LostCommentDAO;

@Service
public class LostCommentServiceImpl implements LostCommentService{

	@Autowired
	private LostCommentDAO lostCommentDAO;
	
	@Override
	public void insert(LostComment lostComment) throws RegistFailException{
		int result = lostCommentDAO.insert(lostComment);
		if(result==0){
			throw new RegistFailException("댓글 등록 실패");
		}
	}

	@Override
	public List selectAll() {
		return lostCommentDAO.selectAll();
	}

	@Override
	public void delete(int lostcomment_id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void commentAdd(LostComment lostComment) throws RegistFailException{
		int result = lostCommentDAO.commentAdd(lostComment);
		if(result==0) {
			throw new RegistFailException("댓글의 댓글 등록 실패");
		}
		
	}

	@Override
	public void deleteByLostboardId(int lostboard_id) throws DeleteFailException{
		int result = lostCommentDAO.deleteByLostboardId(lostboard_id);
		if(result==0) {
			throw new DeleteFailException("삭제 실패 byLostBoardId");
		}
		
	}

	@Override
	public void deleteByTeam(int team) throws DeleteFailException{
		int result = lostCommentDAO.deleteByTeam(team);
		if(result==0) {
			throw new DeleteFailException("삭제 실패 byTeam");
		}
	}

	@Override
	public void deleteByCommentId(int lostcomment_id) throws DeleteFailException{
		int result = lostCommentDAO.deleteByCommentId(lostcomment_id);
		if(result ==0) {
			throw new DeleteFailException("삭제 실패 by lostcomment_id");
		}
	}
}
