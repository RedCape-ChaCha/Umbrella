package com.rainbow.um.model;

import java.util.List;
import java.util.Map;

import com.rainbow.um.dto.LoanListDto;
import com.rainbow.um.dto.ResvDto;
import com.rainbow.um.dto.UserDto;

public interface IUserDao {
	//일반 회원 로그인
	public UserDto userLogin(Map<String, String> map);
	//api 회원 로그인
	public UserDto apiLogin(UserDto dto);
	//일반 회원가입
	public boolean userInsert(UserDto dto);
	//api 회원가입
	//이메일 중복 체크
	public boolean emailChk(String user_email);
	//비밀번호 찾기
	//비밀번호수정
	//전체회원조회
	public List<UserDto> allUserList();
	//회원상세조회
	public UserDto userSelect(Map<String, String> map);
	//회원상세조회 대출중 도서
	//회원상제조회 예약중 도서
	//개인정보 수정
	public boolean userUpdate(UserDto dto);
	//회원 권한 수정
	public boolean userUpdateGrade(Map<String, String> map);
	//회원 탈퇴
	public boolean userUpdateDel(String user_email);
}
