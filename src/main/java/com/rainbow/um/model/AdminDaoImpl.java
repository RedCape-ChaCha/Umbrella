package com.rainbow.um.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rainbow.um.dto.ApplyDto;

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

}
