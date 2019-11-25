package com.rainbow.um.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.rainbow.um.dto.BoardDto;
import com.rainbow.um.dto.BookDto;
import com.rainbow.um.dto.QnaDto;
import com.rainbow.um.dto.ReplyDto;
/**
 * 게시판 기능을 제어하는 class
 * @author kim93
 *
 */
public class BoardServiceImpl implements IBoardService {

	private final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	private IBoardDao dao;
	
	/**
	 * <h2>Q&A 새글 등록</h2>
	 * @param 화면에서 입력받은 아이디, 제목,내용
	 * @return 성공여부 성공true &#47; 실패 false
	 */
	@Override
	public boolean qnaInsert(QnaDto dto) {
		log.info("qnaInsert Q&A 새글 등록 : {}",dto);
		return dao.qnaInsert(dto);
	}

	/**
	 * <h2>Q&A 상세 조회</h2>
	 * @param 글의 seq
	 * @return 상세글 정보 DTO
	 */
	@Override
	public QnaDto qnaSelect(String qna_seq) {
		log.info("qnaInsert Q&A 상세 조회 : {}",qna_seq);
		return dao.qnaSelect(qna_seq);
	}

	/**
	 * <h2>Q&A 전체 조회 (페이징)</h2>
	 * @param 글의 seq
	 * @return 상세글 정보 DTO
	 */
	@Override
	public List<QnaDto> qnaList(Map<String, String> map) {
		
		return null;
	}

	@Override
	public boolean replyInsert(ReplyDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean noticeInsert(BoardDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean noticeUpdate(BoardDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public BoardDto noticeSelect(String board_seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDto> noticeList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean bobInsert(BoardDto dto) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public BookDto bobLoanList() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public BoardDto bobSelectOne(String board_seq) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<BoardDto> bobList(Map<String, String> map) {
		// TODO Auto-generated method stub
		return null;
	}

}
