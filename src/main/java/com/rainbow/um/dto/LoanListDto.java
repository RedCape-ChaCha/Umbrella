package com.rainbow.um.dto;

import java.io.Serializable;

/*
 * 대출 리스트 조회 (비반납만 조회, 전체조회)
 */
public class LoanListDto implements Serializable{
	
	private static final long serialVersionUID = -4966872949124620104L;
	private String book_name;
	private String loan_date;
	private String return_date;
	private String return_check;

	public LoanListDto() {
		// TODO Auto-generated constructor stub
	}

	public LoanListDto(String book_name, String loan_date, String return_date, String return_check) {
		super();
		this.book_name = book_name;
		this.loan_date = loan_date;
		this.return_date = return_date;
		this.return_check = return_check;
	}

	@Override
	public String toString() {
		return "LoanListDto [book_name=" + book_name + ", loan_date=" + loan_date + ", return_date=" + return_date
				+ ", return_check=" + return_check + "]";
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getLoan_date() {
		return loan_date;
	}

	public void setLoan_date(String loan_date) {
		this.loan_date = loan_date;
	}

	public String getReturn_date() {
		return return_date;
	}

	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}

	public String getReturn_check() {
		return return_check;
	}

	public void setReturn_check(String return_check) {
		this.return_check = return_check;
	}
	
	
	

}

