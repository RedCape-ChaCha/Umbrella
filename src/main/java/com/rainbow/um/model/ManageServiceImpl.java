package com.rainbow.um.model;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.rainbow.um.common.SMSauth;
import com.rainbow.um.dto.ResvUserDto;

/**
 * 대출관리 기능을 제어하는 class
 * @since 19.11.25
 * @author LGR
 * @version 1.0.1
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
	 * @return 
	 *  1 : 대출 + 예약 권수 3권 이상
	 *  2 : 연체중
	 *  3 : 대출완료
	 *  4 : 대출실패
	 */
	@Override
	public Integer loanInsert(Map<String, String> map) {
		log.info("일반 대출 신청 : {}", map.toString());
		if(dao.loanSelectCount(map.get("user_number"))+dao.resvSelectCount(map.get("user_number"))>=3){
			return 1;
		}else if(dao.overChk(map.get("user_number"))>0) {
			return 2;
		}else if(dao.loanInsert(map)>0?true:false){
			return 3;
		}else {
			return 4;
		}
	}

	/**
	 * 일반 예약
	 * @since 19.11.25
	 * @param Map user_number, book_cseq
	 * @return
	 *  1 : 대출중이지 않은 도서가 존재함
	 *  2 : 해당 도서가 이미 회원에게 대출중
	 *  3 : 대출 + 예약 권수 3권 이상
	 *  4 : 연체중
	 *  5 : 예약완료
	 *  6 : 예약실패
	 */
	@Override
	public Integer normalResvInsert(Map<String, String> map) {
		log.info("일반 예약 신청 : {}", map.toString());
		if(dao.bookChkBorrow(map.get("book_cseq"))>0){
			return 1;
		}else if(dao.userChkBorrowBook(map)>0) {
			return 2;
		}else if(dao.loanSelectCount(map.get("user_number"))+dao.resvSelectCount(map.get("user_number"))>=3){
			return 3;
		}else if(dao.overChk(map.get("user_number"))>0) {
			return 4;
		}else if(dao.resvInsertNomal(map)>0?true:false){
			return 5;
		}else {
			return 6;
		}
	}

	/**
	 * 마일리지 예약
	 * @since 19.11.25
	 * @param Map user_number, book_cseq
	 * @return
	 *  1 : 대출중이지 않은 도서가 존재함
	 *  2 : 해당 도서가 이미 회원에게 대출중
	 *  3 : 대출 + 예약 권수 3권 이상
	 *  4 : 연체중
	 *  5 : 마일리지 부족
	 *  6 : 예약성공
	 *  7 : 예약 실패
	 */
	@Override
	@Transactional
	public Integer milgResvInsert(Map<String, String> map) {
		log.info("마일리지 예약 신청 : {}", map.toString());
		if(dao.bookChkBorrow(map.get("book_cseq"))>0){
			return 1;
		}else if(dao.userChkBorrowBook(map)>0) {
			return 2;
		}else if(dao.loanSelectCount(map.get("user_number"))+dao.resvSelectCount(map.get("user_number"))>=3){
			return 3;
		}else if(dao.overChk(map.get("user_number"))>0) {
			return 4;
		}else if(dao.mileageChk(map.get("user_number"))<300){
			return 5;
		}
		dao.resvUpdateStepMileage(map.get("book_cseq"));
		boolean isc = dao.resvInsertMileage(map)>0?true:false;
		if(isc) {
			return 6;
		}else {
			return 7;
		}
	}

	/**
	 * 예약 취소
	 * @since 19.11.25
	 * @param String resv_seq
	 * @return boolean
	 */
	@Override
	public boolean cancleResv(String resv_seq) {
		log.info("마일리지 예약 신청 : {}", resv_seq);
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
	 */
	@Override
	public Map<String, Object> returnBook(Map<String, String> map) {
		log.info("책 반납 : {}", map.toString());
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("over", false);
		returnMap.put("resv", false);
		
		int count = dao.overDateChk(map);
		if(count>0?true:false) {
			returnMap.put("over", true);
			returnMap.put("over_count", count);
			// 연체임
			map.put("over_count", String.valueOf(count));
			if(dao.overChk(map.get("user_number"))>0?true:false) {
				// 연체리스트 수정
				dao.overUpdate(map); // over_count, user_number
			}else {
				// 연체리스트추가
				dao.overInset(map);
			}
		}
		// 대출 리스트 상태 수정
		dao.loanUpdateReturnChk(map);
		// 반납된 책이 예약 리스트에 잇는지 조회
		int chkResv = dao.resvChkBook(map.get("book_aseq"));
		if(chkResv>0) {
			returnMap.put("resv", true);
			ResvUserDto dto = dao.chkUser(map);
			HashMap<String, String> message = new HashMap<String, String>();
			message.put("to", dto.getUser_phone());
			message.put("text", "회원님께서 예약하신 도서 " + dto.getBook_name() + "가 현재 대출 가능한 상태입니다.");
			try {
				sms.send(message);
			} catch (Exception e) {
				e.printStackTrace();
			}
			dao.resvUpdateStepBorrow(map.get("book_aseq"));
		}else {
			// 예약이 없을 경우에만 반납처리를 완벽하게 함
			dao.conditionUpdateCancle(map.get("book_aseq"));
		}
		return returnMap;
	}

	/**
	 * 웹 도서 대출 신청
	 * @since 19.11.26
	 * @param Map
	 * @return boolean
	 */
	@Override
	public boolean applyInsert(Map<String, String> map) {
		return dao.applyInsert(map)>0?true:false;
	}

	/**
	 * 웹 도서 신청 취소
	 * @since 19.11.26
	 * @param Map
	 * @return boolean
	 */
	@Override
	public boolean applyUpdate(Map<String, String> map) {
		return dao.applyUpdate(map)>0?true:false;
	}

}