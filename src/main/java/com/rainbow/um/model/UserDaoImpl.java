package com.rainbow.um.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

import com.rainbow.um.dto.ApplyDto;
import com.rainbow.um.dto.LoanListDto;
import com.rainbow.um.dto.PayDto;
import com.rainbow.um.dto.ResvDto;
import com.rainbow.um.dto.UserDto;

@Repository
public class UserDaoImpl implements IUserDao{

	private String NS = "com.rainbow.um.model.IUserDao.";
	
	@Autowired
	private SqlSessionTemplate session;
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public UserDto userLogin(UserDto dto) {
		UserDto LDto = null;
		String pw = session.selectOne(NS+"ecPasswordLogin",dto);
		String inputPw = dto.getUser_password();
		String enPassword = passwordEncoder.encode(dto.getUser_password());
		System.out.println(dto.getUser_password()+":"+enPassword);
		if(passwordEncoder.matches(inputPw, pw)) {
			System.out.println("일치");
			LDto = session.selectOne(NS+"userLogin",dto);
		}else {
			System.out.println("불일치");
		}
		return LDto;
	}
	
	@Override
	public UserDto apiLogin(UserDto dto) {
		return session.selectOne(NS+"apiLogin",dto);
	}
	
	@Override
	public boolean userInsert(UserDto dto) {
		String enPassword = passwordEncoder.encode(dto.getUser_password());
		dto.setUser_password(enPassword);
		int cnt = session.insert(NS+"userInsert",dto);
		return cnt > 0 ? true : false;
	}
	
	@Override
	public boolean apiInsert(UserDto dto) {
		int cnt = session.insert(NS+"apiInsert",dto);
		return cnt > 0 ? true : false;
	}
  
	@Override
	public boolean emailChk(String user_email) {
		return session.selectOne(NS+"emailChk",user_email) == null ? true : false;
	}
	
	@Override
	public String findId(String user_phone) {
		return  session.selectOne(NS+"findId",user_phone);
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
	public Integer pay(PayDto pDto) {
		return session.insert(NS+"pay", pDto);
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

	@Override
	public Integer checkMilg(String user_number) {
		return session.selectOne(NS+"checkMilg", user_number);
	}

	@Override
	public Integer refund(String pay_seq) {
		return session.insert(NS+"refund", pay_seq);
	}

	@Override
	public Integer milgControll(Map<String, Object> map) {
		return session.update(NS+"milgControll", map);
	}

	@Override
	public List<LoanListDto> userSelectLoan(String user_number) {
		return session.selectList(NS+"userSelectLoan", user_number);
	}

	@Override
	public List<ResvDto> userSelectResv(String user_number) {
		return session.selectList(NS+"userSelectResv", user_number);
	}

	@Override
	public List<ApplyDto> userSelectWeb(String user_number) {
		return session.selectList(NS+"userSelectWeb", user_number);
	}

	@Override
	public List<LoanListDto> userSelectHistory(Map<String,Object> map) {
		return session.selectList(NS+"userSelectHistory", map);
	}

	@Override
	public UserDto pwFind(UserDto dto) {
		String enPassword = passwordEncoder.encode(dto.getUser_password());
		dto.setUser_password(enPassword);
		return session.selectOne(NS+"pwFind",dto);
	}

	@Override
	public boolean pwUpdate(UserDto dto) {
		String enPassword = passwordEncoder.encode(dto.getUser_password());
		dto.setUser_password(enPassword);
		int cnt = session.update(NS+"pwUpdate",dto);
		return cnt > 0 ? true : false;
	}





}
