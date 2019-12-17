package com.rainbow.um.ctrl;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainbow.um.common.NaverSearchModule;
import com.rainbow.um.common.OtpWAS;
import com.rainbow.um.common.PageModule;
import com.rainbow.um.common.TossAPI;
import com.rainbow.um.dto.UserDto;
import com.rainbow.um.model.IManageService;
import com.rainbow.um.model.IUserService;

@Controller
public class ManageController {
	private Logger log = LoggerFactory.getLogger(ManageController.class);
	@Autowired
	private IManageService manage;
	@Autowired
	private TossAPI toss;
	@Autowired
	private OtpWAS otp;
	@Autowired
	private NaverSearchModule search;
	
	@RequestMapping(value = "/timeChk.do", method = RequestMethod.POST)
	@ResponseBody
	public String timeChk(String time, String code,String phone) throws Exception {
		long tm = Long.parseLong(time);
		System.out.println(otp.vaildate(code, phone, tm));
		if(otp.vaildate(code, phone, tm)) {
			return "true";
		}
		return "false";
	}
	
	@RequestMapping(value = "/doAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public String doAjax(String time, String phone) throws Exception {
		try{
			String sUrl = "http://52.79.168.119:8080/Umbrella_Batch-1.0.0-BUILD-SNAPSHOT/send.do?phone="+phone+"&time="+time;
	
			URL callUrl = new URL(sUrl);   
			URLConnection urlConn = callUrl.openConnection();
			
			InputStream is = urlConn.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			BufferedReader br = new BufferedReader(isr);
			
			String buf = null;

			while(true){
				buf = br.readLine();
				if(buf == null) break;
				return buf;
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "false";
	}
	
	//화면 웹대출 취소
	@RequestMapping(value = "/login.webCancle.do", method = RequestMethod.GET)
	public String webCancle(HttpServletRequest request) {
		log.info("개인 웹 대출 취소");
		UserDto udto = (UserDto)request.getSession().getAttribute("LDto");
		String apply_seq = request.getParameter("apply_seq");
		String user_number = udto.getUser_number();
		if(user_number.equals(manage.comApply(apply_seq))) {
			Map<String, String> map = new HashMap<String, String>();
			map.put("apply_seq", apply_seq);
			map.put("apply_check", "U");
			map.put("user_number", user_number);
			manage.applyUpdate(map);
		}
		return "redirect:/login.ownWebList.do";
	}
	
	//화면 예약취소
	@RequestMapping(value = "/login.resvCancle.do", method = RequestMethod.GET)
	public String resvCancle(HttpServletRequest request) {
		log.info("개인 예약 취소");
		UserDto udto = (UserDto)request.getSession().getAttribute("LDto");
		String user_number = udto.getUser_number();
		String resv_seq = request.getParameter("resv_seq");
		if(user_number.equals(manage.comResv(resv_seq))) {
			manage.cancleResv(resv_seq);
		}
		return "redirect:/login.ownResvList.do";
	}
	
	// 회원 개인 이전 웹대출 신청 내역
	@RequestMapping(value = "/login.webHistory.do", method = RequestMethod.GET)
	public String webHistory(HttpServletRequest request) {
		log.info("이전 웹 대출 신청 목록");
		UserDto udto = (UserDto)request.getSession().getAttribute("LDto");
		request.setAttribute("list", manage.lastWebHistory(udto.getUser_number()));
		return "User/webHistory";
	}
	
	// 회원이 도서에 직접 예약
	@RequestMapping(value = "/login.resv.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> normalResv(HttpServletRequest request) {
		UserDto udto = (UserDto)request.getSession().getAttribute("LDto");
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_number", udto.getUser_number());
		map.put("book_cseq", request.getParameter("book_cseq"));
		return manage.normalResvInsert(map);
	}
	
	// 회원이 도서에 직접 마일리지를 사용하여 예약
	@RequestMapping(value = "/login.mresv.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> milgResv(HttpServletRequest request) {
		UserDto udto = (UserDto)request.getSession().getAttribute("LDto");
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_number", udto.getUser_number());
		map.put("book_cseq", request.getParameter("book_cseq"));
		return manage.milgResvInsert(map);
	}
	
	// 관리자권한 대출
	@RequestMapping(value = "/admin.loan.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> loan(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_email", request.getParameter("user_email"));
		map.put("book_cseq", request.getParameter("book_aseq"));
		return manage.loanInsert(map);
	}
	
	// 회원이 도서에 직접 웹 대출 신청
	@RequestMapping(value = "/login.webApply.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, String> webApply(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_number", request.getParameter("user_number"));
		map.put("book_cseq", request.getParameter("book_cseq"));
		return manage.applyInsert(map);
	}
	
	// 관리자 권한 반납
	@RequestMapping(value = "/admin.returnBook.do", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> returnBook(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("user_number", request.getParameter("user_number"));
		map.put("book_cseq", request.getParameter("book_aseq"));
		return manage.returnBook(map);
	}
	
	// 관리자 권한 웹대출 취소
	@RequestMapping(value = "/admin.cancleApply.do", method = RequestMethod.GET)
	public String cancleApply(HttpServletRequest request) {
		Map<String, String> map = new HashMap<String, String>();
		String apply_seq = request.getParameter("apply_seq");
		map.put("apply_check", "C");
		map.put("apply_seq", apply_seq);
		map.put("user_number", apply_seq);
		manage.applyUpdate(map);
		return "";
	}
	
	@RequestMapping(value = "/bookSearch.do", method = RequestMethod.GET)
	public String bookSearch(HttpServletRequest request) throws ParseException {
		String result = search.search(request.getParameter("way"), request.getParameter("text"));
		JSONParser parser = new JSONParser();
		Object obj = parser.parse(result);
		JSONObject resultJson = (JSONObject)obj;
		request.setAttribute("result", resultJson);
		return "Test/Testing";
	}

	@RequestMapping(value = "/login.toss.do", method = RequestMethod.GET)
	public String toss(){
		return "User/cash";
	}

	@RequestMapping(value = "/login.tossGo.do", method = RequestMethod.GET)
	@ResponseBody
	public String tossdo(HttpServletRequest request){
		Map<String, Object>	map = new HashMap<String, Object>();
		map.put("orderNo", manage.tossOrderNo());
		map.put("amount", Integer.parseInt(request.getParameter("amount")));
		JSONObject comtoss = toss.doToss(map);
		Map<String, String> tossMap = new HashMap<String, String>();
		UserDto user = (UserDto)request.getSession().getAttribute("LDto");
		tossMap.put("user_number", user.getUser_number());
		tossMap.put("pay_amount", request.getParameter("amount"));
		tossMap.put("pay_token", (String)comtoss.get("payToken"));
		manage.insertToss(tossMap);
		return (String) comtoss.get("checkoutPage");
	}
	
	@RequestMapping(value = "/login.cancleToss.do", method = RequestMethod.GET)
	public String tossCancle(HttpServletRequest request){
		request.setAttribute("cancle", true);
		request.setAttribute("com", true);
		return "User/cash";
	}

	@RequestMapping(value = "/login.compleToss.do", method = RequestMethod.GET)
	public String tossComple(HttpServletRequest request){
		String orderNo = request.getParameter("orderNo");
		String pay_type = request.getParameter("payMethod");
		Map<String, String>	map = new HashMap<String, String>();
		map.put("pay_seq", orderNo);
		map.put("pay_type", pay_type);
		manage.updateToss(map);
		String amount = manage.getAmount(orderNo);
		UserDto user = (UserDto)request.getSession().getAttribute("LDto");
		Map<String, Object> milgMap = new HashMap<String, Object>();
		milgMap.put("amount", amount);
		milgMap.put("user_number", user.getUser_number());
		manage.milgControll(milgMap);
		request.setAttribute("com", request.getParameter("status"));
		return "User/cash";
	}
	
	@RequestMapping(value = "/login.MilgUseHistory.do", method = RequestMethod.GET)
	public String MilgUseHistory(HttpServletRequest request){
		UserDto user = (UserDto)request.getSession().getAttribute("LDto");
		int total = manage.countUseMilg(user.getUser_number());
		request.setAttribute("count", total);
		Object temp = request.getParameter("nowPage");
		if(temp == null) {
			temp = "1";
		}
		Integer nowPage = Integer.parseInt((String)temp);
		if(nowPage <= 0) {
			nowPage = 1;
		}else if(nowPage >= ((total/10)+1)) {
			nowPage = ((total/10)+1);
		}
		PageModule pg = new PageModule(total, nowPage, 2, 10);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_number", user.getUser_number());
		map.put("start_index", pg.getStartBoard());
		request.setAttribute("list", manage.SelectMilgHistory(map));
		request.setAttribute("pg", pg);
		return "User/MilgHistory";
	}

	@RequestMapping(value = "/login.CashHistory.do", method = RequestMethod.GET)
	public String CashHistory(HttpServletRequest request){
		UserDto user = (UserDto)request.getSession().getAttribute("LDto");
		int total = manage.countPaylist(user.getUser_number());
		request.setAttribute("count", total);
		Object temp = request.getParameter("nowPage");
		if(temp == null) {
			temp = "1";
		}
		Integer nowPage = Integer.parseInt((String)temp);
		if(nowPage <= 0) {
			nowPage = 1;
		}else if(nowPage >= ((total/10)+1)) {
			nowPage = ((total/10)+1);
		}
		PageModule pg = new PageModule(total, nowPage, 2, 10);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_number", user.getUser_number());
		map.put("start_index", pg.getStartBoard());
		request.setAttribute("pg", pg);
		request.setAttribute("list", manage.SelectPayList(map));
		return "User/CashHistory";
	}
	
	@RequestMapping(value = "/login.refund.do", method = RequestMethod.GET)
	@ResponseBody
	public String refund(HttpServletRequest request, String pay_seq, String amount){
		UserDto user = (UserDto)request.getSession().getAttribute("LDto");
		if(Integer.parseInt(amount) > Integer.parseInt(manage.getMilege(user.getUser_number()))) {
			return "false";
		}else {
			Map<String, String> map = new HashMap<String, String>();
			map.put("user_number", user.getUser_number());
			map.put("pay_seq", pay_seq);
			String pay_token = manage.SelectPayToken(map);
			toss.tossCancle(pay_token);
			Map<String, Object> reMap = new HashMap<String, Object>();
			reMap.put("user_number", user.getUser_number());
			reMap.put("amount", "-"+amount);
			manage.insertRefund(pay_seq, reMap);
			return "true";
		}
	}
	
}
