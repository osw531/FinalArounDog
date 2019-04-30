package com.aroundog.controller;


import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.HttpServletBean;
import org.springframework.web.servlet.ModelAndView;

import com.aroundog.common.exception.DeleteFailException;
import com.aroundog.common.exception.EditFailException;
import com.aroundog.common.exception.RegistFailException;
import com.aroundog.common.exception.UserNotFoundException;
import com.aroundog.model.domain.Admin;
import com.aroundog.model.domain.Member;
import com.aroundog.model.service.AdminService;
import com.aroundog.model.service.MemberService;

@RestController
@RequestMapping("/rest")
public class RestMemberController {
	@Autowired
	private MemberService memberService;
	
	//멤버 가입
	@RequestMapping(value="/uesr/member/regist", method=RequestMethod.POST)
	public String regist(Member member) {
		memberService.insert(member);
		return "result:1"; //회원 가입 완료 페이지로 가게 하는건 어떨까??.jsp
	}
	
	//멤버 로그인 요청
	@RequestMapping(value="/user/member/login", method=RequestMethod.POST)
	public String Login(Member member, HttpServletRequest request) {
		Member obj=memberService.loginCheck(member);
		request.getSession().setAttribute("member", obj); //obj가 로그인 성공한 member이다.
		return "redirect:/user/about.jsp";
	}
	
	
	
	//멤버 목록보기================수정수정수정중...===================
	@RequestMapping(value="/member/list", method=RequestMethod.GET)
	public ModelAndView showMemberList() {
		System.out.println("/member/list호출");
		List memberList=memberService.selectAll();
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/member/index"); //admin/member/index.jsp
		mav.addObject("memberList", memberList);
		return mav; //List<Member> memberList=(List)request.getParameter("memberList");
	}
	//멤버 상세 보기
	@RequestMapping(value="/admin/member/detail", method=RequestMethod.GET)
	public ModelAndView detail(int member_id) {
		System.out.println("/admin/member/detail");
		System.out.println("list에서 넘겨받은 member_id:"+member_id);
		Member member=memberService.select(member_id);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/member/detail");
		mav.addObject("member", member);
		return mav; //Member member=request.getParameter("member");
	}		
	//멤버 수정
	@RequestMapping(value="/admin/member/edit", method=RequestMethod.POST)
	public ModelAndView edit(Member member) {
		System.out.println("/admin/member/editt호출");
		memberService.update(member);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/member/detail");
		mav.addObject("member", member);
		return mav;
	}
	//멤버 삭제
	@RequestMapping(value="/admin/member/delete", method=RequestMethod.GET)
	public String del(int member_id) {
		System.out.println("/admin/member/delete 호출");
		memberService.delete(member_id);
		return "redirect:/member/list";
	}
	
	//예외처리
	@ExceptionHandler(UserNotFoundException.class)
	public ModelAndView handleException(UserNotFoundException e) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("err", e);
		System.out.println("UserNotFoundException발생!!");
		return mav;
	}
	@ExceptionHandler(RegistFailException.class)
	public ModelAndView registException(RegistFailException e) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("err", e);
		return mav;
	}
	@ExceptionHandler(EditFailException.class)
	public ModelAndView editException(EditFailException e) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("err", e);
		return mav;
	}
	@ExceptionHandler(DeleteFailException.class)
	public ModelAndView deleteException(DeleteFailException e) {
		ModelAndView mav=new ModelAndView();
		mav.addObject("err", e);
		return mav;
	}
}
