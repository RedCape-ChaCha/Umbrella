package com.rainbow.um.dto;

public class LockcerDto {

	private String locker_seq;
	private String place_seq;
	private String user_email;
	private String user_number;
	private String locker_number;
	private String lock_time;
	private String loan_check;
	private String book_aseq;
	private String book_name;
	private String lock_loan;
	
	public LockcerDto() {
	}

	public String getLocker_seq() {
		return locker_seq;
	}

	public void setLocker_seq(String locker_seq) {
		this.locker_seq = locker_seq;
	}

	public String getPlace_seq() {
		return place_seq;
	}

	public void setPlace_seq(String place_seq) {
		this.place_seq = place_seq;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_number() {
		return user_number;
	}

	public void setUser_number(String user_number) {
		this.user_number = user_number;
	}

	public String getLocker_number() {
		return locker_number;
	}

	public void setLocker_number(String locker_number) {
		this.locker_number = locker_number;
	}

	public String getLock_time() {
		return lock_time;
	}

	public void setLock_time(String lock_time) {
		this.lock_time = lock_time;
	}

	public String getLoan_check() {
		return loan_check;
	}

	public void setLoan_check(String loan_check) {
		this.loan_check = loan_check;
	}

	public String getBook_aseq() {
		return book_aseq;
	}

	public void setBook_aseq(String book_aseq) {
		this.book_aseq = book_aseq;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getLock_loan() {
		return lock_loan;
	}

	public void setLock_loan(String lock_loan) {
		this.lock_loan = lock_loan;
	}

	@Override
	public String toString() {
		return "LockcerDto [locker_seq=" + locker_seq + ", place_seq=" + place_seq + ", user_email=" + user_email
				+ ", user_number=" + user_number + ", locker_number=" + locker_number + ", lock_time=" + lock_time
				+ ", loan_check=" + loan_check + ", book_aseq=" + book_aseq + ", book_name=" + book_name
				+ ", lock_loan=" + lock_loan + "]";
	}

	
	
	
	
	
	
	
}
