package com.rainbow.um.ctrl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainbow.um.dto.UserDto;
import com.rainbow.um.model.IUserService;
import com.rainbow.um.model.UserServiceImpl;

@Controller
public class UserController {

	private Logger log= LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private IUserService service;
	
	@RequestMapping(value="/testMember.do", method=RequestMethod.GET)
	public String init() {
		log.info("UserController testMember.do 처음페이지 이동 /n : {}",new Date());
		return "Test/MemberTest";
	}
	
	
	@RequestMapping(value = "/loginCheckMap.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> loginCheckMap(UserDto dto) {
		log.info("UserController loginCheckMap.do : \t {} : {}", dto);
		Map<String, String> map = new HashMap<String, String>();
		UserDto udto = service.userLogin(dto);
		System.out.println(udto);
		if (udto ==null) {
			map.put("isc", "실패");			
		}else {
			map.put("isc", "성공");			
		}
		return map;
	}
	
	
	@RequestMapping(value = "/login.do",method=RequestMethod.POST)
	public String login(HttpSession session, UserDto dto) {
		log.info("UserController login.do /n : {}",dto);
		UserDto uDto = service.userLogin(dto);
		if(uDto != null) {
			session.setAttribute("LDto", uDto);
			if(uDto.getUser_grade().equalsIgnoreCase("A")) {
				return "Test/adminMain";
			}else{
					return "Test/userMain";
			}
		}else {
			return "redirect:/testMember.do";
		}
	}
	@RequestMapping(value="/logout.do",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		log.info("UserController logout.do 로그아웃 /n : {}",new Date());
		session.invalidate();
		return "redirect:/testMember.do";
	}
	
	
	@RequestMapping(value = "/regist.do",method=RequestMethod.GET)
	public String regist() {
		log.info("UserController regist.do 회원가입으로 이동/n : {}",new Date());
		return "Test/RegiForm";
	}
	
	@ResponseBody
	@RequestMapping(value="/emailchk.do", method = RequestMethod.POST)
	public int emailChk(HttpServletRequest req){
		log.info("UserController emailchk.do 이메일체크/n : {}",new Date());
		String user_email = req.getParameter("user_email");
		UserDto idchk = service.emailChk(user_email);
		int result = 0;
		if(idchk != null) {
			result = 1;
		}
		return result;
	}
}
