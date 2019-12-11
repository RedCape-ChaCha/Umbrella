package com.rainbow.um.dto;

import java.io.Serializable;
import java.util.Date;

public class ResvDto implements Serializable{

	private static final long serialVersionUID = -3387714070513956283L;
	private String resv_seq;
	private String user_number;
	private String book_cseq;
	private String step;
	private String milg_check;
	private String resv_date;
	private String loan_check;
	private String book_name;
	
	public ResvDto() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public String toString() {
		return "ResvDto [resv_seq=" + resv_seq + ", user_number=" + user_number + ", book_cseq=" + book_cseq + ", step="
				+ step + ", milg_check=" + milg_check + ", resv_date=" + resv_date + ", loan_check=" + loan_check
				+ ", book_name=" + book_name + "]";
	}

	public ResvDto(String resv_seq, String user_number, String book_cseq, String step, String milg_check,
			String resv_date, String loan_check, String book_name) {
		super();
		this.resv_seq = resv_seq;
		this.user_number = user_number;
		this.book_cseq = book_cseq;
		this.step = step;
		this.milg_check = milg_check;
		this.resv_date = resv_date;
		this.loan_check = loan_check;
		this.book_name = book_name;
	}

	public String getResv_seq() {
		return resv_seq;
	}

	public void setResv_seq(String resv_seq) {
		this.resv_seq = resv_seq;
	}

	public String getUser_number() {
		return user_number;
	}

	public void setUser_number(String user_number) {
		this.user_number = user_number;
	}

	public String getBook_cseq() {
		return book_cseq;
	}

	public void setBook_cseq(String book_cseq) {
		this.book_cseq = book_cseq;
	}

	public String getStep() {
		return step;
	}

	public void setStep(String step) {
		this.step = step;
	}

	public String getMilg_check() {
		return milg_check;
	}

	public void setMilg_check(String milg_check) {
		this.milg_check = milg_check;
	}

	public String getResv_date() {
		return resv_date;
	}

	public void setResv_date(String resv_date) {
		this.resv_date = resv_date;
	}

	public String getLoan_check() {
		return loan_check;
	}

	public void setLoan_check(String loan_check) {
		this.loan_check = loan_check;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	
	

}
