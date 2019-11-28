package com.rainbow.um.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainbow.um.dto.BookDto;
import com.rainbow.um.model.IBookService;

@Controller
public class BookController {

	@Autowired
	IBookService service;
	
	@RequestMapping(value = "/testBook.do", method = RequestMethod.GET)
	public String home() {
		return "/Test/testBook";
	}

	
	@RequestMapping(value = "/bookSelectList.do", method =RequestMethod.POST)
	@ResponseBody 
	public Map<String, List<BookDto>> bookSelectList(String seq) {
		Map<String, List<BookDto>> bookSelectList= new HashMap<String,List<BookDto>>();
			List<BookDto> lists=service.bookSelectList();
		bookSelectList.put("String",lists);	
		return bookSelectList;
	}
	
	
}
