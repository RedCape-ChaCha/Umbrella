package com.rainbow.um.ctrl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.rainbow.um.dto.BookDto;
import com.rainbow.um.dto.ConditionDto;
import com.rainbow.um.model.IBookService;

@Controller
public class BookController {

	@Autowired
	IBookService service;
	
	@RequestMapping(value = "/testBook.do", method = RequestMethod.GET)
	public String home() {
		return "/Test/testBook";
	}
	@RequestMapping(value = "/searchSub.do", method = RequestMethod.GET)
	public String searchSub() {
		return "searchSub";
	}

	
	@RequestMapping(value = "/bookSelectList.do", method =RequestMethod.GET)
	public String bookSelectList(Model model) {
			List<BookDto> lists=service.bookSelectList();
			model.addAttribute( "lists",lists);
			return "/Test/testBookList";
	}
	
	
	@RequestMapping(value = "/bookSelectStorage.do", method =RequestMethod.GET)
	public String bookSelectStorage(Model model,BookDto dto) {
		List<BookDto> lists=service.bookSelectStorage(dto);
		model.addAttribute( "lists",lists);
		/* model.addAttribute("Llenght", lists.size()); */
		return "searchDetail";
		
	}
	@RequestMapping(value = "/bookSelectStorageA.do", method =RequestMethod.POST)
	@ResponseBody
	public Map<String,List<BookDto>> bookSelectStorageA(BookDto dto) {
		System.out.println(dto);
		List<BookDto> lists=service.bookSelectStorage(dto);
		Map<String,List<BookDto>> map = new HashMap<String, List<BookDto>>();
		map.put("lists", lists);
		return map;
	}
	@RequestMapping(value = "/bookch.do", method =RequestMethod.POST)
	@ResponseBody
	public Map<String,List<ConditionDto>> bookch(String cseq) {
		List<ConditionDto> lists=service.bookSelectOneBookCondition(cseq);
		Map<String,List<ConditionDto>> map = new HashMap<String, List<ConditionDto>>();
		map.put("lists", lists);
		return map;
	}

	
	
	@RequestMapping(value = "/bookSelectOneBook.do", method =RequestMethod.GET)
	public String bookSelectOneBook(Model model,String cseq) {
		BookDto Bdto=service.bookSelectOneBook(cseq);
		List<ConditionDto> Clists =service.bookSelectOneBookCondition(cseq);
		model.addAttribute("dto",Bdto);
		model.addAttribute("lists",Clists);
		return "bookDetail";
	}
	@RequestMapping(value = "/conditionInsert.do", method =RequestMethod.GET)
	public String conditionInsert(Model model,String cseq,String num) {
		service.conditionInsert(cseq, num);
		BookDto Bdto=service.bookSelectOneBook(cseq);
		List<ConditionDto> Clists =service.bookSelectOneBookCondition(cseq);
		model.addAttribute("dto",Bdto);
		model.addAttribute("lists",Clists);
		return "/Test/testBookDetail";
	}
	
	@RequestMapping(value = "/bookInsert.do", method =RequestMethod.GET)
	public String bookInsert(Model model,BookDto dto) {
		int n=service.bookInsert(dto);
		BookDto Bdto=null;
		if (n>0) {
			Bdto=service.bookSelectOneBook(String.valueOf(service.maxSeq()));
		}
		model.addAttribute( "dto",Bdto);
		return "/Test/testBookInsert";
	}
	
	@RequestMapping(value = "/bookDel.do", method =RequestMethod.GET,produces ="application/text; charset=UTF-8")
	@ResponseBody
	public String bookDel(String aseq) {
		ConditionDto dto=new ConditionDto();
		dto.setBook_aseq(aseq);
		dto.setCondition_storage("D");
		return service.conditionUpdateStorage(dto)?"true":"false";
	}
	
	
}
