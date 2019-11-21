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
		UserDto udto = (UserDto)request.getSession().getAttribute("udto");
		
		if(udto.getUser_grade() != "A") {
			log.info("잘못된 회원이 관리자 페이지로 이동하려 합니다 : {}", udto.getUser_email() );
			// 메인페이로 이동
			return false;
		}
		return true;
		
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		super.postHandle(request, response, handler, modelAndView);
	}
}