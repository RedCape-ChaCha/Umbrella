package com.rainbow.um.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.rainbow.um.dto.BoardDto;
import com.rainbow.um.dto.BookDto;
import com.rainbow.um.dto.QnaDto;
import com.rainbow.um.dto.ReplyDto;


public class BoardDaoImpl implements IBoardDao {

	@Autowired
	private SqlSessionTemplate session;
	
	private final String NS = "com.rainbow.um.model.IBoardDao.";
	
	@Override
	public boolean qnaInsert(QnaDto dto) {
		int n = session.insert(NS+"qnaInsert", dto);
		return n>0?true:false; 
	}

	@Override
	public QnaDto qnaSelect(String qna_seq) {
		return session.selectOne(NS+"qnaSelect", qna_seq);
	}

	@Override
	public List<QnaDto> qnaList(Map<String, String> map) {
		return session.selectList(NS+"qnaList", map);
	}

	@Override
	public boolean replyInsert(ReplyDto dto) {
		int n = session.insert(NS+"replyInsert",dto);
		return n>0?true:false; 
	}

	@Override
	public boolean noticeInsert(BoardDto dto) {
		int n = session.insert(NS+"noticeInsert",dto);
		return n>0?true:false;
	}

	@Override
	public boolean noticeUpdate(BoardDto dto) {
		int n = session.update(NS+"noticeUpdate", dto);
		return n>0?true:false;
	}

	@Override
	public BoardDto noticeSelect(String board_seq) {
		return session.selectOne(NS+"noticeSelect",board_seq);
	}

	@Override
	public List<BoardDto> noticeList(Map<String, String> map) {
		return session.selectList(NS+"noticeList", map);
	}

	@Override
	public boolean bobInsert(BoardDto dto) {
		int n = session.insert(NS+"bobInsert",dto);
		return n>0?true:false;
	}

	@Override
	public BookDto bobLoanList() {
		return session.selectOne(NS+"bobLoanList");
	}

	@Override
	public BoardDto bobSelectOne(String board_seq) {
		return session.selectOne(NS+"bobSelectOne",board_seq);
	}

	@Override
	public List<BoardDto> bobList(Map<String, String> map) {
		return session.selectList(NS+"bobList", map);
	}

	@Override
	public Integer qnaSelectTotalCnt() {
		return session.selectOne(NS+"qnaSelectTotalCnt");
	}

	@Override
	public Integer boardSelectTotalCnt(String board_seq) {
		return session.selectOne(NS+"BoardSelectTotalCnt");
	}

	@Override
	public boolean boardSelectReadCnt(String board_seq) {
		int n = session.update(NS+"boardSelectReadCnt",board_seq);
		return n>0?true:false;
	}

}
