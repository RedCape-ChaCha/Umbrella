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
		log.info("휴대폰 번호 인증 확인 Interceptor");
		try {
			UserDto udto = (UserDto)request.getSession().getAttribute("LDto");
			if (udto == null) {
				log.info("로그인이 필요합니다.");
				// 로그인 화면
//				response.sendRedirect("./loginForm.do");
				return false;
			}else if(udto.getUser_phone() == null) {
				log.info("전화번호 인증이 안된 회원입니다 : {}", udto.getUser_email() );
				// 휴대폰 인증 화면
//				response.sendRedirect("./loginForm.do");
				return false;
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