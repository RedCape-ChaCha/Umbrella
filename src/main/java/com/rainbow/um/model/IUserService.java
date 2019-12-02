package com.rainbow.um.model;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.rainbow.um.dto.LoanListDto;
import com.rainbow.um.dto.ResvDto;
import com.rainbow.um.dto.UserDto;

public interface IUserService {
	//일반 회원 로그인
	public UserDto  userLogin(UserDto dto);
	//api 회원 로그인
	public UserDto apiLogin(UserDto dto);
	//전체회원조회
	public List<UserDto> allUserList();
	//일반 회원가입
	public boolean userInsert(UserDto dto);
	//이메일 중복 체크
	public boolean emailChk(String user_email);
	//회원상세조회
	public UserDto userSelect(Map<String, String> map);
}
