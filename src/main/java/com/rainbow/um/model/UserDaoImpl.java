package com.rainbow.um.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rainbow.um.dto.LoanListDto;
import com.rainbow.um.dto.ResvDto;
import com.rainbow.um.dto.UserDto;

@Repository
public class UserDaoImpl implements IUserDao{


	private String NS = "com.rainbow.um.model.IUserDao.";
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public UserDto userLogin(UserDto dto) {
		return session.selectOne(NS+"userLogin",dto);
	}
	
	@Override
	public UserDto apiLogin(UserDto dto) {
		return session.selectOne(NS+"apiLogin",dto);
	}

	@Override
	public UserDto emailChk(String user_email) {
		return session.selectOne(NS+"emailChk",user_email);
	}



	


}
