package com.rainbow.um.ctrl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rainbow.um.model.IManageService;

@Controller
public class ManageController {
	
	@Autowired
	private IManageService manage;
	
	@RequestMapping(value = "/testManage.do", method = RequestMethod.GET)
	public String home() {
		return "ManageTest";
	}
	
	@RequestMapping(value = "/loan.do", method = RequestMethod.GET)
	public String loan() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_number", "2");
		map.put("book_aseq", "2");
		int i = manage.loanInsert(map);
		System.out.println(i);
		return "ManageTest";
	}
	
	@RequestMapping(value = "/apply.do", method = RequestMethod.GET)
	public String apply() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_number", "2");
		map.put("book_cseq","3");
		System.out.println("웹 대출 신청 성공 여부");
		System.out.println(manage.applyInsert(map));
		return "ManageTest";
	}
	
	@RequestMapping(value = "/applyCancle.do", method = RequestMethod.GET)
	public String applyCancle() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_number", "2");
		map.put("book_cseq","3");
		System.out.println("웹 대출 취소 성공 여부");
		System.out.println(manage.applyUpdate(map));
		return "ManageTest";
	}
	
	@RequestMapping(value = "/return.do", method = RequestMethod.GET)
	public String return3() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_number", "2");
		map.put("book_aseq", "2");
		System.out.println(manage.returnBook(map));
		return "ManageTest";
	}
	
	@RequestMapping(value = "/resv.do", method = RequestMethod.GET)
	public String resv() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_number", "2");
		map.put("book_cseq", "2");
		System.out.println(manage.normalResvInsert(map));
		return "ManageTest";
	}
	
	@RequestMapping(value = "/milgResv.do", method = RequestMethod.GET)
	public String milgResv() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_number", "2");
		map.put("book_cseq", "2");
		System.out.println(manage.milgResvInsert(map));
		return "ManageTest";
	}
	
	@RequestMapping(value = "/cancleResv.do", method = RequestMethod.GET)
	public String cancleResv() {
		System.out.println("마일리지 예약 취소");
		System.out.println(manage.cancleResv("3"));
		return "ManageTest";
	}
}
