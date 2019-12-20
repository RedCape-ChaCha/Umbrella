package com.rainbow.um.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rainbow.um.dto.ApplyDto;
import com.rainbow.um.dto.LockcerDto;

@Repository
public class AdminDaoImpl implements IAdminDao {
	
	@Autowired
	private SqlSessionTemplate session;
	
	private final String NS = "com.rainbow.um.model.IAdminDao.";

	@Override
	public List<ApplyDto> applySelectList() {
		List<ApplyDto> lists = session.selectList(NS+"applySelectList");
		return lists;
	}

	@Override
	public List<LockcerDto> lockerLists() {
		return session.selectList(NS+"lockerLists");
	}

	@Override
	public boolean lockerInsert(LockcerDto dto) {
		return session.insert(NS+"lockerInsert",dto)>0?true:false;
	}

	@Override
	public boolean lockerUpdate(LockcerDto dto) {
		return session.update(NS+"lockerUpdate",dto)>0?true:false;
	}

	@Override
	public List<LockcerDto> LockcerSaved() {
		return session.selectList(NS+"LockcerSaved");
	}

}
