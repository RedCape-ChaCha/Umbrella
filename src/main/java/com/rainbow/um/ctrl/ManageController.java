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
import com.rainbow.um.common.TossAPI;
import com.rainbow.um.dto.UserDto;
import com.rainbow.um.model.IManageService;

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
	
	@RequestMapping(value = "/testManage.do", method = RequestMethod.GET)
	public String home() {
		return "Test/ManageTest";
	}
	
	// 일반대출
	@RequestMapping(value = "/login.loan.do", method = RequestMethod.GET)
	public String loan() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_number", "2");
		map.put("book_aseq", "2");
		Map<String, String> reMap = manage.loanInsert(map);
		if(reMap.get("error") != null) {
			System.out.println(reMap.get("message"));
		}
		return "Test/ManageTest";
	}
	
	// 웹 대출
	@RequestMapping(value = "/apply.do", method = RequestMethod.GET)
	public String apply() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_number", "2");
		map.put("book_cseq","3");
		System.out.println("웹 대출 신청 성공 여부");
		System.out.println(manage.applyInsert(map));
		return "Test/ManageTest";
	}
	
	// 반납
	@RequestMapping(value = "/return.do", method = RequestMethod.GET)
	public String return3() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_number", "2");
		map.put("book_aseq", "2");
		System.out.println(manage.returnBook(map));
		return "Test/ManageTest";
	}
	
	// 예약 취소
	@RequestMapping(value = "/cancleResv.do", method = RequestMethod.GET)
	public String cancleResv() {
		System.out.println("마일리지 예약 취소");
		System.out.println(manage.cancleResv("3"));
		return "Test/ManageTest";
	}
	
	@RequestMapping(value = "/tossApi.do", method = RequestMethod.GET)
	public String tossApi(String orderNo) {
		Map<String, Object>	map = new HashMap<String, Object>();
		map.put("orderNo", orderNo);
		map.put("amount", 10000);
		System.out.println(toss.doToss(map).get("checkoutPage"));
		System.out.println(toss.doToss(map).get("payToken"));
		return "Test/ManageTest";
	}
	@RequestMapping(value = "/callback.do", method = RequestMethod.GET)
	public String callback(HttpServletRequest request) {
		request.getSession().setAttribute("test2", "콜백했음");
		System.out.println("콜백함?");
		return "Test/ManageTest";
	}
	@RequestMapping(value = "/payCom.do", method = RequestMethod.GET)
	public String payCom(HttpServletRequest request, String orderNo, String payMethod) {
		request.setAttribute("test", "결제완료했음");
		request.setAttribute("orderNo", orderNo);
		request.setAttribute("payMethod", payMethod);
		return "Test/ManageTest";
	}
	@RequestMapping(value = "/payCancle.do", method = RequestMethod.GET)
	public String payCancle(HttpServletRequest request) {
		request.setAttribute("test", "결제취소했음");
		return "Test/ManageTest";
	}
	
	@RequestMapping(value = "/tossCancle.do", method = RequestMethod.GET)
	public String tossCancle(HttpServletRequest request, String payToken) {
		System.out.println(toss.tossCancle(payToken).toString());
		return "Test/ManageTest";
	}
	
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
	
}
