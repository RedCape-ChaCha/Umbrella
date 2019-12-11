package com.rainbow.um.model;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		return session.update(NS+"milgDedcution", user_number);
	}

	@Override
	public Integer countSelectApply(String user_number) {
		return session.selectOne(NS+"countSelectApply",user_number);
	}

	@Override
	public Integer countSelectHistory(String user_number) {
		// TODO Auto-generated method stub
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

}
