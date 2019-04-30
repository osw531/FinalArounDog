package com.aroundog.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.aroundog.commons.Pager;
import com.aroundog.model.domain.FreeBoard;
import com.aroundog.model.domain.FreeComment;
import com.aroundog.model.domain.Member;
import com.aroundog.model.service.FreeBoardService;
import com.aroundog.model.service.FreeCommentService;
import com.aroundog.model.service.MemberService;

@Controller
public class FreeBoardController {

	@Autowired
	private FreeBoardService freeBoardService;
	@Autowired
	private FreeCommentService freeCommentService;
	@Autowired
	private MemberService memberService;
	private Pager pager=new Pager();
	
	
	//자유게시판 페이지 가져오기
	@RequestMapping(value="/user/freeboards",method=RequestMethod.GET)
	public ModelAndView freeBoardChangePage(@RequestParam(value="currentPage", defaultValue="1" , required=false) int currentPage,HttpServletRequest request) {	
		ModelAndView mav = new ModelAndView("user/freeboard/freeboard");
		List freeboardList=freeBoardService.selectAll();
		List fcList=freeCommentService.selectAll();
		pager.init(request, freeboardList.size());
		
		for(int i=0;i<freeboardList.size();i++) {
			FreeBoard freeBoard=(FreeBoard)freeboardList.get(i);
			int member_id=freeBoard.getMember_id();
			Member member=memberService.select(member_id);
			freeBoard.setMember(member);
		}
		
		mav.addObject("freeBoardList", freeboardList);
		mav.addObject("fcList", fcList);
		mav.addObject("pager", pager);
		return mav;
	}
	

	//자유게시판에서 글등록으로 화면 전환
	@RequestMapping(value="/freeboard/insert", method=RequestMethod.GET)
	public String insert() {		
		return "user/freeboard/regist";
	}
	
	//자유게시판 상세정보 보기  트랜잭션 처리 필요
	@RequestMapping(value="/user/freeboard/detail/{freeboard_id}", method=RequestMethod.GET)
	public ModelAndView detail(@PathVariable("freeboard_id") int freeboard_id) {
		List fcList = new ArrayList();
		freeBoardService.updateHitCnt(freeboard_id);//히트카운터 올리기
		FreeBoard freeboard=freeBoardService.select(freeboard_id);
		//보드에 멤버 담기
		int member_id=freeboard.getMember_id();
		Member member=memberService.select(member_id);
		freeboard.setMember(member);
		
		List allfcList=freeCommentService.selectAll();
		
		//내 보드에 댓글 골라내기 위하여
		for(int i=0;i<allfcList.size();i++) {
			FreeComment freeComment=(FreeComment)allfcList.get(i);
			if(freeComment.getFreeboard_id()==freeboard_id) {
				member_id=freeComment.getMember_id();
				member=memberService.select(member_id);
				freeComment.setMember(member);
				fcList.add(freeComment);
			}
		}	
		ModelAndView mav = new ModelAndView("user/freeboard/detail");
		mav.addObject("freeboard", freeboard);
		mav.addObject("fcList", fcList);
		return mav;
	}
	
	
	//자유게시판 상세에서 댓글 등록 후 다시 상세창으로  트랜잭션 처리 필요
	@RequestMapping(value="/user/freeboard/detail/regist/{freeboard_id}", method=RequestMethod.GET)
	public ModelAndView registAndDetail(@PathVariable("freeboard_id") int freeboard_id) {
		List fcList = new ArrayList();
		FreeBoard freeboard=freeBoardService.select(freeboard_id);
		//보드에 멤버 담기
		int member_id=freeboard.getMember_id();
		Member member=memberService.select(member_id);
		freeboard.setMember(member);
		
		List allfcList=freeCommentService.selectAll();
		
		//내 보드에 댓글 골라내기 위하여
		for(int i=0;i<allfcList.size();i++) {
			FreeComment freeComment=(FreeComment)allfcList.get(i);
			if(freeComment.getFreeboard_id()==freeboard_id) {
				member_id=freeComment.getMember_id();
				member=memberService.select(member_id);
				freeComment.setMember(member);
				fcList.add(freeComment);
			}
		}	
		ModelAndView mav = new ModelAndView("user/freeboard/detail");
		mav.addObject("freeboard", freeboard);
		mav.addObject("fcList", fcList);
		return mav;
	}
	
	//자유게시판 등록하기~
	@RequestMapping(value="/user/freeboard/regist", method=RequestMethod.POST)
	public String freeBoardRegist(FreeBoard freeboard) {
		freeBoardService.insert(freeboard);
		return "redirect:/user/freeboards";//리스트로 이동
	}
	
	//자유게시판 한건 삭제하기 밑에 댓글도 자 지워야함~(캐스캐이드로 한방에 지울수 있지만 지금은 포린키를 연결 안해놔서 하나하나 다해줘야함)
	//나중에 연결하면 프리보드매퍼에서 sql cascade로 수정하면 됨
	@RequestMapping(value="/user/freeboard/del/{freeboard_id}", method=RequestMethod.GET)
	public String freeBoardDel(@PathVariable("freeboard_id") int freeboard_id) {
		freeBoardService.delete(freeboard_id); //자유게시판 한건삭제
		freeCommentService.deleteByFreeboardId(freeboard_id); //자유게시판 밑에 댓글 삭제
		return "redirect:/user/freeboards";//리스트로 이동
	}
	
	//한건 수정하기 위해 edit.jsp로 프리보드 담아서 이동
	@RequestMapping(value="/user/freeboard/edit/{freeboard_id}", method=RequestMethod.GET)
	public ModelAndView freeBoardEditPage(@PathVariable("freeboard_id") int freeboard_id) {
		ModelAndView mav = new ModelAndView("user/freeboard/edit");
		FreeBoard freeboard=freeBoardService.select(freeboard_id);
		int member_id=freeboard.getMember_id();
		Member member=memberService.select(member_id);
		freeboard.setMember(member);
		mav.addObject("freeboard", freeboard);
		return mav;//리스트로 이동
	}
	//수정하기
	@RequestMapping(value="/user/freeboard/edit", method=RequestMethod.POST)
	public String freeBoardEdit(FreeBoard freeboard) {
		int freeboard_id=freeboard.getFreeboard_id();
		freeBoardService.update(freeboard);
		return "redirect:/user/freeboard/detail/regist/"+freeboard_id;//리스트로 이동
	}
	
	//검색하기
	@RequestMapping(value="/user/freeboard/search", method=RequestMethod.GET)
	public ModelAndView freeBoardSearch(String category,String searchword,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("user/freeboard/freeboard");
		System.out.println("서치 들어오니??");
		List searchList=null;
		List fcList=freeCommentService.selectAll();
		if(category.equals("writer")) {
			searchList=freeBoardService.selectByWriter(searchword);
		}else {		
			searchList=freeBoardService.selectByTitle(searchword);
		}
		pager.init(request, searchList.size());
		for(int i=0;i<searchList.size();i++) {
			FreeBoard freeBoard=(FreeBoard)searchList.get(i);
			int member_id=freeBoard.getMember_id();
			Member member=memberService.select(member_id);
			freeBoard.setMember(member);
		}
		mav.addObject("freeBoardList", searchList);
		mav.addObject("fcList", fcList);
		mav.addObject("pager", pager);
		
		return mav;
	}

	 
	
}
