package com.rainbow.um.model;

import java.util.List;

import com.rainbow.um.dto.ApplyDto;

public interface IAdminDao {
	public List<ApplyDto> applySelectList();
}
