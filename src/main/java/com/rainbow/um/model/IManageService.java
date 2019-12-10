package com.rainbow.um.model;

import java.util.Map;

public interface IManageService {
	
	public Map<String, String> loanInsert(Map<String, String> map);
	public Map<String, String> normalResvInsert(Map<String, String> map);
	public Map<String, String> milgResvInsert(Map<String, String> map);
	public boolean cancleResv(String resv_seq);
	public Map<String, Object> returnBook(Map<String, String> map);
	public Map<String, String> applyInsert(Map<String, String> map);
	public boolean applyUpdate(Map<String, String> map);
	public Integer countSelectApply(String user_number);
	public Integer countSelectHistory(String user_number);
	public Integer resvSelectCount(String user_number);
	public Integer loanSelectCount(String user_number);
	public boolean overChk(String user_number);
	
}
