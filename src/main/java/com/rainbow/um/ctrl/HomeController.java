package com.rainbow.um.ctrl;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rainbow.um.common.CaptchaModule;
import com.rainbow.um.common.PageModule;
import com.rainbow.um.dto.ApplyDto;
import com.rainbow.um.dto.BoardDto;
import com.rainbow.um.dto.BobDto;
import com.rainbow.um.dto.LockcerDto;
import com.rainbow.um.dto.UserDto;
import com.rainbow.um.model.IAdminService;
import com.rainbow.um.model.IBoardService;
import com.rainbow.um.model.IUserService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private IBoardService service;
	@Autowired
	private IUserService uservice;
	@Autowired
	private IAdminService aservice;
	
	
	@RequestMapping(value = "/init.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession session,HttpServletRequest request) {
		logger.info("home 메인페이지 실행 {}.", locale);
		PageModule pg = new PageModule(service.boardSelectTotalCnt("N"), 1, 2, 6);
		List<BoardDto> lists = service.noticeList(pg);
		List<BobDto> blists = service.bobLoanList();
		model.addAttribute("noLists",lists);
		model.addAttribute("boLists",blists);
		UserDto user = (UserDto)session.getAttribute("LDto");
		if(user != null) {
			return "User/indexLogin";
		}
		return "User/index";
	}
	
	@RequestMapping(value = "/testBoard.do", method = RequestMethod.GET)
	public String testBoard() {
		return "Test/BoardTest";
	}

	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String hello() {		
		return "index";
	}

	@RequestMapping(value = "/serch.do", method = RequestMethod.GET)
	public String serch(HttpSession session) {
		return "searchDetail";
	}
	
	
	@RequestMapping(value = "/myInfo.do", method = RequestMethod.GET)
	public String myInfo(HttpSession session) {
		return "User/myInfo";
	}
	
	@RequestMapping(value = "/adminhome.do", method = RequestMethod.GET)
	public String adminhome() {
		return "adminHome";
	}
	@RequestMapping(value = "/adminBookWeb.do", method = RequestMethod.GET)
	public String adminBookWeb(Model model) {
		List<ApplyDto> lists1= aservice.applySelectList();
		List<LockcerDto> lists2=aservice.lockerLists();
		List<LockcerDto> lists3=aservice.LockcerSaved();
		model.addAttribute("lists1", lists1);
		model.addAttribute("lists2", lists2);
		model.addAttribute("lists3", lists3);
		return "adminBookWeB";
	}
	
	@RequestMapping(value = "/adminContents.do", method = RequestMethod.GET)
	public String adminContents(Model model) {
		logger.info("UserController adminContents.do 회원정보조회 \t : {}", new Date());
		List<UserDto> lists = uservice.allUserList();
		model.addAttribute("lists", lists);
		return "adminContents";
	}
	
}
