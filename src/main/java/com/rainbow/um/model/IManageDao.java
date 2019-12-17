package com.rainbow.um.model;

import java.util.List;
import java.util.Map;

import com.rainbow.um.dto.ApplyDto;
import com.rainbow.um.dto.LoanDto;
import com.rainbow.um.dto.MilgHistory;
import com.rainbow.um.dto.PayDto;
import com.rainbow.um.dto.ResvUserDto;

public interface IManageDao {
	
	public Integer loanSelectCount(String user_number);
	public Integer resvSelectCount(String user_number);
	public Integer overChk(String user_number);
	public Integer loanInsert(Map<String, String> map);
	public Integer bookChkBorrow(String book_cseq);
	public Integer userChkBorrowBook(Map<String, String> map);
	public Integer resvInsertNomal(Map<String, String> map);
	public Integer mileageChk(String user_number);
	public Integer resvUpdateStepMileage(String book_cseq);
	public Integer resvInsertMileage(Map<String, String> map);
	public Integer resvUpdateStepCancle(String resv_seq);
	public Integer resvUpdateCancle(String resv_seq);
	public Integer conditionUpdateCancle(String book_aseq);
	public Integer loanUpdateReturnChk(Map<String, String> map);
	public Integer overInset(Map<String, String> map);
	public Integer overUpdate(Map<String, String> map);
	public Integer resvChkBook(String book_cseq);
	public Integer resvUpdateStepBorrow(String book_cseq);
	public Integer resvUpdateStepFirst(String book_cseq);
	public Integer applyInsert(Map<String, String> map);
	public Integer applyUpdate(Map<String, String> map);
	public Integer overDateChk(Map<String, String> map);
	public ResvUserDto chkUser(Map<String, String> map);
	public Integer applyChk(Map<String, String> map);
	public Integer applyCount(String user_number);
	public Integer milgDedcution(String user_number);
	public Integer countSelectApply(String user_number);
	public Integer countSelectHistory(String user_number);
	public String comResv(String resv_seq);
	public String comApply(String apply_seq);
	public List<ApplyDto> lastWebHistory(String user_number);
	public String selectLoanInfo(String book_aseq);
	public String getNumber(String user_email);
	public String getNumberApply(String apply_seq);
	public String tossOrderNo();
	public Integer insertToss(Map<String, String> map);
	public Integer updateToss(Map<String, String> map);
	public Integer milgControll(Map<String, Object> map);
	public String getMilege(String user_number);
	public String getAmount(String pay_seq);
	public Integer InsertMilgHistory(Map<String, Object> map);
	public List<MilgHistory> SelectMilgHistory(String user_number);
	public List<PayDto> SelectPayList(String user_number);
	public String SelectPayToken(Map<String, String> map);
	public Integer insertRefund(String pay_seq);
	
}
