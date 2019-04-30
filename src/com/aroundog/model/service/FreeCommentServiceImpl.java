package com.aroundog.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aroundog.common.exception.DeleteFailException;
import com.aroundog.common.exception.EditFailException;
import com.aroundog.model.domain.FreeComment;
import com.aroundog.model.repository.FreeCommentDAO;
@Service
public class FreeCommentServiceImpl implements FreeCommentService{
	@Autowired
	private FreeCommentDAO freeCommentDAO;
	
	
	public List selectAll() {
		List fcList=freeCommentDAO.selectAll();
		return fcList;
	}

	@Override
	public void delete(int freecomment_id) {
		// TODO Auto-generated method stub
		
	}

	public void insert(FreeComment freeComment) throws EditFailException{
		int result=freeCommentDAO.insert(freeComment);
		if(result==0) {
			throw new EditFailException("댓글 등록 실패");
		}
	}

	@Override
	public void update(FreeComment freeComment) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public FreeComment select(int freecomment_id) {
		// TODO Auto-generated method stub
		return null;
	}

	public void commentAdd(FreeComment freeComment) {
		int result=freeCommentDAO.commentAdd(freeComment);
		if(result==0) {
			throw new EditFailException("댓글의 댓글 등록 실패");
		}
	}

	public void deleteByFreeboardId(int freeboard_id) throws DeleteFailException{
		int result=freeCommentDAO.deleteByFreeboardId(freeboard_id);
		if(result==0) {
			throw new DeleteFailException("deleteByFreeboardId 삭제  실패");
		}
	}

	public void deleteByTeam(int team) {
		int result=freeCommentDAO.deleteByTeam(team);
		if(result==0) {
			throw new DeleteFailException("deleteByTeam 삭제  실패");
		}	
	}

	public void deleteByCommentId(int freecomment_id) {
		int result=freeCommentDAO.deleteByCommentId(freecomment_id);
		if(result==0) {
			throw new DeleteFailException("deleteByCommentId 삭제  실패");
		}
	}


}
