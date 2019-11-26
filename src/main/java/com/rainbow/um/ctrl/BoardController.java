package com.rainbow.um.ctrl;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.xml.crypto.dsig.keyinfo.PGPData;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rainbow.um.common.PageModule;
import com.rainbow.um.dto.QnaDto;
import com.rainbow.um.dto.ReplyDto;
import com.rainbow.um.dto.UserDto;
import com.rainbow.um.model.BoardServiceImpl;
import com.rainbow.um.model.IBoardService;

@Controller
public class BoardController {

	private final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private IBoardService service;
	
	@RequestMapping(value = "/testBoard.do",method = RequestMethod.GET)
	public String testBoard(HttpSession session,Model model,String nowPage) {
		log.info("testBoard 이동하기 {}",new Date());
		String user_number = "1";
		session.setAttribute("user_number", user_number);
		PageModule pg  = (PageModule) session.getAttribute("pg");
		if (pg == null) {
			pg = new PageModule(service.qnaSelectTotalCnt(), 1, 2, 5);
		}else {
			pg = new PageModule(service.qnaSelectTotalCnt(),Integer.parseInt(nowPage), 2, 5);			
		}
		System.out.println(pg);
		List<QnaDto> lists = null;
		lists = service.qnaList(pg, user_number);
		model.addAttribute("lists",lists);
		model.addAttribute("pg",pg);
		session.setAttribute("pg", pg);
		return "BoardTest";
	}

	@RequestMapping(value = "/qnaInsert.do",method = RequestMethod.POST)
	public String qnaInsert(QnaDto dto) {
		log.info("qnaInsert 글 작성 {}",dto);
		service.qnaInsert(dto);
		return "redirect:testBoard.do";
	}
	
	@RequestMapping(value = "/repInsert.do",method = RequestMethod.POST)
	public String repInsert(ReplyDto dto) {
		log.info("repInsert 답글 작성 {}",dto);
		service.replyInsert(dto);
		return "redirect:testBoard.do";
	}
	
	
	
	
}
