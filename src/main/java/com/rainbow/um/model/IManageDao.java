package com.rainbow.um.model;

import java.util.List;
import java.util.Map;

import com.rainbow.um.dto.ApplyDto;

public interface IManageDao {
	
	public Integer loanSelectCount(String user_number);
	public Integer resvSelectCount(String user_number);
	public Integer overChk(String user_number);
	public Integer loanInsert(Map<String, String> map);
	public Integer bookChkBorrow(String book_cseq);
	public Integer userChkBorrowBook(Map<String, String> map);
	public Integer resvInsertNomal(Map<String, String> map);
	public Integer mileageChk(String book_cseq);
	public Integer resvUpdateStepMileage(String book_cseq);
	public Integer resvInsertMileage(Map<String, String> map);
	public Integer resvUpdateStepCancle(String resv_seq);
	public Integer resvUpdateCancle(String resv_sq);
	public Integer conditionUpdateCancle(String book_aseq);
	public Integer loanUpdateReturnChk(Map<String, String> map);
	public Integer overInset(Map<String, String> map);
	public Integer overUpdate(Map<String, String> map);
	public Integer resvChkBook(String book_cseq);
	public Integer resvUpdateStepBorrow(String book_cseq);
	public Integer resvUpdateStepFirst(String book_cseq);
	public Integer applyInsert(Map<String, String> map);
	public Integer applyUpdate(Map<String, String> map);
	public List<ApplyDto> applySelectList();

}
