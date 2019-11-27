package com.rainbow.um.model;

import com.rainbow.um.dto.BookDto;
import com.rainbow.um.dto.ConditionDto;
import com.rainbow.um.dto.LoanDto;
import com.rainbow.um.dto.UserDto;

public interface IBookDao {

	public int bookInsert(BookDto dto);
	public int bookSelectCount(String cseq);
	public int conditionInsert(String cseq);
	public int bookUpdateImg(ConditionDto dto);
	public int bookUpdateCount(BookDto dto);
	public int conditionUpdateStorage(ConditionDto dto);
	public int conditionUpdateBorrow(ConditionDto dto);
	public BookDto bookSelectStorage(BookDto dto);
	public BookDto bookSelectList();
	public BookDto bookSelectOneBook(String cseq);
	public ConditionDto bookSelectOneBookCondition(String cseq);
	public UserDto userSmsReturn(LoanDto dto);
	public UserDto userResvStep(LoanDto dto);
	
	
	
	
	
}
