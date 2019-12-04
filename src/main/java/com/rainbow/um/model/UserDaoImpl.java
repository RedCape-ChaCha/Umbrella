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
	public UserDto userLogin(Map<String, String> map) {
		return session.selectOne(NS+"userLogin",map);
	}
	
	@Override
	public UserDto apiLogin(UserDto dto) {
		return session.selectOne(NS+"apiLogin",dto);
	}

	@Override
	public boolean userInsert(UserDto dto) {
		int cnt = session.insert(NS+"userInsert",dto);
		return cnt > 0 ? true : false;
	}
	@Override
	public boolean emailChk(String user_email) {
		return session.selectOne(NS+"emailChk",user_email) == null ? true : false;
	}

	@Override
	public UserDto userSelect(Map<String, String> map) {
		return session.selectOne(NS+"userSelect",map);
	}

	@Override
	public List<UserDto> allUserList() {
		return session.selectList(NS+"allUserList");
	}

	@Override
	public boolean userUpdate(UserDto dto) {
		int cnt = session.update(NS+"userUpdate",dto);
		return cnt>0?true:false;
	}

	@Override
	public boolean userUpdateDel(String user_email) {
		int cnt = session.update(NS+"userUpdateDel",user_email);
		return cnt>0 ? true : false;
	}

	@Override
	public boolean userUpdateGrade(Map<String, String> map) {
		int cnt = session.update(NS+"userUpdateGrade",map);
		return cnt > 0 ? true : false;
	}




	


}
