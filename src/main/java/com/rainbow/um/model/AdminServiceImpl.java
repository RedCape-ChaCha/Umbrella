package com.rainbow.um.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.um.dto.ApplyDto;
import com.rainbow.um.dto.LockcerDto;

/**
 * 관리자 권한 서비스
 * @author LGR
 * @version 1.0.0
 * 
 */
@Service
public class AdminServiceImpl implements IAdminService {
	
	@Autowired
	private IAdminDao dao;
	private Logger log = LoggerFactory.getLogger(AdminServiceImpl.class);

	/**
	 * 웹 대출 신청중인 회원 목록 조회
	 * @since 19.11.27
	 * @return List
	 */
	@Override
	public List<ApplyDto> applySelectList() {
		log.info("웹 대출 신청중인 회원 목록 조회");
		return dao.applySelectList();
	}

	@Override
	public List<LockcerDto> lockerLists() {
		return dao.lockerLists();
	}

	@Override
	public boolean lockerInsert(LockcerDto dto) {
		return dao.lockerInsert(dto);
	}

	@Override
	public boolean lockerUpdate(LockcerDto dto) {
		return dao.lockerUpdate(dto);
	}

	@Override
	public List<LockcerDto> LockcerSaved() {
		return dao.LockcerSaved();
	}

	@Override
	public boolean applyUpdate(String apply_seq) {
		return dao.applyUpdate(apply_seq);
	}

}
