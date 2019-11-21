package com.rainbow.um.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.rainbow.um.dto.UserDto;

public class ManageInterceptor extends HandlerInterceptorAdapter{
	
	private Logger log = LoggerFactory.getLogger(ManageInterceptor.class);

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		UserDto udto = (UserDto)request.getSession().getAttribute("udto");
		
		if(udto.getUser_phone() == null) {
			log.info("전화번호 인증이 안된 회원입니다 : {}", udto.getUser_email() );
			// 휴대폰 인증 페이지로 이동
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