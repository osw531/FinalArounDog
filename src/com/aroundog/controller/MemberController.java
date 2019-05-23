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
   
   //================������ ����===================
   //��� ��Ϻ���
   /*
    * @RequestMapping(value="/admin/member/list", method=RequestMethod.GET) public
    * ModelAndView showMemberList() { System.out.println("/admin/member/list");
    * List memberList=memberService.selectAll(); ModelAndView mav=new
    * ModelAndView(); mav.setViewName("admin/member/index");
    * //admin/member/index.jsp mav.addObject("memberList", memberList); return mav;
    * }
    */
   
   //��� �� ����
   @RequestMapping(value="/admin/member/detail", method=RequestMethod.GET)
   public ModelAndView detail(int member_id) {
      System.out.println("�Ѱ��� member_id "+member_id);
      Member member=memberService.select(member_id);
      ModelAndView mav=new ModelAndView();
      mav.setViewName("admin/member/detail");
      mav.addObject("member", member);
      return mav;
   }      
   //��� ����
   @RequestMapping(value="/admin/member/edit", method=RequestMethod.POST)
   public ModelAndView edit(Member member) {
      memberService.update(member);
      ModelAndView mav=new ModelAndView();
      mav.setViewName("admin/member/detail");
      mav.addObject("member", member);
      return mav;
   }
   //��� ����
   @RequestMapping(value="/admin/member/delete", method=RequestMethod.GET)
   public String del(int member_id) {
      memberService.delete(member_id);
      return "redirect:/admin/memberList";
   }
   
   //================���� ����===================
   //��� ����
   @RequestMapping(value="/user/member/regist", method=RequestMethod.POST)
   public String regist(Member member) {
      memberService.insert(member);
      return "user/login/login"; //ȸ�� ���� �Ϸ� �������� ���� �ϴ°� ���??.jsp..�񵿱�..
   }
    //�ߺ����� Ȯ��
   @RequestMapping(value="/user/member/idCheck", method=RequestMethod.GET)
   @ResponseBody
   public String idCheck(String id) {
      Member member=memberService.idCheck(id);
      if(id.equals("")) {
         return "{\"msg\":\"���̵� �Է����ּ���.\",\"result\":2} "; 
      }else {
         if(member!=null) {
                return "{\"msg\":\"�ߺ��� ���̵��Դϴ�.\",\"result\":0} "; 
             }else {
                return "{\"msg\":\"��밡���� ���̵��Դϴ�.\",\"result\":1} "; 
             }
      }
   }
      
   //��� �α��� ��û
   @RequestMapping(value="/user/member/login", method=RequestMethod.POST)
   public String Login(Member member, HttpServletRequest request) {
      Member obj=memberService.loginCheck(member);
      request.getSession().setAttribute("member", obj); //obj�� �α��� ������ member�̴�.
      return "redirect:/";
   }
   
   //��� �α׾ƿ� ��û
   @RequestMapping(value="/user/member/logout", method=RequestMethod.GET)
   public String Logout() {
      return "redirect:/user/logoutPage";
   }
   //��� ���������� ��û
   @RequestMapping(value="/user/member/mypage", method=RequestMethod.GET)
   public ModelAndView mypage(HttpServletRequest request) {
      Member member=(Member)request.getSession().getAttribute("member");
      ModelAndView mav=new ModelAndView();
      mav.setViewName("user/member/mypage");
      mav.addObject("member", member);
      return mav;
   }
   //��� ����
  @RequestMapping(value="/user/member/edit", method=RequestMethod.POST)
  public String editMember(Member member,HttpServletRequest request) {
     memberService.updateUser(member);
     Member editMember=memberService.select(member.getMember_id());
     request.getSession().setAttribute("member", editMember);
     return "redirect:/user/member/mypage";
  }
      //��� ����
      @RequestMapping(value="/user/member/delete", method=RequestMethod.GET)
      public String delMember(int member_id,HttpServletRequest request) {
         request.getSession().invalidate();
         memberService.delete(member_id);
         return "redirect:/";
      }
   
   // ��� : �α��� jsp �������� �̵��ϱ�
   @RequestMapping(value="/user/loginPage", method=RequestMethod.GET)
   public String goLoginPage() {
      return "user/login/login";
   }
   
   // ��� : ȸ������ jsp �������� �̵��ϱ�
     @RequestMapping(value="/user/registPage", method=RequestMethod.GET)
     public String goRegistPage() {
        return "user/member/regist";
     }
   
     // ��� : �α׾ƿ� jsp �������� �̵��ϱ�
     @RequestMapping(value="/user/logoutPage", method=RequestMethod.GET)
     public String goLogoutPage() {
        return "user/login/logout";
     }
     
   
   
   //================����ó��===================
   @ExceptionHandler(UserNotFoundException.class)
   public ModelAndView handleException(UserNotFoundException e) {
      ModelAndView mav=new ModelAndView();
      mav.addObject("err", e);
      System.out.println("UserNotFoundException�߻�!!");
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