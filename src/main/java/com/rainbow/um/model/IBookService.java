package com.rainbow.um.model;

import java.util.List;

import com.rainbow.um.dto.BookDto;
import com.rainbow.um.dto.ConditionDto;
import com.rainbow.um.dto.LoanDto;
import com.rainbow.um.dto.UserDto;

public interface IBookService {

	public int bookInsert(BookDto dto);
	public int bookSelectCount(String cseq);
	public boolean conditionInsert(String cseq);
	public boolean bookUpdateImg(ConditionDto dto);
	public boolean bookUpdateCount(BookDto dto);
	public boolean bookDelete(ConditionDto dto);
	public boolean conditionUpdateStorage(ConditionDto dto);
	public boolean conditionUpdateBorrow(ConditionDto dto);
	public List<BookDto> bookSelectStorage(BookDto dto);
	public List<BookDto> bookSelectList();
	public BookDto bookSelectOneBook(String cseq);
	public List<ConditionDto> bookSelectOneBookCondition(String cseq);
	public List<UserDto> userSmsReturn(LoanDto dto);
	public UserDto userResvStep(LoanDto dto);
	
}
