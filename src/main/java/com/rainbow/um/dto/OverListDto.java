package com.rainbow.um.dto;

import java.io.Serializable;

/*
 * 개인 예약 내역 조회 (예약중인 / 예약 전체)
 */
public class OverListDto implements Serializable{

	private static final long serialVersionUID = -216624001257130782L;
	private String book_name;
	private String resv_date;
	private String milg_check;
	private String loan_check;
	
	public OverListDto() {
	}
	
	public OverListDto(String book_name, String resv_date, String milg_check, String loan_check) {
		super();
		this.book_name = book_name;
		this.resv_date = resv_date;
		this.milg_check = milg_check;
		this.loan_check = loan_check;
	}

	@Override
	public String toString() {
		return "OverListDto [book_name=" + book_name + ", resv_date=" + resv_date + ", milg_check=" + milg_check
				+ ", loan_check=" + loan_check + "]";
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getResv_date() {
		return resv_date;
	}

	public void setResv_date(String resv_date) {
		this.resv_date = resv_date;
	}

	public String getMilg_check() {
		return milg_check;
	}

	public void setMilg_check(String milg_check) {
		this.milg_check = milg_check;
	}

	public String getLoan_check() {
		return loan_check;
	}

	public void setLoan_check(String loan_check) {
		this.loan_check = loan_check;
	}
	
	

}
