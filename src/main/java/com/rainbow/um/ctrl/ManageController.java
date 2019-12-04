package com.rainbow.um.ctrl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rainbow.um.common.OtpWAS;
import com.rainbow.um.common.TossAPI;
import com.rainbow.um.model.IManageService;

@Controller
public class ManageController {
	
	@Autowired
	private IManageService manage;
	@Autowired
	private TossAPI toss;
	@Autowired
	private OtpWAS otp;
	
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
	
	// 웹 대출 취소
	@RequestMapping(value = "/applyCancle.do", method = RequestMethod.GET)
	public String applyCancle() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_number", "2");
		map.put("book_cseq","3");
		System.out.println("웹 대출 취소 성공 여부");
		System.out.println(manage.applyUpdate(map));
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
	
	// 일반 예약
	@RequestMapping(value = "/resv.do", method = RequestMethod.GET)
	public String resv() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_number", "2");
		map.put("book_cseq", "2");
		System.out.println(manage.normalResvInsert(map));
		return "Test/ManageTest";
	}
	
	// 마일리지 예약
	@RequestMapping(value = "/milgResv.do", method = RequestMethod.GET)
	public String milgResv() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_number", "2");
		map.put("book_cseq", "2");
		System.out.println(manage.milgResvInsert(map));
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
		map.put("amount", 1980000);
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
	
	@RequestMapping(value = "/timeChk.do", method = RequestMethod.GET)
	public String timeChk(String time, String code) throws Exception {
		long tm = Long.parseLong(time);
		System.out.println(otp.vaildate(code, "01055231605", tm));
		return "Test/ManageTest";
	}
	
}
