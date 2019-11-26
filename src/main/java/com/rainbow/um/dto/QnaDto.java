package com.rainbow.um.dto;

import java.io.Serializable;

public class QnaDto implements Serializable{
	
	private static final long serialVersionUID = -7698370385271059856L;
	private String qna_seq;
	private String user_number;
	private String qna_title;
	private String qna_content;
	private String qna_regdate;
	
	public QnaDto() {
	}

	public QnaDto(String qna_seq, String user_number, String qna_title, String qna_content, String qna_regdate) {
		super();
		this.qna_seq = qna_seq;
		this.user_number = user_number;
		this.qna_title = qna_title;
		this.qna_content = qna_content;
		this.qna_regdate = qna_regdate;
	}



	@Override
	public String toString() {
		return "QnaDto [qna_seq=" + qna_seq + ", user_number=" + user_number + ", qna_title=" + qna_title
				+ ", qna_content=" + qna_content + ", qna_regdate=" + qna_regdate + "]";
	}

	public String getQna_seq() {
		return qna_seq;
	}
	
	public void setQna_seq(String qna_seq) {
		this.qna_seq = qna_seq;
	}

	public String getUser_number() {
		return user_number;
	}

	public void setUser_number(String user_number) {
		this.user_number = user_number;
	}

	public String getQna_title() {
		return qna_title;
	}

	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}

	public String getQna_content() {
		return qna_content;
	}

	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}

	public String getQna_regdate() {
		return qna_regdate;
	}

	public void setQna_regdate(String qna_regdate) {
		this.qna_regdate = qna_regdate;
	}
	
}
