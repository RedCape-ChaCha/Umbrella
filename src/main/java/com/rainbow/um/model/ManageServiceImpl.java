package com.rainbow.um.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rainbow.um.common.SMSauth;
import com.rainbow.um.dto.ApplyDto;
import com.rainbow.um.dto.LoanDto;
import com.rainbow.um.dto.ResvUserDto;

/**
 * 
 * @author LGR
 * @since 19.11.25
 * @version 1.0.1
 * 대출관리 기능을 제어하는 class
 * 
 */
@Service
public class ManageServiceImpl implements IManageService{

	@Autowired
	private IManageDao dao;
	@Autowired
	private SMSauth sms;
	private Logger log = LoggerFactory.getLogger(ManageServiceImpl.class);
	
	/**
	 * 일반 대출
	 * @since 19.11.25
	 * @param Map user_number, book_aseq
	 * @return Map<String, String>
	 *  error 1 : 대출 + 예약 권수 3권 이상
	 *  error 2 : 연체중
	 *  error 3 : 대출실패
	 *  성공시 null 반환
	 */
	@Override
	public Map<String, String> loanInsert(Map<String, String> map) {
		log.info("일반 대출 신청 : {}", map.toString());
		Map<String, String> returnMap = new HashMap<String, String>();
		if(dao.loanSelectCount(map.get("user_number"))+dao.resvSelectCount(map.get("user_number"))+dao.applyCount(map.get("user_number"))>=3){
			returnMap.put("error", "1");
			returnMap.put("message", "대출,예약,웹대출 권 수 3권 이상");
		}else if(dao.overChk(map.get("user_number"))>0) {
			returnMap.put("error", "2");
			returnMap.put("message", "연체중");
		}else if(dao.loanInsert(map)>0?true:false){
			log.info("대출 성공 : {}", map.get("user_number"));
		}else {
			returnMap.put("error", "3");
			returnMap.put("message", "대출 실패");
		}
		return returnMap;
	}

	/**
	 * 일반 예약
	 * @since 19.11.25
	 * @param Map user_number, book_cseq
	 * @return Map<String, String>
	 *  error 1 : 대출중이지 않은 도서가 존재함
	 *  error 2 : 해당 도서가 이미 회원에게 대출중
	 *  error 3 : 대출 + 예약 권수 3권 이상
	 *  error 4 : 연체중
	 *  error 5 : 예약실패
	 *  성공시 null 반환
	 */
	@Override
	public Map<String, String> normalResvInsert(Map<String, String> map) {
		log.info("일반 예약 신청 : {}", map.toString());
		Map<String, String> returnMap = new HashMap<String, String>();
		if(dao.bookChkBorrow(map.get("book_cseq"))>0){
			returnMap.put("error", "1");
			returnMap.put("message", "현재 대출중이지 않은 도서가 있습니다.");
		}else if(dao.userChkBorrowBook(map)>0) {
			returnMap.put("error", "2");
			returnMap.put("message", "도서가 이미 회원님에게 대출중입니다.");
		}else if(dao.loanSelectCount(map.get("user_number"))+dao.resvSelectCount(map.get("user_number"))+dao.applyCount(map.get("user_number"))>=3){
			returnMap.put("error", "3");
			returnMap.put("message", "더이상 대출, 예약을 하실 수 없습니다.");
		}else if(dao.overChk(map.get("user_number"))>0) {
			returnMap.put("error", "4");
			returnMap.put("message", "회원님께선 현재 연체중입니다.");
		}else if(dao.resvInsertNomal(map)>0?true:false){
			log.info("예약 성공 : {}", map.get("user_number"));
		}else {
			returnMap.put("error", "5");
			returnMap.put("message", "예약 실패");
		}
		return returnMap;
	}

	/**
	 * 마일리지 예약
	 * @since 19.11.25
	 * @param Map user_number, book_cseq
	 * @return
	 *  error 1 : 대출중이지 않은 도서가 존재함
	 *  error 2 : 해당 도서가 이미 회원에게 대출중
	 *  error 3 : 대출 + 예약 권수 3권 이상
	 *  error 4 : 연체중
	 *  error 5 : 마일리지 부족
	 *  error 6 : 예약 실패
	 */
	@Override
	public Map<String, String> milgResvInsert(Map<String, String> map) {
		log.info("마일리지 예약 신청 : {}", map.toString());
		Map<String, String> returnMap = new HashMap<String, String>();
		if(dao.bookChkBorrow(map.get("book_cseq"))>0){
			returnMap.put("error", "1");
			returnMap.put("message", "현재 대출중이지 않은 도서가 있습니다.");
		}else if(dao.userChkBorrowBook(map)>0) {
			returnMap.put("error", "2");
			returnMap.put("message", "도서가 이미 회원님에게 대출중입니다.");
		}else if(dao.loanSelectCount(map.get("user_number"))+dao.resvSelectCount(map.get("user_number"))+dao.applyCount(map.get("user_number"))>=3){
			returnMap.put("error", "3");
			returnMap.put("message", "더이상 대출, 예약을 하실 수 없습니다.");
		}else if(dao.overChk(map.get("user_number"))>0) {
			returnMap.put("error", "4");
			returnMap.put("message", "회원님께선 현재 연체중입니다.");
		}else if(dao.mileageChk(map.get("user_number"))<300){
			returnMap.put("error", "5");
			returnMap.put("message", "마일리지가 부족합니다.");
		}else {
			dao.resvUpdateStepMileage(map.get("book_cseq"));
			boolean isc = dao.resvInsertMileage(map)>0?true:false;
			if(isc) {
				dao.milgDedcution(map.get("user_number"));
				log.info("마일리지 예약 성공 : {}", map.get("user_number"));
			}else {
				returnMap.put("error", "6");
				returnMap.put("message", "예약 실패");
			}
		}
		return returnMap;
	}

	/**
	 * 예약 취소
	 * @since 19.11.25
	 * @param String resv_seq
	 * @return boolean
	 */
	@Override
	public boolean cancleResv(String resv_seq) {
		log.info("마일리지 예약 취소 : {}", resv_seq);
		dao.resvUpdateStepCancle(resv_seq);
		return dao.resvUpdateCancle(resv_seq)>0?true:false;
	}

	/**
	 * 책 반납에 따른 연체, 예약 풀 기능
	 * @since 19.11.26
	 * @param Map user_number, book_aseq
	 * @return Map
	 * over = true : 연체된 회원 , over_count = ? : 연체일
	 * resv = true : 책이 예약리스트에 있음
	 * message = true : 메세지 전송 성공 / 실패시 그 이후의 작업이 되지않음
	 */
	@Override
	public Map<String, Object> returnBook(Map<String, String> map) {
		log.info("책 반납 : {}", map.toString());
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("over", false);
		returnMap.put("resv", false);
		
		// 관리자 반납일 경우엔 대출번호로 회원정보와 책의 정보를 가져오는 것이 필요함.
		if(map.get("loan_seq") != null) {
			LoanDto ldto = dao.selectLoanInfo(map.get("loan_seq"));
			map.put("user_number", ldto.getUser_number());
			map.put("book_aseq", ldto.getBook_aseq());
		}
		
		Integer count = dao.overDateChk(map);
		if(count!=null?true:false) {
			log.info("연체 된 회원임 : {}", map.toString());
			returnMap.put("over", true);
			returnMap.put("over_count", count);
			// 연체임
			map.put("over_count", String.valueOf(count));
			if(dao.overChk(map.get("user_number"))>0?true:false) {
				// 연체리스트 수정
				log.info("기존에 연체 이력이 있어서 연체 일 수 수정 : +{}", count);
				dao.overUpdate(map); // over_count, user_number
			}else {
				// 연체리스트추가
				log.info("연체중이 아닌 상태로 연체 데이터 생성");
				dao.overInset(map);
			}
		}
		// 대출 리스트 상태 수정
		dao.loanUpdateReturnChk(map);
		// 반납된 책이 예약 리스트에 잇는지 조회
		int chkResv = dao.resvChkBook(map.get("book_aseq"));
		if(chkResv>0) {
			log.info("반납된 책에 예약리스트에 존재");
			returnMap.put("resv", true);
			ResvUserDto dto = dao.chkUser(map);
			HashMap<String, String> message = new HashMap<String, String>();
			String bookName = dto.getBook_name();
			if(bookName.length()>8) {
				bookName = bookName.substring(0, 6) + "..";
			}
			message.put("to", dto.getUser_phone());
			message.put("text", "회원님께서 예약하신 도서 " + bookName + "가 현재 대출 가능한 상태입니다.");
			try {
				sms.send(message);
				log.info("1순위 예약 회원에게 메세지 전송");
				dao.resvUpdateStepBorrow(map.get("book_aseq"));
				returnMap.put("message", true);
			} catch (Exception e) {
				returnMap.put("message", false);
				log.info("메세지 전송 실패");
				e.printStackTrace();
			}
		}else {
			// 예약이 없을 경우에만 반납처리를 완벽하게 함
			log.info("예약이 없어 책 자체의 반납처리 완료");
			dao.conditionUpdateCancle(map.get("book_aseq"));
		}
		return returnMap;
	}

	/**
	 * 웹 도서 대출 신청
	 * @since 19.11.26
	 * @param Map
	 * @return Integer
	 * error 1 : 대출+예약 권 수 3권 이상
	 * error 2 : 연체중
	 * error 3 : 이미 동일한 책을 웹 대출 신청중임
	 * error 4 : 실패
	 */
	@Override
	public Map<String, String> applyInsert(Map<String, String> map) {
		log.info("웹 대출 신청 : {}", map.toString());
		Map<String, String> returnMap = new HashMap<String, String>();
		if(dao.loanSelectCount(map.get("user_number"))+dao.resvSelectCount(map.get("user_number"))+dao.applyCount(map.get("user_number"))>=3){
			returnMap.put("error", "1");
			returnMap.put("message", "대출,예약,웹대출 권 수 3권 이상");
		}else if(dao.overChk(map.get("user_number"))>0) {
			returnMap.put("error", "2");
			returnMap.put("message", "연체중");
		}else if(dao.applyChk(map)>0?true:false) {
			returnMap.put("error", "3");
			returnMap.put("message", "이미 동일한 책 대출중");
		}else if(dao.applyInsert(map)>0?true:false) {
			log.info("웹 대출 성공 : {}", map.get("user_number"));
		}else {
			returnMap.put("error", "4");
			returnMap.put("message", "웹 대출 신청 실패");
		}
		return returnMap;
	}

	/**
	 * 웹 도서 신청 취소
	 * @since 19.11.26
	 * @param Map
	 * @return boolean
	 */
	@Override
	public boolean applyUpdate(Map<String, String> map) {
		log.info("웹 대출 취소 및 불가 : {}", map.toString());
		return dao.applyUpdate(map)>0?true:false;
	}

	@Override
	public Integer countSelectApply(String user_number) {
		log.info("웹대출 권 수 조회 : {}", user_number);
		return dao.countSelectApply(user_number);
	}

	@Override
	public Integer countSelectHistory(String user_number) {
		log.info("이전에 빌린 내역 수 조회 : {}", user_number);
		return dao.countSelectHistory(user_number);
	}

	@Override
	public Integer resvSelectCount(String user_number) {
		log.info("예약중인 권 수 조회 : {}", user_number);
		return dao.resvSelectCount(user_number);
	}

	@Override
	public Integer loanSelectCount(String user_number) {
		log.info("대출중인 권 수 조회 : {}", user_number);
		return dao.loanSelectCount(user_number);
	}
	
	@Override
	public boolean overChk(String user_number) {
		log.info("해당 회원이 연체중인가 : {}", user_number);
		return dao.overChk(user_number)>0?true:false;
	}

	@Override
	public String comResv(String resv_seq) {
		log.info("취소할 예약과 회원이 동일한지확인 : {}", resv_seq);
		return dao.comResv(resv_seq);
	}

	@Override
	public String comApply(String apply_seq) {
		log.info("취소할 웹대출과 회원이 동일한지확인 : {}", apply_seq);
		return dao.comApply(apply_seq);
	}

	@Override
	public List<ApplyDto> lastWebHistory(String user_number) {
		log.info("이전 웹 대출 신청 목록 10건 : {}", user_number);
		return dao.lastWebHistory(user_number);
	}

}
