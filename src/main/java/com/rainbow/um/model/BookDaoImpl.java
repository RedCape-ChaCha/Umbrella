package com.rainbow.um.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rainbow.um.dto.BookDto;
import com.rainbow.um.dto.ConditionDto;
import com.rainbow.um.dto.LoanDto;
import com.rainbow.um.dto.UserDto;

@Repository
public class BookDaoImpl implements IBookDao{

	private String NS="com.rainbow.um.model.IBookDao."; 
	
	@Autowired
	SqlSessionTemplate service;
	
	@Override
	public int bookInsert(BookDto dto) {
		return service.insert(NS+"bookInsert",dto);
	}

	@Override
	public int bookSelectCount(String cseq) {
		return service.selectOne(NS+"bookSelectCount",cseq);
	}

	@Override
	public int conditionInsert(String cseq) {
		return service.insert(NS+"conditionInsert",cseq);
	}

	@Override
	public int bookUpdateImg(ConditionDto dto) {
		return service.update(NS+"bookUpdateImg",dto);
	}

	@Override
	public int bookUpdateCount(BookDto dto) {
		return service.update(NS+"bookUpdateCount",dto);
	}

	@Override
	public int conditionUpdateStorage(ConditionDto dto) {
		return service.update(NS+"conditionUpdateStorage",dto);
	}

	@Override
	public int conditionUpdateBorrow(ConditionDto dto) {
		return service.update(NS+"conditionUpdateBorrow",dto);
	}

	@Override
	public List<BookDto> bookSelectStorage(BookDto dto) {
		return service.selectList(NS+"bookSelectStorage",dto);
	}

	@Override
	public List<BookDto> bookSelectList() {
		return  service.selectList(NS+"bookSelectList");
	}

	@Override
	public BookDto bookSelectOneBook(String cseq) {
	 return service.selectOne(NS+"bookSelectOneBook",cseq);
	}

	@Override
	public List<ConditionDto> bookSelectOneBookCondition(String cseq) {
		return service.selectList(NS+"bookSelectOneBookCondition",cseq);
	}

	@Override
	public List<UserDto> userSmsReturn(LoanDto dto) {
		return service.selectList(NS+"userSmsReturn",dto);
	}

	@Override
	public UserDto userResvStep(LoanDto dto) {
		return (UserDto) service.selectList(NS+"userResvStep",dto).get(0);
	}

}
