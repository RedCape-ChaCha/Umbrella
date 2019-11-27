package com.rainbow.um.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.um.dto.LoanListDto;
import com.rainbow.um.dto.ResvDto;
import com.rainbow.um.dto.UserDto;

@Service
public class UserServiceImpl implements IUserService{

	private Logger log= LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private IUserDao dao;

	@Override
	public UserDto userLogin(UserDto dto) {
		log.info("UserServiceImpl 일반 회원 로그인 : ",dto);
		return dao.userLogin(dto);
	}
	@Override
	public UserDto apiLogin(UserDto dto) {
		log.info("UserServiceImpl api 회원 로그인 : ",dto);
		return dao.apiLogin(dto);
	}

	@Override
	public UserDto emailChk(String user_email) {
		log.info("UserServiceImple duplicateId \t : {}", user_email);
		return dao.emailChk(user_email);
	}




	

}
