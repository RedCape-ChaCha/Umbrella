package com.rainbow.um.dto;

import java.io.Serializable;

public class ReplyDto implements Serializable {
	
	private static final long serialVersionUID = 2515350475931750919L;
	private String rep_seq_;
	private String user_number;
	private String qna_seq;
	private String rep_content;
	private String rep_regdate;

	public ReplyDto() {
	}
	
	public ReplyDto(String rep_seq_, String user_number, String qna_seq, String rep_content, String rep_regdate) {
		super();
		this.rep_seq_ = rep_seq_;
		this.user_number = user_number;
		this.qna_seq = qna_seq;
		this.rep_content = rep_content;
		this.rep_regdate = rep_regdate;
	}

	@Override
	public String toString() {
		return "ReplyDto [rep_seq_=" + rep_seq_ + ", user_number=" + user_number + ", qna_seq=" + qna_seq
				+ ", rep_content=" + rep_content + ", rep_regdate=" + rep_regdate + "]";
	}

	public String getRep_seq_() {
		return rep_seq_;
	}

	public void setRep_seq_(String rep_seq_) {
		this.rep_seq_ = rep_seq_;
	}

	public String getUser_number() {
		return user_number;
	}

	public void setUser_number(String user_number) {
		this.user_number = user_number;
	}

	public String getQna_seq() {
		return qna_seq;
	}

	public void setQna_seq(String qna_seq) {
		this.qna_seq = qna_seq;
	}

	public String getRep_content() {
		return rep_content;
	}

	public void setRep_content(String rep_content) {
		this.rep_content = rep_content;
	}

	public String getRep_regdate() {
		return rep_regdate;
	}

	public void setRep_regdate(String rep_regdate) {
		this.rep_regdate = rep_regdate;
	}
	
}
