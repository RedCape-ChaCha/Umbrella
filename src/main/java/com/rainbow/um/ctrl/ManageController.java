package com.rainbow.um.ctrl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.rainbow.um.model.IManageService;

public class ManageController {
	
	@Autowired
	private IManageService manage;
	
	@RequestMapping(value = "/testManage.do", method = RequestMethod.GET)
	public String home() {
		return "ManageTest";
	}
	
	@RequestMapping(value = "/loan.login", method = RequestMethod.GET)
	public String loan() {
		Map<String,String> map = new HashMap<String, String>();
		map.put("user_number", "2");
		map.put("book_aseq", "2");
		int i = manage.loanInsert(map);
		System.out.println(i);
		return "ManageTest";
	}

}
