package com.rainbow.um.model;

import java.util.List;
import java.util.Map;

import com.rainbow.um.dto.BoardDto;
import com.rainbow.um.dto.BookDto;
import com.rainbow.um.dto.QnaDto;
import com.rainbow.um.dto.ReplyDto;

public interface IBoardDao {

	public boolean qnaInsert(QnaDto dto);
	public QnaDto qnaSelect(String qna_seq);
	public List<QnaDto> qnaList(Map<String, String> map);
	public boolean replyInsert(ReplyDto dto);
	public boolean noticeInsert(BoardDto dto);
	public boolean noticeUpdate(BoardDto dto);
	public BoardDto noticeSelect(String board_seq);
	public List<BoardDto> noticeList(Map<String, String> map);
	public boolean bobInsert(BoardDto dto);
	public BookDto bobLoanList();
	public BoardDto bobSelectOne(String board_seq);
	public List<BoardDto> bobList(Map<String, String> map);
	public Integer qnaSelectTotalCnt();
	public Integer boardSelectTotalCnt(String board_type);
	public boolean boardSelectReadCnt(String board_seq);
	
	
	
}
