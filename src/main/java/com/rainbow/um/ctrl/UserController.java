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

	private Logger log = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private IUserService service;

	@RequestMapping(value = "/testMember.do", method = RequestMethod.GET)
	public String init() {
		log.info("UserController testMember.do 처음페이지 이동 /n : {}", new Date());
		return "User/index";
	}

	@RequestMapping(value = "/loginCheckMap.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> loginCheckMap(UserDto dto) {
		log.info("UserController loginCheckMap.do : \t {} : {}", dto);
		Map<String, String> map = new HashMap<String, String>();
		UserDto udto = service.userLogin(dto);
		System.out.println(udto);
		if (udto == null) {
			map.put("isc", "실패");
		} else {
			map.put("isc", "성공");
		}
		return map;
	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public String login(HttpSession session, UserDto dto) {
		log.info("UserController login.do /n : {}", dto);
		UserDto uDto = service.userLogin(dto);
		if (uDto != null) {
			session.setAttribute("LDto", uDto);
			if (uDto.getUser_grade().equalsIgnoreCase("A")) {
				return "Test/adminMain";
			} else {
				return "redirect:/testMember.do";
			}
		} else {
			return "Test/RegiForm";
		}
	}
	
	@RequestMapping(value="/loginForm.do", method=RequestMethod.GET)
	public String loginForm() {
		log.info("UserController loginForm.doo /n : {}");
		return "User/loginMember";
	}

	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		log.info("UserController logout.do 로그아웃 /n : {}", new Date());
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

	@RequestMapping(value = "/regist.do", method = RequestMethod.GET)
	public String regist() {
		log.info("UserController regist.do 회원가입 /n : {}", new Date());
		return "User/RegiForm";
	}

	@RequestMapping(value = "/emailChk.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> emailChk(String user_email) {
		log.info("UserController emailChk.do : \t {} ", user_email);
		Map<String, String> map = new HashMap<String, String>();
		boolean isc = service.emailChk(user_email);
		log.info("UserController signUpForm 결과 : \t {} ", isc);
		map.put("isc", isc + "");
		return map;
	}

	@RequestMapping(value = "/signUp.do", method = RequestMethod.POST)
	public String signUp(UserDto dto, @RequestParam("user_password") String user_password) {
		dto.setUser_password(user_password);
		log.info("UserController signUp 결과 : \t {} ", dto);
		boolean isc = service.userInsert(dto);
		log.info("UserController signUp 결과 : \t {} ", isc);
		return isc ? "redirect:/testMember.do" : "redirect:/regist.do";
	}

	@RequestMapping(value = "/mypage.do", method = RequestMethod.GET)
	public ModelAndView userInfo(Model model, String user_email) {
		log.info("UserController mypage.do 내정보\t : {}", user_email);
		ModelAndView m = new ModelAndView();
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_email", user_email);
		UserDto dto = service.userSelect(map);
		m.setViewName("Test/mypage");
		m.addObject("dto", dto);
		return m;
	}

	@RequestMapping(value = "/modifyform.do", method = RequestMethod.GET)
	public String modify(HttpSession session, Model model) {
		log.info("UserController modifyform.do 개인정보수정폼으로 이동\t : {}");
		UserDto dto = (UserDto) session.getAttribute("LDto");
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_email", dto.getUser_email());
		UserDto mdto = service.userSelect(map);
		model.addAttribute("dto", mdto);
		return "Test/modifyform";
	}

	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public String update(HttpSession session, UserDto dto) {
		log.info("UserController modifyform.do 개인정보수정\t : {}");
		UserDto mdto = (UserDto) session.getAttribute("LDto");
		dto.setUser_email(mdto.getUser_email());
		boolean isc = service.userUpdate(dto);
		return isc ? "redirect:/userInfo.do?id=" + mdto.getUser_email() : "redircet:/modify.do";
	}
	
	@RequestMapping(value = "/userUpdateDel.do", method = RequestMethod.GET)
	public String userUpdateDel(HttpSession session) {
		log.info("UserController delUser.do 삭제\t : {}", new Date());
		UserDto dto = (UserDto) session.getAttribute("LDto");
		boolean isc = service.userUpdateDel(dto.getUser_email());
		return isc?"redirect:/testMember.do":"redirect:/userInfo.do?id="+dto.getUser_email();
	}
	
	
	
//	@RequestMapping(value = "/updateAuthForm.do", method = RequestMethod.GET)
//	public String updateAuthForm(String user_email,Model model) {
//		log.info("UserController updateAuthForm.do 권한 수정\t : {}", user_email);
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("user_email", user_email);
//		UserDto mdto = service.userSelect(map);
//		System.out.println(mdto);
//		model.addAttribute("dto",mdto);
//		return "updateAuthForm";
//	}
	
//	@RequestMapping(value = "/authChange.do", method = RequestMethod.POST)
//	public String authChange(String user_email, String user_grade) {
//		log.info("UserController authChange.do 권한 수정\t : {} {}", user_email,user_grade);
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("user_email", user_email);
//		map.put("user_grade", user_grade);
//		boolean isc = service.userUpdateGrade(map);
//		return isc?"redirect:/login.do":"redirect:/testMember.do";
//	}
}
