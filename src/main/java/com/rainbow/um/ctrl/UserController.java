package com.rainbow.um.ctrl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value = "/alluserlist.do", method = RequestMethod.GET)
	public String userList(Model model) {
		log.info("UserController userSelect.do 회원정보조회 \t : {}", new Date());
		List<UserDto> lists = service.allUserList();
		model.addAttribute("lists", lists);
		return "Test/allUserList";
	}
	
	
	@RequestMapping(value = "/regist.do",method=RequestMethod.GET)
	public String regist() {
		log.info("UserController regist.do 회원가입 /n : {}",new Date());
		return "Test/RegiForm";
	}
	
	@RequestMapping(value="/emailChk.do",method =RequestMethod.POST)
	@ResponseBody
	public Map<String, String> emailChk(String user_email) {
		log.info("UserController emailChk.do : \t {} ", user_email);
		Map<String, String> map = new HashMap<String, String>();
		boolean isc = service.emailChk(user_email);
		log.info("UserController signUpForm 결과 : \t {} ", isc);
		map.put("isc",isc+"");
		return map;
	}
	
	@RequestMapping(value="/signUp.do",method = RequestMethod.POST)
	public String signUp(UserDto dto, @RequestParam("user_password") String user_password) {
		dto.setUser_password(user_password);
		log.info("UserController signUp 결과 : \t {} ", dto);
		boolean isc = service.userInsert(dto);
		log.info("UserController signUp 결과 : \t {} ", isc);
		return isc ? "redirect:/testMember.do" : "redirect:/regist.do";
	}
	
	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView userInfo(Model model,String user_email) {
		log.info("UserController mypage.do 내정보\t : {}", user_email);
		ModelAndView m = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_email", user_email);
		UserDto dto = service.userSelect(map);
		m.setViewName("Test/mypage");
		m.addObject("dto", dto);
		return m;
	}
	
	@RequestMapping(value="/modifyform.do", method = RequestMethod.GET)
	public String modify() {
		log.info("UserController modifyform.do 개인정보수정\t : {}");
		return "Test/modifyform";
	}
	
}
