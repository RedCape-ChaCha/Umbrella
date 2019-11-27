package com.rainbow.um.model;

import java.util.Map;

public interface IManageService {
	
	public Integer loanInsert(Map<String, String> map);
	public Integer normalResvInsert(Map<String, String> map);
	public Integer milgResvInsert(Map<String, String> map);
	public boolean cancleResv(String resv_seq);
	public Map<String, Object> returnBook(Map<String, String> map);
	public Integer applyInsert(Map<String, String> map);
	public boolean applyUpdate(Map<String, String> map);
	
}
