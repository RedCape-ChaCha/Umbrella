package com.rainbow.um.model;

import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.um.common.PageModule;
import com.rainbow.um.dto.BoardDto;
import com.rainbow.um.dto.BobDto;
import com.rainbow.um.dto.QnaDto;
import com.rainbow.um.dto.ReplyDto;
import com.rainbow.um.dto.UserDto;
/**
 * 게시판 기능을 제어하는 class
 * @author kim93
 *
 */
@Service
public class BoardServiceImpl implements IBoardService {

	private final Logger log = LoggerFactory.getLogger(BoardServiceImpl.class);
	
	@Autowired
	private IBoardDao dao;
	
	/**
	 * <h2>Q&A 새글 등록</h2>
	 * @since 19.11.26
	 * @param 화면에서 입력받은 유저의 number, 제목,내용
	 * @return 성공여부 성공true &#47; 실패 false
	 */
	@Override
	public boolean qnaInsert(QnaDto dto) {
		log.info("qnaInsert Q&A 새글 등록 : {}",dto);
		return dao.qnaInsert(dto);
	}

	/**
	 * <h2>Q&A 상세 조회</h2>
	 * @since 19.11.26
	 * @param 글의 seq
	 * @return 상세글 정보 DTO
	 */
	@Override
	public List<QnaDto> qnaSelect(String qna_seq) {
		log.info("qnaSelect Q&A 상세 조회 : {}",qna_seq);
		return dao.qnaSelect(qna_seq);
	}

	/**
	 * <h2>Q&A 전체 조회 (페이징)</h2>
	 * @since 19.12.10
	 * @param 유저의 number,유저권한, 페이지 start, 개시글수
	 * @return 글 전체 리스트
	 */
	@Override
	public List<QnaDto> qnaList(PageModule pg,UserDto udto) {
		log.info("qnaList Q&A 전체 조회(페이징) : {} {}",pg,udto);
		return dao.qnaList(pg,udto);
	}
	
	/**
	 * <h2>Q&A 답글 작성</h2>
	 * @since 19.11.26
	 * @param 화면에서 입력받은 user_number,seq,내용
	 * @return 성공여부 성공true &#47; 실패 false
	 */
	@Override
	public boolean replyInsert(ReplyDto dto) {
		log.info("replyInsert Q&A 전체 조회(페이징) : {}",dto);
		return dao.replyInsert(dto);
	}

	/**
	 * <h2>공지사항 글 작성</h2>
	 * @since 19.11.26
	 * @param 화면에서 입력받은 아이디, 제목,내용
	 * @return 성공여부 성공true &#47; 실패 false
	 */
	@Override
	public boolean noticeInsert(BoardDto dto) {
		log.info("noticeInsert 공지사항 글 작성 : {}",dto);
		return dao.noticeInsert(dto);
	}

	/**
	 * <h2>공지사항 글 수정</h2>
	 * @since 19.11.26
	 * @param 화면에서 입력받은 seq, 제목,내용
	 * @return 성공여부 성공true &#47; 실패 false
	 */
	@Override
	public boolean noticeUpdate(BoardDto dto) {
		log.info("noticeUpdate 공지사항 글 수정 : {}",dto);
		return dao.noticeUpdate(dto);
	}

	/**
	 * <h2>공지사항 글 상세 조회</h2>
	 * @since 19.11.26
	 * @param 글의 seq
	 * @return 상세글 정보 DTO
	 */
	@Override
	public BoardDto noticeSelect(String board_seq) {
		log.info("noticeSelect 공지사항 글 상세 조회 : {}",board_seq);
		return dao.noticeSelect(board_seq);
	}

	/**
	 * <h2>공지사항 전체 조회(페이징)</h2>
	 * @since 19.11.26
	 * @param 페이지 start, 게시글수
	 * @return 글 전체 리스트
	 */
	@Override
	public List<BoardDto> noticeList(PageModule pg) {
		log.info("noticeList 공지사항 전체 조회 : {}",pg);
		return dao.noticeList(pg);
	}

	/**
	 * <h2>추천도서 상세 조회</h2>
	 * @since 19.11.26
	 * @param 글의 seq
	 * @return 상세글 정보 DTO
	 */
	@Override
	public BoardDto bobSelectOne(String board_seq) {
		log.info("bobSelectOne 추천도서 상세 조회 : {}",board_seq);
		dao.boardSelectReadCnt(board_seq);
		return dao.bobSelectOne(board_seq);
	}

	/**
	 * <h2>추천도서 전체 조회(페이징)</h2>
	 * @since 19.11.26
	 * @param 페이지 start, 게시글수
	 * @return 글 전체 리스트
	 */
	@Override
	public List<BoardDto> bobList(PageModule pg) {
		log.info("bobList 추천도서 전체 조회 : {}",pg);
		return dao.bobList(pg);
	}

	/**
	 * <h2>Q&A 전체 갯수</h2>
	 * @since 19.11.26
	 * @param 페이지 start, 게시글수
	 * @return 글 전체 리스트
	 */
	@Override
	public Integer qnaSelectTotalCnt(UserDto udto) {
		log.info("qnaSelectTotalCnt Q&A 전체 갯수 : {}",new Date());
		return dao.qnaSelectTotalCnt(udto);
	}

	/**
	 * <h2>Board 전체 갯수</h2>
	 * @since 19.11.26
	 * @param 페이지 start, 게시글수
	 * @return 글 전체 리스트
	 */
	@Override
	public Integer boardSelectTotalCnt(String board_type) {
		log.info("boardSelectTotalCnt Board 전체 갯수 : {}",board_type);
		return dao.boardSelectTotalCnt(board_type);
	}

	/**
	 * <h2>대출 베스트 조회</h2>
	 * @since 19.12.19
	 * @return 전체 리스트
	 */
	@Override
	public List<BobDto> bobLoanList() {
		log.info("bobLoanList BOB 전체 갯수 : {}",new Date());
		return dao.bobLoanList();
	}
	
}
