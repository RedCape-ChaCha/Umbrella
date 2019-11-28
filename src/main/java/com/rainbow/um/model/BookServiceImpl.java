package com.rainbow.um.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.um.dto.BookDto;
import com.rainbow.um.dto.ConditionDto;
import com.rainbow.um.dto.LoanDto;
import com.rainbow.um.dto.UserDto;

@Service
public class BookServiceImpl  implements IBookService{

	@Autowired
	IBookDao dao;

	@Override
	public int bookInsert(BookDto dto) {
		int cntB = dao.bookInsert(dto);
		int cntC = dao.bookSelectCount(dto.getBook_cseq());
		for (int i = 0; i < cntC; i++) {
			dao.conditionInsert(dto.getBook_cseq());
		}
		return cntB;
	}

	@Override
	public int bookSelectCount(String cseq) {
		return dao.bookSelectCount(cseq);
	}

	@Override
	public boolean conditionInsert(String cseq) {
		return dao.conditionInsert(cseq)>0?true:false;
	}

	@Override
	public boolean bookUpdateImg(ConditionDto dto) {
		return dao.bookUpdateImg(dto)>0?true:false;
	}

	@Override
	public boolean bookUpdateCount(BookDto dto) {
		int cntO =dao.bookSelectCount(dto.getBook_cseq());
		dao.bookUpdateCount(dto);
		int cntU =dao.bookSelectCount(dto.getBook_cseq());
		return cntO!=cntU&&cntU==dto.getBook_count()?true:false;
	}

	@Override
	public boolean bookDelete(ConditionDto dto) {
		int cntO =dao.bookSelectCount(dto.getBook_cseq());
		if (dao.conditionUpdateStorage(dto)>0) {
			BookDto Bdto = new BookDto();
			Bdto.setBook_cseq(dto.getBook_cseq());
			Bdto.setBook_count(cntO-1);
			dao.bookUpdateCount(Bdto);			
		}
		int cntU =dao.bookSelectCount(dto.getBook_cseq());
		return cntO!=cntU?true:false;
	}

	@Override
	public boolean conditionUpdateStorage(ConditionDto dto) {
		return dao.conditionUpdateStorage(dto)>0?true:false;
	}

	@Override
	public boolean conditionUpdateBorrow(ConditionDto dto) {
		return dao.conditionUpdateBorrow(dto)>0?true:false;
	}

	@Override
	public List<BookDto> bookSelectStorage(BookDto dto) {
		return dao.bookSelectStorage(dto);
	}

	@Override
	public List<BookDto> bookSelectList() {
		return dao.bookSelectList();
	}

	@Override
	public BookDto bookSelectOneBook(String cseq) {
		return dao.bookSelectOneBook(cseq);
	}

	@Override
	public List<ConditionDto> bookSelectOneBookCondition(String cseq) {
		return dao.bookSelectOneBookCondition(cseq);
	}

	@Override
	public List<UserDto> userSmsReturn(LoanDto dto) {
		return dao.userSmsReturn(dto);
	}

	@Override
	public UserDto userResvStep(LoanDto dto) {
		return dao.userResvStep(dto);
	}
	
	
	
}
