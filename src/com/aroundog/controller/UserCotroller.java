package com.aroundog.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.aroundog.model.service.AdoptboardService;

@Controller
public class UserCotroller {

	@Autowired
	private AdoptboardService adoptboardService;
	
	@RequestMapping(value="/user/login/login",method=RequestMethod.GET)
	public String loginError() {
		return "user/login/login";
	}
	@RequestMapping(value="/",method=RequestMethod.GET)
	public ModelAndView startMain() {
		ModelAndView mav= new ModelAndView("user/index");
		List adoptboardList= adoptboardService.selectAll();
	    mav.addObject("adoptboardList", adoptboardList);
		return mav;
	}
	@RequestMapping(value="/user/about",method=RequestMethod.GET)
	public String startAbout() {
		return "user/about";
	}
	
}
