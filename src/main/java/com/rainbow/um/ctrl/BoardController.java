package com.rainbow.um.ctrl;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.dsig.keyinfo.PGPData;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.JsonObject;
import com.rainbow.um.common.PageModule;
import com.rainbow.um.common.S3FileUpload;
import com.rainbow.um.dto.BoardDto;
import com.rainbow.um.dto.BobDto;
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
	
	@Autowired
	private S3FileUpload s3;
	
	
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

	
	@RequestMapping(value = "/bobInsert.do",method = RequestMethod.GET)
	public String bobInsert() {
		log.info("bobInsert 공지사항 수정 {}",new Date());
		BoardDto dto = new BoardDto();
		
		Calendar cal = Calendar.getInstance();
		cal.add(cal.MONTH,-1);
		SimpleDateFormat dateFormat = new SimpleDateFormat("MM");
		String beforeMonth = dateFormat.format(cal.getTime());
		dto.setBoard_title(beforeMonth+"월 추천 도서!");
		
		boolean  isc = service.bobInsert(dto);
		if (isc) {
			return "Test/BoardTest";			
		}else {
			return "Test/BoardTest";
		}
	}
	
	@RequestMapping(value = "/bobList.do",method = RequestMethod.GET)
	public String bobList(HttpSession session, Model model, String nowPage) {
		log.info("bobList 추천도서 전체 조회{}",new Date());
		PageModule pg  = (PageModule) session.getAttribute("pg");
		String type = "B";
		if (nowPage == null) {
			nowPage = "1";
		}
		if (pg == null) {
			pg = new PageModule(service.boardSelectTotalCnt(type), 1, 2, 5);
		}else {
			pg = new PageModule(service.boardSelectTotalCnt(type),Integer.parseInt(nowPage), 2, 5);			
		}
		System.out.println(pg);
		List<BoardDto> lists = service.bobList(pg);
		model.addAttribute("bobLists",lists);
		model.addAttribute("pg",pg);
		session.setAttribute("pg", pg);
		return "Test/BoardTest";
	}
	
	
	@RequestMapping(value = "/bobDetail.do",method = RequestMethod.GET)
	public String bobDetail(Model model,String board_seq) {
		log.info("bobDetail 상세 조회 {}",board_seq);
		BoardDto dto = service.bobSelectOne(board_seq);
		service.boardSelectTotalCnt("B");
		System.out.println(dto);
		model.addAttribute("bobdto", dto);
		return "Test/BoardTest";
	}
	
	
	@RequestMapping(value = "/imgUpload.do")
	public void imgUpload(HttpServletResponse resp, HttpServletRequest req, @RequestParam MultipartFile upload) {
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");
		PrintWriter printWriter = null;
		JsonObject json = new JsonObject();
		String ogName = upload.getOriginalFilename();
		
		try {
			byte[] bytes = upload.getBytes();
			
			String fileType = ogName.substring(ogName.length()-3, ogName.length());
			String sgName = UUID.randomUUID()+"."+fileType;
			File conv = new File(sgName);
			upload.transferTo(conv); // MultipartFile -> File
			s3.uploadFile("QnABoard",conv);
			
			printWriter = resp.getWriter();
			String url = "https://s3.ap-northeast-2.amazonaws.com/rainbow.study/QnABoard/"+sgName;
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", sgName);
			json.addProperty("url", url);
			System.out.println(json.toString());
			printWriter.println(json);			
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			if (printWriter != null) {
				printWriter.close();
			}
		}
		
		
		
		
		
		
		
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
