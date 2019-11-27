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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.rainbow.um.common.PageModule;
import com.rainbow.um.dto.BoardDto;
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
	
	
	@RequestMapping(value = "/qnaList.do",method = RequestMethod.GET)
	public String qnaList(HttpSession session, Model model, String nowPage) {
		log.info("qnaList qna 전체 조회{}",new Date());
		String user_number = "1";
		session.setAttribute("user_number", user_number);
		PageModule pg  = (PageModule) session.getAttribute("pg");
		if (nowPage == null) {
			nowPage = "1";
		}
		if (pg == null) {
			pg = new PageModule(service.qnaSelectTotalCnt(), 1, 2, 5);
		}else {
			pg = new PageModule(service.qnaSelectTotalCnt(),Integer.parseInt(nowPage), 2, 5);			
		}
		System.out.println(pg);
		List<QnaDto> lists = null;
		lists = service.qnaList(pg, user_number);
		model.addAttribute("qnalists",lists);
		model.addAttribute("pg",pg);
		session.setAttribute("pg", pg);
		return "Test/BoardTest";
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
	
	@RequestMapping(value = "/qnaDetail.do",method = RequestMethod.GET)
	public String qnaDetail(Model model,String qna_seq, RedirectAttributes ratt) {
		log.info("qnaDetail 상세 조회 {}",qna_seq);
		List<QnaDto> dto = service.qnaSelect(qna_seq);
		System.out.println(dto);
		model.addAttribute("qrdto", dto);
		return "Test/BoardTest";
	}
	
	@RequestMapping(value = "/noInsert.do",method = RequestMethod.POST)
	public String noInsert(BoardDto dto) {
		log.info("noInsert 공지사항 작성 {}",dto);
		service.noticeInsert(dto);
		return "Test/BoardTest";
	}
	
	@RequestMapping(value = "/noList.do",method = RequestMethod.GET)
	public String noList(HttpSession session, Model model, String nowPage) {
		log.info("noList notice 전체 조회{}",new Date());
		PageModule pg  = (PageModule) session.getAttribute("pg");
		String type = "N";
		if (nowPage == null) {
			nowPage = "1";
		}
		if (pg == null) {
			pg = new PageModule(service.boardSelectTotalCnt(type), 1, 2, 5);
		}else {
			pg = new PageModule(service.boardSelectTotalCnt(type),Integer.parseInt(nowPage), 2, 5);			
		}
		System.out.println(pg);
		List<BoardDto> lists = service.noticeList(pg);
		model.addAttribute("noLists",lists);
		model.addAttribute("pg",pg);
		session.setAttribute("pg", pg);
		return "Test/BoardTest";
	}
	
	@RequestMapping(value = "/noDetail.do",method = RequestMethod.GET)
	public String noDetail(Model model,String board_seq) {
		log.info("noDetail 상세 조회 {}",board_seq);
		BoardDto dto = service.noticeSelect(board_seq);
		System.out.println(dto);
		model.addAttribute("nodto", dto);
		return "Test/BoardTest";
	}
	
	@RequestMapping(value = "/noUpdate.do",method = RequestMethod.POST)
	public String noUpdate(BoardDto dto) {
		log.info("noUpdate 공지사항 수정 {}",dto);
		boolean  isc = service.noticeUpdate(dto);
		if (isc) {
			return "redirect:noList.do";			
		}else {
			return "redirect:noDetail.do?board_seq="+dto.getBoard_seq();
		}
	}
	
	
	
	
	
	
}
