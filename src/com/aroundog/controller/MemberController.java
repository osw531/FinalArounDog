package com.aroundog.controller;


import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aroundog.common.exception.DeleteFailException;
import com.aroundog.common.exception.EditFailException;
import com.aroundog.common.exception.LoginFailException;
import com.aroundog.common.exception.RegistFailException;
import com.aroundog.common.exception.UserNotFoundException;
import com.aroundog.model.domain.Member;
import com.aroundog.model.service.MemberService;

@Controller
public class MemberController {
   @Autowired
   private MemberService memberService;
   
   //================관리자 영역===================
   //멤버 목록보기
   /*
    * @RequestMapping(value="/admin/member/list", method=RequestMethod.GET) public
    * ModelAndView showMemberList() { System.out.println("/admin/member/list");
    * List memberList=memberService.selectAll(); ModelAndView mav=new
    * ModelAndView(); mav.setViewName("admin/member/index");
    * //admin/member/index.jsp mav.addObject("memberList", memberList); return mav;
    * }
    */
   
   //멤버 상세 보기
   @RequestMapping(value="/admin/member/detail", method=RequestMethod.GET)
   public ModelAndView detail(int member_id) {
      System.out.println("넘겨준 member_id "+member_id);
      Member member=memberService.select(member_id);
      ModelAndView mav=new ModelAndView();
      mav.setViewName("admin/member/detail");
      mav.addObject("member", member);
      return mav;
   }      
   //멤버 수정
   @RequestMapping(value="/admin/member/edit", method=RequestMethod.POST)
   public ModelAndView edit(Member member) {
      memberService.update(member);
      ModelAndView mav=new ModelAndView();
      mav.setViewName("admin/member/detail");
      mav.addObject("member", member);
      return mav;
   }
   //멤버 삭제
   @RequestMapping(value="/admin/member/delete", method=RequestMethod.GET)
   public String del(int member_id) {
      memberService.delete(member_id);
      return "redirect:/admin/memberList";
   }
   
   //================유저 영역===================
   //멤버 가입
   @RequestMapping(value="/user/member/regist", method=RequestMethod.POST)
   public String regist(Member member) {
      memberService.insert(member);
      return "user/login/login"; //회원 가입 완료 페이지로 가게 하는건 어떨까??.jsp..비동기..
   }
    //중복가입 확인
   @RequestMapping(value="/user/member/idCheck", method=RequestMethod.GET)
   @ResponseBody
   public String idCheck(String id) {
      Member member=memberService.idCheck(id);
      if(id.equals("")) {
         return "{\"msg\":\"아이디를 입력해주세요.\",\"result\":2} "; 
      }else {
         if(member!=null) {
                return "{\"msg\":\"중복된 아이디입니다.\",\"result\":0} "; 
             }else {
                return "{\"msg\":\"사용가능한 아이디입니다.\",\"result\":1} "; 
             }
      }
   }
      
   //멤버 로그인 요청
   @RequestMapping(value="/user/member/login", method=RequestMethod.POST)
   public String Login(Member member, HttpServletRequest request) {
      Member obj=memberService.loginCheck(member);
      request.getSession().setAttribute("member", obj); //obj가 로그인 성공한 member이다.
      return "redirect:/";
   }
   
   //멤버 로그아웃 요청
   @RequestMapping(value="/user/member/logout", method=RequestMethod.GET)
   public String Logout() {
      return "redirect:/user/logoutPage";
   }
   //멤버 마이페이지 요청
   @RequestMapping(value="/user/member/mypage", method=RequestMethod.GET)
   public ModelAndView mypage(HttpServletRequest request) {
      Member member=(Member)request.getSession().getAttribute("member");
      ModelAndView mav=new ModelAndView();
      mav.setViewName("user/member/mypage");
      mav.addObject("member", member);
      return mav;
   }
   //멤버 수정
  @RequestMapping(value="/user/member/edit", method=RequestMethod.POST)
  public String editMember(Member member,HttpServletRequest request) {
     memberService.updateUser(member);
     Member editMember=memberService.select(member.getMember_id());
     request.getSession().setAttribute("member", editMember);
     return "redirect:/user/member/mypage";
  }
      //멤버 삭제
      @RequestMapping(value="/user/member/delete", method=RequestMethod.GET)
      public String delMember(int member_id,HttpServletRequest request) {
         request.getSession().invalidate();
         memberService.delete(member_id);
         return "redirect:/";
      }
   
   // 멤버 : 로그인 jsp 페이지로 이동하기
   @RequestMapping(value="/user/loginPage", method=RequestMethod.GET)
   public String goLoginPage() {
      return "user/login/login";
   }
   
   // 멤버 : 회원가입 jsp 페이지로 이동하기
     @RequestMapping(value="/user/registPage", method=RequestMethod.GET)
     public String goRegistPage() {
        return "user/member/regist";
     }
   
     // 멤버 : 로그아웃 jsp 페이지로 이동하기
     @RequestMapping(value="/user/logoutPage", method=RequestMethod.GET)
     public String goLogoutPage() {
        return "user/login/logout";
     }
     
   
   
   //================예외처리===================
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
   @ExceptionHandler(LoginFailException.class)
   public ModelAndView loginException(LoginFailException e) {
      ModelAndView mav=new ModelAndView("user/error/lostError");
      mav.addObject("err", e);
      return mav;
   }
}