package com.rainbow.um.dto;

import java.io.Serializable;
import java.util.Date;

public class ApplyDto implements Serializable{
	
	private static final long serialVersionUID = -5761508933658000419L;
	private String apply_seq;
	private String user_number;
	private String book_cseq;
	private String apply_check;
	private String user_email;
	private String book_name;
	private String isbn;
	private String book_number;
	private String apply_date;
	
	public ApplyDto() {
	}

	public ApplyDto(String apply_seq, String user_number, String book_cseq, String apply_check, String user_email,
			String book_name, String isbn, String book_number, String apply_date) {
		super();
		this.apply_seq = apply_seq;
		this.user_number = user_number;
		this.book_cseq = book_cseq;
		this.apply_check = apply_check;
		this.user_email = user_email;
		this.book_name = book_name;
		this.isbn = isbn;
		this.book_number = book_number;
		this.apply_date = apply_date;
	}

	@Override
	public String toString() {
		return "ApplyDto [apply_seq=" + apply_seq + ", user_number=" + user_number + ", book_cseq=" + book_cseq
				+ ", apply_check=" + apply_check + ", user_email=" + user_email + ", book_name=" + book_name + ", isbn="
				+ isbn + ", book_number=" + book_number + ", apply_date=" + apply_date + "]";
	}

	public String getApply_seq() {
		return apply_seq;
	}

	public void setApply_seq(String apply_seq) {
		this.apply_seq = apply_seq;
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

	public String getApply_check() {
		return apply_check;
	}

	public void setApply_check(String apply_check) {
		this.apply_check = apply_check;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getIsbn() {
		return isbn;
	}

	public void setIsbn(String isbn) {
		this.isbn = isbn;
	}

	public String getBook_number() {
		return book_number;
	}

	public void setBook_number(String book_number) {
		this.book_number = book_number;
	}

	public String getApply_date() {
		return apply_date;
	}

	public void setApply_date(String apply_date) {
		this.apply_date = apply_date;
	}
	
}
