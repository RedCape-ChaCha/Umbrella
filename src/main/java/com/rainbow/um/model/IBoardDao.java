package com.rainbow.um.model;

import java.util.List;
import java.util.Map;

import com.rainbow.um.common.PageModule;
import com.rainbow.um.dto.BoardDto;
import com.rainbow.um.dto.BookDto;
import com.rainbow.um.dto.QnaDto;
import com.rainbow.um.dto.ReplyDto;

public interface IBoardDao {

	public boolean qnaInsert(QnaDto dto);
	public List<QnaDto> qnaSelect(String qna_seq);
	public List<QnaDto> qnaList(PageModule pg,String user_number);
	public boolean replyInsert(ReplyDto dto);
	public boolean noticeInsert(BoardDto dto);
	public boolean noticeUpdate(BoardDto dto);
	public BoardDto noticeSelect(String board_seq);
	public List<BoardDto> noticeList(PageModule pg);
	public boolean bobInsert(BoardDto dto);
	public BookDto bobLoanList();
	public BoardDto bobSelectOne(String board_seq);
	public List<BoardDto> bobList(PageModule pg);
	public Integer qnaSelectTotalCnt();
	public Integer boardSelectTotalCnt(String board_type);
	public boolean boardSelectReadCnt(String board_seq);
	
	
	
}
