package com.rainbow.um.ctrl;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.context.ServletConfigAware;

/**
 * Handles requests for the application home page.
 */
@Controller
public class WebSocketController implements ServletConfigAware{
	private ServletContext servletContext;
	private static final Logger logger = LoggerFactory.getLogger(WebSocketController.class);

	
	@Override
	public void setServletConfig(ServletConfig servletConfig) {
		servletContext = servletConfig.getServletContext();
	}
	
	// WebSocket 
	@RequestMapping(value = "/socketOpenA.do", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, String> socketOpenA(HttpSession session, String mem_id, String gr_id, Model model) {
		logger.info("socketOpen");
		session.setAttribute("mem_id", mem_id);
		session.setAttribute("gr_id", gr_id);
		
		HashMap<String, String> chatList = (HashMap<String, String>)servletContext.getAttribute("chatList");
		if (chatList == null) {
			chatList = new HashMap<String, String>();
			chatList.put(mem_id, gr_id);
			servletContext.setAttribute("chatList", chatList);
		} else {
			chatList.put(mem_id, gr_id);
			servletContext.setAttribute("chatList", chatList);
		}
		logger.info("socketOpen");

		return chatList;
	}
	@RequestMapping(value = "/socketOpen.do", method = RequestMethod.GET)
	public String socketOpen(HttpSession session, String mem_id, String gr_id, Model model) {
		logger.info("socketOpen");
		session.setAttribute("mem_id", mem_id);
		session.setAttribute("gr_id", gr_id);
		
		HashMap<String, String> chatList = (HashMap<String, String>)servletContext.getAttribute("chatList");
		if (chatList == null) {
			chatList = new HashMap<String, String>();
			chatList.put(mem_id, gr_id);
			servletContext.setAttribute("chatList", chatList);
		} else {
			chatList.put(mem_id, gr_id);
			servletContext.setAttribute("chatList", chatList);
		}
		logger.info("socketOpen");
		
		return "groupChat";
	}

	@RequestMapping(value = "/socketOut.do", method = { RequestMethod.GET, RequestMethod.POST })
	public void socketOut(HttpSession session) {
		logger.info("socketOut");
		String mem_id = (String) session.getAttribute("mem_id");
		HashMap<String, String> chatList = (HashMap<String, String>) servletContext.getAttribute("chatList");
		System.out.println(":" + chatList);
		if (chatList != null) {
			chatList.remove(mem_id);
		}
		System.out.println(":" + chatList);
		servletContext.setAttribute("chatList", chatList);

	}
	@RequestMapping(value = "/iframe.do", method = RequestMethod.GET)
	public String frame() {
		return "socketPage";
	}

		
	
	
	 

	
}
