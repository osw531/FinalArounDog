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
	public List select(int freeboard_id) {
		List freeList=freeCommentDAO.select(freeboard_id);
		return freeList;
	}

	public void commentAdd(FreeComment freeComment) throws EditFailException{
		int result=freeCommentDAO.commentAdd(freeComment);
		if(result==0) {
			throw new EditFailException("댓글의 댓글 등록 실패");
		}
	}

	public void deleteByFreeboardId(int freeboard_id) throws EditFailException{
		int result=freeCommentDAO.deleteByFreeboardId(freeboard_id);
		if(result==0) {
			throw new EditFailException("deleteByFreeboardId 삭제  실패");
		}
	}

	public void deleteByTeam(FreeComment freeComment) throws EditFailException{
		int result=freeCommentDAO.deleteByTeam(freeComment);
		System.out.println("result : "+result);
		
		if(result==0) {
			throw new EditFailException("deleteByTeam 삭제  실패");
		}	
	}

	public void deleteByCommentId(int freecomment_id)  throws EditFailException{
		int result=freeCommentDAO.deleteByCommentId(freecomment_id);
		if(result==0) {
			throw new EditFailException("deleteByCommentId 삭제  실패");
		}
	}

	@Override
	public void insertFirst(FreeComment freeComment) throws EditFailException{
		int result=freeCommentDAO.insertFirst(freeComment);
		if(result==0) {
			throw new EditFailException("deleteByCommentId 삭제  실패");
		}
		
	}


}
