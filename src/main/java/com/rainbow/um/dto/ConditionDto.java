package com.rainbow.um.dto;

import java.io.Serializable;
import java.util.Date;

public class ConditionDto implements Serializable {
	
	private static final long serialVersionUID = 2135072109435409138L;
	private String book_aseq;
	private String book_cseq;
	private String condition_storage;
	private String condition_borrow;
	private Date book_date;
	
	public ConditionDto() {
	}

	public ConditionDto(String book_aseq, String book_cseq, String condition_storage, String condition_borrow,
			Date book_date) {
		super();
		this.book_aseq = book_aseq;
		this.book_cseq = book_cseq;
		this.condition_storage = condition_storage;
		this.condition_borrow = condition_borrow;
		this.book_date = book_date;
	}

	public String getBook_aseq() {
		return book_aseq;
	}

	public void setBook_aseq(String book_aseq) {
		this.book_aseq = book_aseq;
	}

	public String getBook_cseq() {
		return book_cseq;
	}

	public void setBook_cseq(String book_cseq) {
		this.book_cseq = book_cseq;
	}

	public String getCondition_storage() {
		return condition_storage;
	}

	public void setCondition_storage(String condition_storage) {
		this.condition_storage = condition_storage;
	}

	public String getCondition_borrow() {
		return condition_borrow;
	}

	public void setCondition_borrow(String condition_borrow) {
		this.condition_borrow = condition_borrow;
	}

	public Date getBook_date() {
		return book_date;
	}

	public void setBook_date(Date book_date) {
		this.book_date = book_date;
	}

	@Override
	public String toString() {
		return "ConditionDto [book_aseq=" + book_aseq + ", book_cseq=" + book_cseq + ", condition_storage="
				+ condition_storage + ", condition_borrow=" + condition_borrow + ", book_date=" + book_date + "]";
	}
	
	
	
}
