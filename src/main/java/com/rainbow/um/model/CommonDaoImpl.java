package com.rainbow.um.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rainbow.um.dto.FileDto;

@Repository
public class CommonDaoImpl implements ICommonDao{
	
	@Autowired
	private SqlSessionTemplate session;
	private final String NS = "com.rainbow.um.model.ICommonDao.";

	@Override
	public Integer uploadFile(FileDto fdto) {
		return session.insert(NS+"uploadFile",fdto);
	}

}
