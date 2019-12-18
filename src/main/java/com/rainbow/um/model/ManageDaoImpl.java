package com.rainbow.um.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.rainbow.um.dto.ApplyDto;
import com.rainbow.um.dto.LoanDto;
import com.rainbow.um.dto.MilgHistory;
import com.rainbow.um.dto.PayDto;
import com.rainbow.um.dto.ResvUserDto;

@Repository
public class ManageDaoImpl implements IManageDao{
	
	@Autowired
	private SqlSessionTemplate session;
	private final String NS = "com.rainbow.um.model.IManageDao.";

	@Override
	public Integer loanSelectCount(String user_number) {
		return session.selectOne(NS+"loanSelectCount",user_number);
	}

	@Override
	public Integer resvSelectCount(String user_number) {
		return session.selectOne(NS+"resvSelectCount",user_number);
	}

	@Override
	public Integer overChk(String user_number) {
		return session.selectOne(NS+"overChk",user_number);
	}

	@Override
	public Integer loanInsert(Map<String, String> map) {
		return session.insert(NS+"loanInsert",map);
	}

	@Override
	public Integer bookChkBorrow(String book_cseq) {
		return session.selectOne(NS+"bookChkBorrow",book_cseq);
	}

	@Override
	public Integer userChkBorrowBook(Map<String, String> map) {
		return session.selectOne(NS+"userChkBorrowBook",map);
	}

	@Override
	public Integer resvInsertNomal(Map<String, String> map) {
		return session.insert(NS+"resvInsertNomal",map);
	}

	@Override
	public Integer mileageChk(String user_number) {
		return session.selectOne(NS+"mileageChk",user_number);
	}

	@Override
	public Integer resvUpdateStepMileage(String book_cseq) {
		return session.update(NS+"resvUpdateStepMileage",book_cseq);
	}

	@Override
	public Integer resvInsertMileage(Map<String, String> map) {
		return session.insert(NS+"resvInsertMileage",map);
	}

	@Override
	public Integer resvUpdateStepCancle(String resv_seq) {
		return session.update(NS+"resvUpdateStepCancle",resv_seq);
	}

	@Override
	public Integer resvUpdateCancle(String resv_seq) {
		return session.update(NS+"resvUpdateCancle",resv_seq);
	}

	@Override
	public Integer conditionUpdateCancle(String book_aseq) {
		return session.update(NS+"conditionUpdateCancle", book_aseq);
	}

	@Override
	public Integer loanUpdateReturnChk(Map<String, String> map) {
		return session.update(NS+"loanUpdateReturnChk",map);
	}

	@Override
	public Integer overInset(Map<String, String> map) {
		return session.insert(NS+"overInset",map);
	}

	@Override
	public Integer overUpdate(Map<String, String> map) {
		return session.update(NS+"overUpdate",map);
	}

	@Override
	public Integer resvChkBook(String book_cseq) {
		return session.selectOne(NS+"resvChkBook",book_cseq);
	}

	@Override
	public Integer resvUpdateStepBorrow(String book_cseq) {
		return session.update(NS+"resvUpdateStepBorrow",book_cseq);
	}

	@Override
	public Integer resvUpdateStepFirst(String book_cseq) {
		return session.update(NS+"resvUpdateStepFirst",book_cseq);
	}

	@Override
	public Integer applyInsert(Map<String, String> map) {
		return session.insert(NS+"applyInsert",map);
	}

	@Override
	public Integer applyUpdate(Map<String, String> map) {
		return session.update(NS+"applyUpdate",map);
	}

	@Override
	public Integer overDateChk(Map<String, String> map) {
		return session.selectOne(NS+"overDateChk", map);
	}

	@Override
	public ResvUserDto chkUser(Map<String, String> map) {
		return session.selectOne(NS+"chkUser", map);
	}

	@Override
	public Integer applyChk(Map<String, String> map) {
		return session.selectOne(NS+"applyChk",map);
	}

	@Override
	public Integer applyCount(String user_number) {
		return session.selectOne(NS+"applyCount",user_number);
	}

	@Override
	public Integer milgDedcution(String user_number) {
		Map<String, Object> milgMap = new HashMap<String, Object>();
		milgMap.put("amount", -300);
		milgMap.put("user_number", user_number);
		InsertMilgHistory(milgMap);
		return session.update(NS+"milgDedcution", user_number);
	}

	@Override
	public Integer countSelectApply(String user_number) {
		return session.selectOne(NS+"countSelectApply",user_number);
	}

	@Override
	public Integer countSelectHistory(String user_number) {
		return session.selectOne(NS+"countSelectHistory",user_number);
	}

	@Override
	public String comResv(String resv_seq) {
		return session.selectOne(NS+"comResv", resv_seq);
	}

	@Override
	public String comApply(String apply_seq) {
		return session.selectOne(NS+"comApply", apply_seq);
	}

	@Override
	public List<ApplyDto> lastWebHistory(String user_number) {
		return session.selectList(NS+"lastWebHistory", user_number);
	}

	@Override
	public String selectLoanInfo(String book_aseq) {
		return session.selectOne(NS+"selectLoanInfo", book_aseq);
	}

	@Override
	public String getNumber(String user_email) {
		return session.selectOne(NS+"getNumber", user_email);
	}

	@Override
	public String getNumberApply(String apply_seq) {
		return session.selectOne(NS+"getNumberApply", apply_seq);
	}

	@Override
	public String tossOrderNo() {
		return session.selectOne(NS+"tossOrderNo");
	}

	@Override
	public Integer insertToss(Map<String, String> map) {
		return session.insert(NS+"insertToss", map);
	}

	@Override
	public Integer updateToss(Map<String, String> map) {
		return session.update(NS+"updateToss", map);
	}

	@Override
	public Integer milgControll(Map<String, Object> map) {
		session.update(NS+"milgControll", map);
		InsertMilgHistory(map);
		return 1;
	}

	@Override
	public String getMilege(String user_number) {
		return session.selectOne(NS+"getMilege", user_number);
	}

	@Override
	public String getAmount(String pay_seq) {
		return session.selectOne(NS+"getAmount", pay_seq);
	}

	@Override
	public Integer InsertMilgHistory(Map<String, Object> map) {
		return session.insert(NS+"InsertMilgHistory", map);
	}

	@Override
	public List<MilgHistory> SelectMilgHistory(Map<String, Object> map) {
		return session.selectList(NS+"SelectMilgHistory",map);
	}

	@Override
	public List<PayDto> SelectPayList(Map<String, Object> map) {
		return session.selectList(NS+"SelectPayList", map);
	}

	@Override
	public String SelectPayToken(Map<String, String> map) {
		return session.selectOne(NS+"SelectPayToken", map);
	}

	@Override
	public Integer insertRefund(String pay_seq) {
		return session.insert(NS+"insertRefund", pay_seq);
	}

	@Override
	public Integer countUseMilg(String user_number) {
		return session.selectOne(NS+"countUseMilg", user_number);
	}

	@Override
	public Integer countPaylist(String user_number) {
		return session.selectOne(NS+"countPaylist", user_number);
	}

	@Override
	public Integer chkLoanlist(String user_number) {
		return session.selectOne(NS+"chkLoanlist", user_number);
	}

	@Override
	public Integer webApplyCountChk(String book_cseq) {
		return session.selectOne(NS+"webApplyCountChk", book_cseq);
	}

}
