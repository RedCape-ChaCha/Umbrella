package com.rainbow.um.model;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rainbow.um.dto.FileDto;

@Service
public class CommonServiceImpl implements ICommonService{

	@Autowired
	private ICommonDao dao;
	private Logger log = LoggerFactory.getLogger(ManageServiceImpl.class);

	@Override
	public boolean uploadFile(FileDto fdto) {
		log.info("파일 업로드 정보 : {}", fdto.toString());
		return dao.uploadFile(fdto)>0?true:false;
	}
	
	
}
