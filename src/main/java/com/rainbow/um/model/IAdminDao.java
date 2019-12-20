package com.rainbow.um.model;

import java.util.List;

import com.rainbow.um.dto.ApplyDto;
import com.rainbow.um.dto.LockcerDto;

public interface IAdminDao {
	public List<ApplyDto> applySelectList();
	public boolean applyUpdate(String apply_seq);
	public List<LockcerDto> lockerLists();
	public List<LockcerDto> LockcerSaved();
	public boolean lockerInsert(LockcerDto dto);
	public boolean lockerUpdate(LockcerDto dto);
	
}
