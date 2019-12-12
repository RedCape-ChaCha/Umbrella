package com.rainbow.um.dto;

import java.io.Serializable;
import java.util.Date;

public class LoanDto implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String loan_seq;
	private String book_name;
	private String user_number;
	private String book_aseq;
	private String loan_date;
	private Date return_date;
	private String return_check;
	 
	public LoanDto() {
		// TODO Auto-generated constructor stub
	}

	public LoanDto(String loan_seq, String book_name, String user_number, String book_aseq, String loan_date,
			Date return_date, String return_check) {
		super();
		this.loan_seq = loan_seq;
		this.book_name = book_name;
		this.user_number = user_number;
		this.book_aseq = book_aseq;
		this.loan_date = loan_date;
		this.return_date = return_date;
		this.return_check = return_check;
	}

	public String getLoan_seq() {
		return loan_seq;
	}

	public void setLoan_seq(String loan_seq) {
		this.loan_seq = loan_seq;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getUser_number() {
		return user_number;
	}

	public void setUser_number(String user_number) {
		this.user_number = user_number;
	}

	public String getBook_aseq() {
		return book_aseq;
	}

	public void setBook_aseq(String book_aseq) {
		this.book_aseq = book_aseq;
	}

	public String getLoan_date() {
		return loan_date;
	}

	public void setLoan_date(String loan_date) {
		this.loan_date = loan_date;
	}

	public Date getReturn_date() {
		return return_date;
	}

	public void setReturn_date(Date return_date) {
		this.return_date = return_date;
	}

	public String getReturn_check() {
		return return_check;
	}

	public void setReturn_check(String return_check) {
		this.return_check = return_check;
	}

	@Override
	public String toString() {
		return "LoanDto [loan_seq=" + loan_seq + ", book_name=" + book_name + ", user_number=" + user_number
				+ ", book_aseq=" + book_aseq + ", loan_date=" + loan_date + ", return_date=" + return_date
				+ ", return_check=" + return_check + "]";
	}
	
	

}
