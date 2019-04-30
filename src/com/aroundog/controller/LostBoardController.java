package com.aroundog.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.aroundog.common.exception.DeleteFailException;
import com.aroundog.common.file.FileManager;
import com.aroundog.commons.Pager;
import com.aroundog.model.domain.LostBoard;
import com.aroundog.model.domain.LostBoardImg;
import com.aroundog.model.domain.Type;
import com.aroundog.model.service.LostBoardService;
import com.aroundog.model.service.TypeService;

@Controller
public class LostBoardController {
   @Autowired
   private TypeService typeService;
   @Autowired
   private LostBoardService lostBoardService;

   @Autowired
   private FileManager fileManager;

   private Pager pager = new Pager();
   
   @RequestMapping(value="/user/lostboard/write",method = RequestMethod.GET)
   public ModelAndView goWrite() {
      ModelAndView mav = new ModelAndView("user/lostboard/write");
      List<Type> typeList = typeService.selectAll();
      mav.addObject("typeList",typeList);
      return mav;
   }   
   @RequestMapping(value = "/user/lostboard", method = RequestMethod.POST)
   public String insert(LostBoard lostBoard, LostBoardImg lostBoardImg, Type type, HttpServletRequest request) {
      lostBoard.setType(type);
      MultipartFile[] myFile = lostBoard.getMyFile();
      String realPath = request.getServletContext().getRealPath("/data");
      lostBoardService.insert(lostBoard);
      lostBoardService.insertImg(myFile, lostBoard, realPath);
      return "redirect:/user/lostboard/lostboardlist";
   }

   @RequestMapping(value = "/user/lostboard/lostboardlist", method = RequestMethod.GET)
   public ModelAndView goIndex(HttpServletRequest request) {
      List<LostBoard> lostBoardList = lostBoardService.selectAll();// 리스트가져옴
      List keyWordList = lostBoardService.getKeyWordList(lostBoardList);
      List<LostBoardImg> thumbList = (List) keyWordList.get(0);
      List<Integer> idList = (List) keyWordList.get(1);
      pager.init(request, lostBoardList.size());
      ModelAndView mav = new ModelAndView("user/lostboard/lostboardlist");
      mav.addObject("pager", pager);
      mav.addObject("thumbList", thumbList);
      mav.addObject("idList", idList);
      mav.addObject("lostBoardList", lostBoardList);
      return mav;
   }

   
   @RequestMapping(value = "/user/lostboard/lostboardlist/{lostboard_id}", method = RequestMethod.GET)
   public ModelAndView select(@PathVariable("lostboard_id") int lostboard_id) {
      ModelAndView mav = new ModelAndView("user/lostboard/lostboarddetail");
      LostBoard lostBoard = lostBoardService.select(lostboard_id);
      lostBoardService.update(lostboard_id);
      List<LostBoardImg> imgList = lostBoardService.selectImg(lostboard_id);
      mav.addObject("lostBoard", lostBoard);
      mav.addObject("imgList", imgList);
      return mav;
   }
   
	@RequestMapping(value="/user/lostboard/lostboarddetail/delete",method=RequestMethod.POST)
	public String delete(@RequestParam("lostboard_id") int lostboard_id) {
		lostBoardService.delete(lostboard_id);
		lostBoardService.deleteImg(lostboard_id);
		return "redirect:/user/lostboard/lostboardlist";
	}
	

	@RequestMapping(value="/user/lostboard/lostboarddetail/update",method=RequestMethod.POST)
	public ModelAndView goEdit(@RequestParam("lostboard_id") int lostboard_id) {
		ModelAndView mav = new ModelAndView("user/lostboard/edit");
		LostBoard lostboard = lostBoardService.select(lostboard_id);		
	    List<Type> typeList = typeService.selectAll();
	    mav.addObject("lostboard_id",lostboard_id);
	    mav.addObject("typeList",typeList);
		mav.addObject("lostBoard", lostboard);
		return mav;
	}
	
	@RequestMapping(value="/user/lostboard/edit",method=RequestMethod.POST)
	public String doEdit(LostBoard lostBoard, LostBoardImg lostBoardImg, Type type, HttpServletRequest request) {
		lostBoard.setType(type);
	    MultipartFile[] myFile = lostBoard.getMyFile();
	    String realPath = request.getServletContext().getRealPath("/data");
	    int lostboard_id = lostBoard.getLostboard_id();
	    List<LostBoardImg> oriList = lostBoardService.selectImg(lostboard_id);
	    lostBoardService.updateLostBoard(lostBoard);    
	    lostBoardService.updateLostBoardImg(myFile, oriList, lostBoard, lostBoardImg,realPath);
		return "redirect:/user/lostboard/lostboardlist";
		
	}

   /*
    * @RequestMapping(value = "/lostboard/types", method = RequestMethod.GET)
    * public List selectAllType() { System.out.println("Type요청!"); return
    * typeService.selectAll(); }
    */
	
	
	/*-----------------------------------------관리자 : 임시보호 게시판------------------------------------------------*/
	// 관리자 : 임시보호 리스트 요청
	@RequestMapping(value = "/admin/lostboardList", method = RequestMethod.GET)
	public ModelAndView lostboardList() {
		System.out.println("관리자 lostboardList 호출!!!");
		List lostboardList= lostBoardService.selectAll();
		
		ModelAndView mav= new ModelAndView("admin/lostboard/index");
		mav.addObject("lostboardList", lostboardList);
		mav.addObject("na", "na");
		System.out.println("lostboardList 사이즈는 "+lostboardList.size());
		return mav;
	}
	
	// 관리자 : 임시보호글 작성자 이름으로 검색
	@RequestMapping(value="/admin/lostboardSearchId", method=RequestMethod.GET)
	@ResponseBody
	public String lostboardSearchId(int lostboard_id) {
		System.out.println("관리자 lostboardSearchName 호출!!!");
		LostBoard lostboard= lostBoardService.selectById(lostboard_id);
		JSONObject json = new JSONObject();
		json.put("lostboard_id", lostboard.getLostboard_id());
		json.put("title", lostboard.getTitle());
		json.put("content", lostboard.getContent());
		json.put("regdate", lostboard.getRegdate());
		json.put("startdate", lostboard.getStartdate());
		json.put("enddate", lostboard.getEnddate());
		json.put("hit", lostboard.getHit());
		json.put("lati", lostboard.getLati());
		json.put("longi", lostboard.getLongi());
		json.put("type", lostboard.getType());
		json.put("member", lostboard.getMember());
		System.out.println(json.toString());
		
		return json.toString();
	}
	
	/*---------------------------------------------예외처리-------------------------------------------------------------*/

	@ExceptionHandler(DeleteFailException.class)
	   public ModelAndView adoptboardDeleteFail(DeleteFailException e) {
	      ModelAndView mav = new ModelAndView("user/error/adoptError");
	      mav.addObject("err", e.getMessage());
	      return mav;
	   }
}









