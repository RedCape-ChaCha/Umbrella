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
	public boolean userInsert(UserDto dto) {
		log.info("UserServiceImpl 일반 회원 가입 : ",dto);
		return dao.userInsert(dto);
	}

	@Override
	public boolean emailChk(String user_email) {
		log.info("UserServiceImple emailChk \t : {}", user_email);
		return dao.emailChk(user_email);
	}
	@Override
	public UserDto userSelect(Map<String, String> map) {
		log.info("UserServiceImple userSelect \t : {}", map);
		return dao.userSelect(map);
	}
	@Override
	public List<UserDto> allUserList() {
		log.info("UserServiceImple allUserList \t : {}");
		return dao.allUserList();
	}
	@Override
	public boolean userUpdate(UserDto dto) {
		log.info("UserServiceImple userUpdate \t : {}");
		return dao.userUpdate(dto);
	}
	@Override
	public boolean userUpdateDel(String user_email) {
		log.info("UserServiceImple userUpdateDel \t : {}");
		return dao.userUpdateDel(user_email);
	}
	@Override
	public boolean userUpdateGrade(Map<String, String> map) {
		log.info("UserServiceImple userUpdateGrade \t : {}");
		return dao.userUpdateGrade(map);
	}




	

}
