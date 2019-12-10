package com.rainbow.um.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.rainbow.um.dto.UserDto;

public class AdminInterceptor extends HandlerInterceptorAdapter{
	
	private Logger log = LoggerFactory.getLogger(AdminInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		log.info("관리자 확인 Interceptor");
		try {
			UserDto udto = (UserDto)request.getSession().getAttribute("LDto");
			if (udto == null) {
				log.info("로그인이 필요합니다.");
				// 로그인 화면
//				response.sendRedirect("./loginForm.do");
				return false;
			}else if(udto.getUser_grade().equalsIgnoreCase("A")) {
				log.info("관리자 입니다.");
				// 에러 화면
//				response.sendRedirect("./loginForm.do");
				return true;
			}
		} catch (Exception e) {
			log.info("인터셉터 에러 ");
			e.printStackTrace();
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
}