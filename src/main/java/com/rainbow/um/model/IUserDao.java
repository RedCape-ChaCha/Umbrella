package com.rainbow.um.model;

import java.util.List;
import java.util.Map;

import com.rainbow.um.dto.LoanListDto;
import com.rainbow.um.dto.ResvDto;
import com.rainbow.um.dto.UserDto;

public interface IUserDao {
	//일반 회원 로그인
	public UserDto  userLogin(UserDto dto);
	//api 회원 로그인
	public UserDto apiLogin(UserDto dto);
	//이메일 중복 체크
	public UserDto emailChk(String user_email);
}
