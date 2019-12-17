package com.rainbow.um.model;

import java.util.List;
import java.util.Map;

import com.rainbow.um.dto.ApplyDto;
import com.rainbow.um.dto.LoanDto;
import com.rainbow.um.dto.MilgHistory;
import com.rainbow.um.dto.PayDto;

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
	public String comResv(String resv_seq);
	public String comApply(String apply_seq);
	public List<ApplyDto> lastWebHistory(String user_number);
	public String getNumberApply(String apply_seq);
	public String tossOrderNo();
	public Integer insertToss(Map<String, String> map);
	public Integer updateToss(Map<String, String> map);
	public Integer milgControll(Map<String, Object> map);
	public String getMilege(String user_number);
	public String getAmount(String pay_seq);
	public List<MilgHistory> SelectMilgHistory(String user_number);
	public List<PayDto> SelectPayList(String user_number);
	public String SelectPayToken(Map<String, String> map);
	public Integer insertRefund(String pay_seq, Map<String, Object> map);
	
}
