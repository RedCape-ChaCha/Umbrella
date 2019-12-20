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

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.crypto.dsig.keyinfo.PGPData;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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
import com.rainbow.um.dto.FileDto;
import com.rainbow.um.dto.QnaDto;
import com.rainbow.um.dto.ReplyDto;
import com.rainbow.um.dto.UserDto;
import com.rainbow.um.model.BoardServiceImpl;
import com.rainbow.um.model.IBoardService;
import com.rainbow.um.model.ICommonService;

@Controller
public class BoardController {

	private final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private IBoardService service;
	@Autowired
	private ICommonService fservice;
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	private S3FileUpload s3;
	
	
	@RequestMapping(value = "/login.qnaList.do",method = RequestMethod.GET)
	public String qnaList(HttpSession session, Model model, String nowPage) {
		log.info("qnaList qna 전체 조회{}",new Date());
		UserDto udto = (UserDto)session.getAttribute("LDto");
		PageModule pg  = (PageModule) session.getAttribute("qpg");
		if (nowPage == null ) {
			nowPage = "1";
		}
		if (pg == null) {
			pg = new PageModule(service.qnaSelectTotalCnt(udto), 1, 2, 5);
		}else {
			pg = new PageModule(service.qnaSelectTotalCnt(udto),Integer.parseInt(nowPage), 2, 5);			
		}
		System.out.println(pg);
		List<QnaDto> lists = null;
		session.setAttribute("qpg", pg);
		if (udto.getUser_grade().equalsIgnoreCase("A")) {
			pg = null;
			lists = service.qnaList(pg,udto);			
			model.addAttribute("qnalists",lists);
			return "adminQnA";
		}else {
			lists = service.qnaList(pg,udto);
			model.addAttribute("qnalists",lists);
			return "qnaList";			
		}
	}
	
	@RequestMapping(value = "/login.qnaRegForm.do", method = RequestMethod.GET)
	public String qnaRegForm() {
		return "qnaRegForm";
	}

	@RequestMapping(value = "/login.qnaInsert.do",method = RequestMethod.POST)
	public String qnaInsert(QnaDto dto) {
		log.info("qnaInsert 글 작성 {}",dto);
		service.qnaInsert(dto);
		return "redirect:login.qnaList.do";
	}
	
	@RequestMapping(value = "/login.repInsert.do",method = RequestMethod.POST)
	public String repInsert(ReplyDto dto,HttpSession session,String user_email) {
		log.info("repInsert 답글 작성 {} : {}",dto,user_email);
		UserDto uDto =  (UserDto)session.getAttribute("LDto");
		String setFrom ="a01040314603@gmail.com";
		if (uDto.getUser_grade().equalsIgnoreCase("A")) {
			MimeMessage message = mailSender.createMimeMessage();
			
			try {
				MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
				messageHelper.setFrom(setFrom);//보내는사람 이메일 생략하면 작동안함
				messageHelper.setTo(user_email);//받는사람이메일
				messageHelper.setSubject("스마트 도서관");//생략가능
				messageHelper.setText("개인문의 답글을 확인 해주세요", true);//html 태그를 보낼때 
				
				mailSender.send(message);
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			
		}
		service.replyInsert(dto);
		return "redirect:login.qnaDetail.do?qna_seq="+dto.getQna_seq();
	}
	
	@RequestMapping(value = "/login.qnaDetail.do",method = RequestMethod.GET)
	public String qnaDetail(Model model,String qna_seq,HttpSession session) {
		log.info("qnaDetail 상세 조회 {}",qna_seq);
		UserDto uDto =  (UserDto)session.getAttribute("LDto");
		List<QnaDto> dto = service.qnaSelect(qna_seq);
		System.out.println(dto);
		if (uDto.getUser_grade().equalsIgnoreCase("A")) {
			model.addAttribute("qrdto", dto);
			return "adminQnADetail";
		}else {
			model.addAttribute("qrdto", dto);
			return "qnaDetail";			
		}
	}
		
	@RequestMapping(value = "/admin.noticeRegForm.do",method = RequestMethod.GET)
	public String noticeRegForm() {
		log.info("noticeRegForm 공지사항 작성 이동{}",new Date());
		return "noticeRegForm";
	}

	@RequestMapping(value = "/admin.noInsert.do",method = RequestMethod.POST)
	public String noInsert(BoardDto dto) {
		log.info("noInsert 공지사항 작성 {}",dto);
		service.noticeInsert(dto);
		return "redirect:noList.do";
	}
	
	@RequestMapping(value = "/noList.do",method = RequestMethod.GET)
	public String noList(HttpSession session, Model model, String nowPage) {
		log.info("noList notice 전체 조회{}",new Date());
		PageModule pg  = (PageModule) session.getAttribute("npg");
		UserDto uDto =  (UserDto)session.getAttribute("LDto");
		System.out.println(uDto);
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
		List<BoardDto> lists = null;
		session.setAttribute("npg", pg);		
		if (uDto == null || uDto.getUser_grade().equalsIgnoreCase("U")) {
			lists = service.noticeList(pg);
			model.addAttribute("noLists",lists);
			return "noticeList";						
		}
		else {
			pg = null;
			lists = service.noticeList(pg);			
			model.addAttribute("noLists",lists);
			return "adminNotice";
			
		}
	}
	
	@RequestMapping(value = "/noDetail.do",method = RequestMethod.GET)
	public String noDetail(Model model,String board_seq,HttpSession session) {
		log.info("noDetail 상세 조회 {}",board_seq);
		BoardDto dto = service.noticeSelect(board_seq);
		UserDto uDto =  (UserDto)session.getAttribute("LDto");
		System.out.println(dto);
		if (uDto == null || uDto.getUser_grade().equalsIgnoreCase("U")) {
			model.addAttribute("nodto", dto);
			return "noticeDetail";			
		}
		else{
			model.addAttribute("nodto", dto);
			return "noticeUpForm";
		}
		
	}
	
	@RequestMapping(value = "/admin.noUpdate.do",method = RequestMethod.POST)
	public String noUpdate(BoardDto dto) {
		log.info("noUpdate 공지사항 수정 {}",dto);
		boolean  isc = service.noticeUpdate(dto);
		if (isc) {
			return "redirect:noList.do";			
		}else {
			return "redirect:noDetail.do?board_seq="+dto.getBoard_seq();
		}
	}

	@RequestMapping(value = "/bobList.do",method = RequestMethod.GET)
	public String bobList(HttpSession session, Model model, String nowPage) {
		log.info("bobList 추천도서 전체 조회{}",new Date());
		PageModule pg  = (PageModule) session.getAttribute("bpg");
		String type = "B";
		if (nowPage == null ) {
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
		session.setAttribute("bpg", pg);
		return "bobList";
	}
	
	
	@RequestMapping(value = "/bobDetail.do",method = RequestMethod.GET)
	public String bobDetail(Model model,String board_seq) {
		log.info("bobDetail 상세 조회 {}",board_seq);
		BoardDto dto = service.bobSelectOne(board_seq);
		service.boardSelectTotalCnt("B");
		System.out.println(dto);
		model.addAttribute("bobdto", dto);
		return "bobDetail";
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
		    
			FileDto fDto = new FileDto();
			fDto.setF_realname(ogName);
			fDto.setF_storagename(sgName);
			fDto.setF_info("Q");
			boolean isc = fservice.uploadFile(fDto);
			if (isc) {
			
			printWriter = resp.getWriter();
			String url = "https://s3.ap-northeast-2.amazonaws.com/rainbow.study/QnABoard/"+sgName;
			json.addProperty("uploaded", 1);
			json.addProperty("fileName", sgName);
			json.addProperty("url", url);
			System.out.println(json.toString());
			printWriter.println(json);			
			}
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			if (printWriter != null) {
				printWriter.close();
			}
		}
	}
}
