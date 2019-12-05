package com.rainbow.um.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.um.dto.LoanListDto;
import com.rainbow.um.dto.PayDto;
import com.rainbow.um.dto.PayListDto;
import com.rainbow.um.dto.ResvDto;
import com.rainbow.um.dto.UserDto;

@Service
public class UserServiceImpl implements IUserService{

	private Logger log= LoggerFactory.getLogger(UserServiceImpl.class);
	
	@Autowired
	private IUserDao dao;

	@Override
	public UserDto userLogin(Map<String, String> map) {
		log.info("UserServiceImpl 일반 회원 로그인 : ",map);
		return dao.userLogin(map);
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
	@Override
	public List<PayDto> selectPaylist(PayListDto plDto) {
		log.info("결제 리스트 조회");
		return dao.selectPaylist(plDto);
	}
	
	@Override
	public Integer countPayList(PayListDto plDto) {
		log.info("결제 리스트 조회할 총 갯수 확인");
		return dao.countPayList(plDto);
	}
	@Override
	public boolean pay(PayDto pDto, Integer amount) {
		log.info("결제 진행 : {}", pDto.getUser_number());
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_number", pDto.getUser_number());
		map.put("amount", amount);
		dao.milgControll(map);
		log.info("마일리지 추가 완료 : {}", amount);
		return dao.pay(pDto)>0?true:false;
	}
	@Override
	public Integer refund(Map<String, Object> map) {
		log.info("환불 진행 : {}", map.get("user_number"));
		if((Integer)map.get("amount") < dao.checkMilg((String)map.get("user_number"))) {
			dao.milgControll(map);
			return dao.refund((String)map.get("pay_seq"));
		}else {
			log.info("마일리지 부족");
			return 999;
		}
	}

}
