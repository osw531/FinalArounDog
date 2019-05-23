package com.aroundog.controller;


import java.util.ArrayList;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.aroundog.common.exception.DeleteFailException;
import com.aroundog.common.exception.LoginFailException;
import com.aroundog.commons.Pager;
import com.aroundog.model.domain.Admin;
import com.aroundog.model.domain.FreeBoard;
import com.aroundog.model.domain.FreeComment;
import com.aroundog.model.domain.Mail;
import com.aroundog.model.domain.Member;
import com.aroundog.model.domain.Notice;
import com.aroundog.model.domain.Report;
import com.aroundog.model.domain.ReportImg;
import com.aroundog.model.service.AdminService;
import com.aroundog.model.service.AdoptService;
import com.aroundog.model.service.AdoptboardService;
import com.aroundog.model.service.FreeBoardService;
import com.aroundog.model.service.FreeCommentService;
import com.aroundog.model.service.MemberService;
import com.aroundog.model.service.NoticeService;
import com.aroundog.model.service.ReportService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;
	@Autowired
	private FreeBoardService freeBoardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ReportService reportService;
	@Autowired
	private AdoptboardService adoptboardService;
	@Autowired
    private AdoptService adoptService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private FreeCommentService freeCommentService;
	@Autowired
	private JavaMailSenderImpl mailSender;
	private Pager pager=new Pager();
	

	//userservice-->사용
	//관리자 로그인 페이지 이동
	@RequestMapping(value="/admin/page", method=RequestMethod.GET)
	public String adminLoginPage(Admin admin, HttpServletRequest request) {
		return "admin/login/index";
	}
	
	
	//관리자 로그인 요청
	@RequestMapping(value="/admin/login", method=RequestMethod.GET)
	public String adminLogin(Admin admin, HttpServletRequest request) {
		Admin obj=adminService.loginCheck(admin);
		request.getSession().setAttribute("admin", obj);
		return "redirect:/admin/main";
	}
	
	//관리자 로그인 성공시 이동
	@RequestMapping(value="/admin/main", method=RequestMethod.GET)
	public String goMain(HttpServletRequest request) {
		//로그인 성공시 바로 회원페이지 가져오기위해 DB에서 회원 정보 긁어와야함
		List freeBoardList=freeBoardService.selectAll();
		//System.out.println(freeBoardList);
		request.setAttribute("freeBoardList", freeBoardList);
		return "admin/main/main";
	}
	
	//------------------------지영이 파트------------------------------------------------------------
	//member 관련 ---------------------------------------------#  
    //페이지 가져오기
    @RequestMapping(value="/admin/memberList",method=RequestMethod.GET)
    public ModelAndView memberChangePage(@RequestParam(value="currentPage", defaultValue="1" , required=false) int currentPage,HttpServletRequest request) {
       ModelAndView mav = new ModelAndView("admin/member/index");
       List memberList= memberService.selectAll();
       pager.init(request, memberList.size());
       mav.addObject("memberList", memberList);
       mav.addObject("pager", pager);   
       return mav;
    }
    
    //adoptboard 관련 ---------------------------------------------#
    //페이지 가져오기
    @RequestMapping(value="/admin/adoptboardList",method=RequestMethod.GET)
    public ModelAndView adoptboardChangePage(@RequestParam(value="currentPage", defaultValue="1" , required=false) int currentPage,HttpServletRequest request) {   
      System.out.println("1111111111");
      	ModelAndView mav = new ModelAndView("admin/adoptmanager/index");
       List adoptboardList= adoptboardService.selectAll();
       System.out.println("2222222222");
       pager.init(request, adoptboardList.size());
       mav.addObject("adoptboardList", adoptboardList);
       System.out.println("333333");
       mav.addObject("pager", pager);
       System.out.println("4444444444");
       return mav;
    }
	//---------------------------member, adoptboard 지영이 파트 끝--------------------------------------------------------	 
	//Report 관련 -----세원이 파트----------------------------------------#   
	   
	//report 제보글 게시판 보기
	   @RequestMapping(value="/reports",method=RequestMethod.GET)
	   public ModelAndView reportList(HttpServletRequest request) {   
	      List reportList=reportService.selectAll();//모델앤뷰로 리스트 반환하고.. jsp에서 리스트 받아서 목록 출력!!
	      pager.init(request, reportList.size());
	      ModelAndView mav = new ModelAndView("admin/report/index");
	      mav.addObject("pager",pager);
	      mav.addObject("reportList", reportList);
	      return mav;
	   } 
	   
	   //게시판 상세보기
	   @RequestMapping(value="/reports/{report_id}",method=RequestMethod.GET) 
	   public ModelAndView select(@PathVariable("report_id") int report_id) {   
	      ModelAndView mav = new ModelAndView("admin/report/detail"); 
	      Report report =  reportService.select(report_id); 
	      mav.addObject("report",report); 
	      return mav;
	   }
	   
	   //게시판에 첨부된 이미지 불러오기
	   @RequestMapping(value="/reportsimg/{report_id}",method=RequestMethod.GET)
	   @ResponseBody
	   public String selectImg(@PathVariable("report_id") int report_id) {
	      List<ReportImg> imgList = reportService.selectImg(report_id);
	      JSONArray jsonArray = new JSONArray();
	      for(int i = 0;i<imgList.size();i++) {
	         ReportImg ri = imgList.get(i);
	         JSONObject obj = new JSONObject();
	         obj.put("img", ri.getImg());         
	         jsonArray.add(obj);
	      }
	      return jsonArray.toString();
	      
	   }
	   //게시판 확인여부 
	   @RequestMapping(value="/reports/check",method=RequestMethod.POST)
	   public String update(@RequestParam("report_id") int report_id) {
	      reportService.update(report_id);
	      return "redirect:/reports";
	   }
	   // 상세보기에서 이메일발송
	   @RequestMapping(value = "/report/sendMail", method = RequestMethod.POST)
	   @ResponseBody
	   public String sendMail(Mail mail) {
	      final MimeMessagePreparator preparator = new MimeMessagePreparator() {
	         @Override
	         public void prepare(MimeMessage mimeMessage) throws Exception {
	            final MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true, "UTF-8");
	            String from = "ArounDogManager@gmail.com"; 
	            helper.setFrom(from);
	            helper.setTo(mail.getTo());
	            helper.setSubject(mail.getMailTitle());
	            helper.setText(mail.getMailContent(), true);
	         }
	      };
	      mailSender.send(preparator);
	      return "{\"result\":1,\"msg\":\"1\"}";
	   }

	 //adopts 관련 -----현화 파트 시작---------------------------------------#  
      //페이지 가져오기
      @RequestMapping(value="/adopts",method=RequestMethod.GET)
         public ModelAndView adoptChangePage(@RequestParam(value="currentPage", defaultValue="1" , required=false) int currentPage,HttpServletRequest request) {  
         ModelAndView mav = new ModelAndView("admin/adopt/index");
         List adoptList= adoptService.selectAll();
         pager.init(request, adoptList.size());
         mav.addObject("adoptList", adoptList);
         mav.addObject("pager", pager);
         return mav;
      }
	//#---------------------------------adopts 관련 끝-----------현화 파트 끝---------------------------------
	//-----------------------공지 게시판 시작---------------민호 파트 시작-----------------------------------------------
	
		//페이지 가져오기
	@RequestMapping(value="/admin/notice",method=RequestMethod.GET)
	public ModelAndView noticeChangePage(@RequestParam(value="currentPage", defaultValue="1" , required=false) int currentPage,HttpServletRequest request) {	
		ModelAndView mav = new ModelAndView("admin/notice/index");
		List noticeList=noticeService.selectAll();
		pager.init(request, noticeList.size());
		mav.addObject("noticeList", noticeList);
		mav.addObject("pager", pager);	
		return mav;
	}
	//공지 게시판 등록화면 이동
	@RequestMapping(value="/admin/notice/registpage",method=RequestMethod.GET)
	public String goNoticeRegistPage(HttpServletRequest request) {
		return "admin/notice/regist";
	}
	//공지 등록
	@RequestMapping(value="/admin/notice/regist",method=RequestMethod.POST)
	public String noticeRegist(Notice notice) {
		noticeService.insert(notice);
		return "redirect:/admin/notice";
	}
	//공지 삭제
	@RequestMapping(value="/admin/notice/del/{notice_id}",method=RequestMethod.DELETE)
	@ResponseBody
	public String noticeDelete(@PathVariable("notice_id") int notice_id) {
		noticeService.delete(notice_id);
		return "{\"result\":1,\"msg\":\"1\"}";
	}
	//------------------------공지 게시판 끝---------------------------------------------------------
	//------------------------자유게시판 시작--------------------------------------------------------------
	
	//자유게시판 게시물 1건 삭제
	@RequestMapping(value="/admin/freeboard/del/{freeboard_id}",method=RequestMethod.DELETE)
	@ResponseBody
	public String freeboardDel(@PathVariable("freeboard_id") int freeboard_id) {
		System.out.println("id : "+freeboard_id);
		freeBoardService.delete(freeboard_id);
		List commentList=freeCommentService.select(freeboard_id);
		if(commentList.size()==0) {		
		}else {
			freeCommentService.deleteByFreeboardId(freeboard_id);
		}
		return "{\"result\":1,\"msg\":\"1\"}";
	}
	
	//페이지 가져오기
	@RequestMapping(value="/admin/freeboard",method=RequestMethod.GET)
	public ModelAndView freeBoardChangePage(@RequestParam(value="currentPage", defaultValue="1" , required=false) int currentPage,HttpServletRequest request) {	
		ModelAndView mav = new ModelAndView("admin/freeboard/index");
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
	
	//자유게시판 상세정보 보기
	@RequestMapping(value="/admin/freeboard/detail/{freeboard_id}", method=RequestMethod.GET)
	public ModelAndView detail(@PathVariable("freeboard_id") int freeboard_id) {
		List fcList = new ArrayList();
		FreeBoard freeboard=freeBoardService.select(freeboard_id);
		ModelAndView mav = new ModelAndView("admin/freeboard/detail");
		
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
		
		mav.addObject("freeboard", freeboard);
		mav.addObject("fcList", fcList);
		return mav;
	}
	
	//관리자모드에서 댓글 team으로 삭제
	@RequestMapping(value="/admin/freecomment/del/{team}", method=RequestMethod.GET)
	public String freeCommentDelByTeam(FreeComment freeComment,@PathVariable("team") int team) {
		freeCommentService.deleteByTeam(freeComment);
		return "redirect:/admin/freeboard/detail/"+freeComment.getFreeboard_id();//해당 게시판으로 이동해야함/user/freeboard/detail/{freeboard_id}
	}
	
	//관리자모드에서 댓글의 댓글 한건 삭제
	@RequestMapping(value="/admin/freecommentreply/del/{freecomment_id}", method=RequestMethod.GET)
	public String freeCommentDelByCommentId(int freeboard_id,@PathVariable("freecomment_id") int freecomment_id) {
		freeCommentService.deleteByCommentId(freecomment_id);
		return "redirect:/admin/freeboard/detail/"+freeboard_id;
	}
	
	
	//---------------------------자유게시판 끝---------민호 파트 끝---------------------------------------	
	
	@ExceptionHandler(DeleteFailException.class)
	@ResponseBody
	public String deleteException(DeleteFailException e) {
		StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"result\":0");
		sb.append("}");
		return sb.toString();
	}
	
	@ExceptionHandler(LoginFailException.class)
    @ResponseBody
    public ModelAndView loginException(LoginFailException e) {
        ModelAndView mav = new ModelAndView("admin/error/lostboardError"); 
        mav.addObject("err", e);
        return mav;
    }


	
}
