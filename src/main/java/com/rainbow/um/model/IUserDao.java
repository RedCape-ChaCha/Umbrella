package com.rainbow.um.model;

import java.util.List;
import java.util.Map;

import com.rainbow.um.dto.ApplyDto;
import com.rainbow.um.dto.LoanListDto;
import com.rainbow.um.dto.PayDto;
import com.rainbow.um.dto.ResvDto;
import com.rainbow.um.dto.UserDto;

public interface IUserDao {
	//일반 회원 로그인
	public UserDto  userLogin(UserDto dto);
	//api 회원 로그인
	public UserDto apiLogin(UserDto dto);
	//일반 회원가입
	public boolean userInsert(UserDto dto);
	//api 회원가입
	public boolean apiInsert(UserDto dto);
	//이메일 중복 체크
	public boolean emailChk(String user_email);
	//아이디 찾기
	public String findId(String user_phone);
	//비밀번호 찾기
	public UserDto pwFind(UserDto dto);
	//비밀번호수정
	public boolean pwUpdate(UserDto dto);
	//전체회원조회
	public List<UserDto> allUserList();
	//회원상세조회
	public UserDto userSelect(Map<String, String> map);
	//개인정보 수정
	public boolean userUpdate(UserDto dto);
	//회원 권한 수정
	public boolean userUpdateGrade(Map<String, String> map);
	//회원 탈퇴
  public boolean userUpdateDel(String user_email);
	// 결제 완료시 결제 내역 추가
	public Integer pay(PayDto pDto);
	// 환불 전 마일리지 잔액 체크
	public Integer checkMilg(String user_number);
	// 환불시 환불 내	역 추가
	public Integer refund(String pay_seq);
	// 결제/환불 시 마일리지 추가/제거
	public Integer milgControll(Map<String, Object> map);
	
	//회원상세조회 대출중 도서
	//회원상제조회 예약중 도서
	public List<LoanListDto> userSelectLoan(String user_number);
	public List<ResvDto> userSelectResv(String user_number);
	public List<ApplyDto> userSelectWeb(String user_number);
	public List<LoanListDto> userSelectHistory(Map<String,Object> map);
	
	
	
	
}
