package com.rainbow.um.ctrl;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rainbow.um.common.CaptchaModule;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CaptchaModule captcha;
	
	@RequestMapping(value = "/init.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		System.out.println(captcha.makeCapcha());
		
		return "home";
	}
	

	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String hello() {		
		return "index";
	}

	@RequestMapping(value = "/serch.do", method = RequestMethod.GET)
	public String serch(HttpSession session) {
		return "searchDetail";
	}
	@RequestMapping(value = "/bbsPostList.do", method = RequestMethod.GET)
	public String bbsPostList(HttpSession session) {
		return "bbsList";
	}
	
	@RequestMapping(value = "/myInfo.do", method = RequestMethod.GET)
	public String myInfo(HttpSession session) {
		return "myInfo";
	}
	
	
	
	
}
