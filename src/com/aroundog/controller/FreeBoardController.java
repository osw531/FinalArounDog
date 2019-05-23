package com.aroundog.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aroundog.common.exception.EditFailException;
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
	
	
	//�����Խ��� ������ ��������
	@Transactional("transactionManager")
	@RequestMapping(value="/user/freeboards",method=RequestMethod.GET)
	public ModelAndView freeBoardChangePage(@RequestParam(value="currentPage", defaultValue="1" , required=false) int currentPage,HttpServletRequest request) {	
		ModelAndView mav = new ModelAndView("user/freeboard/freeboard");
		System.out.println("cur : "+currentPage);
		System.out.println("req : "+request.getParameter("currentPage"));
		List freeboardList=freeBoardService.selectAll();
		List fcList=freeCommentService.selectAll();
		pager.init(request, freeboardList.size());
		pager.setCurrentPage(currentPage);
		System.out.println(pager.getCurrentPage());
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
	

	//�����Խ��ǿ��� �۵������ ȭ�� ��ȯ
	@RequestMapping(value="/freeboard/insert", method=RequestMethod.GET)
	public String insert(HttpServletRequest request) {		
		return "user/freeboard/regist";
	}
	
	//�����Խ��� ������ ����  Ʈ����� ó�� �ʿ�
	@Transactional("transactionManager")
	@RequestMapping(value="/user/freeboard/detail/{freeboard_id}", method=RequestMethod.GET)
	public ModelAndView detail(@PathVariable("freeboard_id") int freeboard_id) {
		List fcList = new ArrayList();
		freeBoardService.updateHitCnt(freeboard_id);//��Ʈī���� �ø���
		FreeBoard freeboard=freeBoardService.select(freeboard_id);
		List freeboardList=freeBoardService.selectAll();
		//���忡 ��� ���
		int member_id=freeboard.getMember_id();
		Member member=memberService.select(member_id);
		freeboard.setMember(member);
		
		List allfcList=freeCommentService.selectAll();
		
		//�� ���忡 ��� ��󳻱� ���Ͽ�
		for(int i=0;i<allfcList.size();i++) {
			FreeComment freeComment=(FreeComment)allfcList.get(i);
			if(freeComment.getFreeboard_id()==freeboard_id) {
				member_id=freeComment.getMember_id();
				member=memberService.select(member_id);
				freeComment.setMember(member);
				fcList.add(freeComment);
			}
		}	
		
		for(int i=0;i<freeboardList.size();i++) {
			FreeBoard freeBoard=(FreeBoard)freeboardList.get(i);
			int member_id2=freeBoard.getMember_id();
			Member member2=memberService.select(member_id2);
			freeBoard.setMember(member2);
		}
		ModelAndView mav = new ModelAndView("user/freeboard/detail");
		mav.addObject("freeboard", freeboard);
		mav.addObject("fcList", fcList);
		mav.addObject("freeboardList", freeboardList);
		return mav;
	}	
	
	//�����Խ��� �󼼿��� ��� ��� �� �ٽ� ��â����  Ʈ����� ó�� �ʿ�
	@Transactional("transactionManager")
	@RequestMapping(value="/user/freeboard/detail/regist/{freeboard_id}", method=RequestMethod.GET)
	@ResponseBody
	public ModelAndView registAndDetail(@PathVariable("freeboard_id") int freeboard_id) {
		List fcList = new ArrayList();
		System.out.println("freeID : "+freeboard_id);
		FreeBoard freeboard=freeBoardService.select(freeboard_id);
		System.out.println("board : "+freeboard);
		//���忡 ��� ���
		int member_id=freeboard.getMember_id();
		System.out.println("memeberr_id : "+member_id);
		
		Member member=memberService.select(member_id);
		
		System.out.println("member : "+ member);
		freeboard.setMember(member);
		List freeboardList=freeBoardService.selectAll();
		List allfcList=freeCommentService.selectAll();
		
		System.out.println("freeboardList : "+freeboardList);
		System.out.println("allfcList : "+allfcList);
		//�� ���忡 ��� ��󳻱� ���Ͽ�
		for(int i=0;i<allfcList.size();i++) {
			FreeComment freeComment=(FreeComment)allfcList.get(i);
			if(freeComment.getFreeboard_id()==freeboard_id) {
				System.out.println("�ø���Ʈ ����");
				member_id=freeComment.getMember_id();
				member=memberService.select(member_id);
				freeComment.setMember(member);
				fcList.add(freeComment);
				System.out.println("fcList : "+fcList);
				
			}
		}	
		System.out.println("fcList.size : "+fcList.size());
		System.out.println("freeboard.size : "+freeboard);
		//int freeboard_id=freeboard.getFreeboard_id()
		System.out.println("freeboardList.size : "+freeboardList.size());
		ModelAndView mav = new ModelAndView("/user/freeboard/detail/"+freeboard_id);
		mav.addObject("freeboard", freeboard);
		mav.addObject("fcList", fcList);
		mav.addObject("freeboardList", freeboardList);
		return mav;
	}
	
	//�����Խ��� ����ϱ�~
	@RequestMapping(value="/user/freeboard/regist", method=RequestMethod.POST)
	public String freeBoardRegist(FreeBoard freeboard) {
		freeBoardService.insert(freeboard);
		return "redirect:/user/freeboards?currentPage=1";//����Ʈ�� �̵�
	}
	
	//�����Խ��� �Ѱ� �����ϱ� �ؿ� ��۵� �� ��������~(ĳ��ĳ�̵�� �ѹ濡 ����� ������ ������ ����Ű�� ���� ���س��� �ϳ��ϳ� ���������)
	//���߿� �����ϸ� ����������ۿ��� sql cascade�� �����ϸ� ��
	@Transactional("transactionManager")
	@RequestMapping(value="/user/freeboard/del/{freeboard_id}", method=RequestMethod.GET)
	public String freeBoardDel(@PathVariable("freeboard_id") int freeboard_id) {
		freeBoardService.delete(freeboard_id); //�����Խ��� �Ѱǻ���
		
		List commentList=freeCommentService.select(freeboard_id);
		if(commentList.size()==0) {		
		}else {
			freeCommentService.deleteByFreeboardId(freeboard_id);
		}

		return "redirect:/user/freeboards";//����Ʈ�� �̵�
	}
	
	//�Ѱ� �����ϱ� ���� edit.jsp�� �������� ��Ƽ� �̵�
	@Transactional("transactionManager")
	@RequestMapping(value="/user/freeboard/edit/{freeboard_id}", method=RequestMethod.GET)
	public ModelAndView freeBoardEditPage(@PathVariable("freeboard_id") int freeboard_id) {
		ModelAndView mav = new ModelAndView("user/freeboard/edit");
		FreeBoard freeboard=freeBoardService.select(freeboard_id);
		int member_id=freeboard.getMember_id();
		Member member=memberService.select(member_id);
		freeboard.setMember(member);
		mav.addObject("freeboard", freeboard);
		return mav;//����Ʈ�� �̵�
	}
	//�����ϱ�
	@RequestMapping(value="/user/freeboard/edit", method=RequestMethod.POST)
	public String freeBoardEdit(FreeBoard freeboard) {
		int freeboard_id=freeboard.getFreeboard_id();
		freeBoardService.update(freeboard);
		return "redirect:/user/freeboard/detail/"+freeboard_id;//����Ʈ�� �̵�
	}
	
	//�˻��ϱ�(����)
	@Transactional("transactionManager")
	@RequestMapping(value="/user/freeboard/searchTitle", method=RequestMethod.GET)
	public ModelAndView freeBoardSearchTitle(String category,String searchword,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		System.out.println(searchword);
		List searchList=null;


		searchList=freeBoardService.selectByTitle(searchword);
		if(searchList.size()==0) {
			mav.setViewName("user/error/searchError");
			return mav;
		}else {
			mav.setViewName("user/freeboard/freeboard");
			List fcList=freeCommentService.selectAll();
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
	@RequestMapping(value="/freeboard/goLoginError", method=RequestMethod.GET)
	public String goLoginError() {
		return "user/error/loginError";//����Ʈ�� �̵�
	}
	
	//�˻��ϱ�(�ۼ���)
	@Transactional("transactionManager")
	@RequestMapping(value="/user/freeboard/searchWriter", method=RequestMethod.GET)
	public ModelAndView freeBoardSearchWriter(String category,String searchword,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		Member member=null;
		member=memberService.selectByName(searchword);
		List searchList=null;
		if(member==null) {
			mav.setViewName("user/error/searchError");
			return mav;
		}else {
			int member_id=member.getMember_id();
			searchList=freeBoardService.selectByWriter(member_id);
			mav.setViewName("user/freeboard/freeboard");
			List fcList=freeCommentService.selectAll();
			pager.init(request, searchList.size());
			for(int i=0;i<searchList.size();i++) {
				FreeBoard freeBoard=(FreeBoard)searchList.get(i);
				member_id=freeBoard.getMember_id();
				member=memberService.select(member_id);
				freeBoard.setMember(member);
			}
			mav.addObject("freeBoardList", searchList);
			mav.addObject("fcList", fcList);
			mav.addObject("pager", pager);
			
			return mav;
			
		}
	}

	@ExceptionHandler(EditFailException.class)
	public ModelAndView freeBoardEditFail(EditFailException e) {
		ModelAndView mav= new ModelAndView("user/error/lostError");
		mav.addObject("err", e.getMessage());
		return mav;
	}
	 
	
}
