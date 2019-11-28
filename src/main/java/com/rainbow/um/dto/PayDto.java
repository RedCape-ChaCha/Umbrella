package com.rainbow.um.dto;

import java.io.Serializable;

public class PayDto implements Serializable{
	
	private static final long serialVersionUID = -5863283140140930875L;
	private String pay_seq;
	private String user_number;
	private String pay_token;
	private String pay_type;
	private String pay_amount;
	private String pay_date;
	private String refund_date;
	
	public PayDto() {
	}
	public PayDto(String pay_seq, String user_number, String pay_token, String pay_type, String pay_amount,
			String pay_date, String refund_date) {
		super();
		this.pay_seq = pay_seq;
		this.user_number = user_number;
		this.pay_token = pay_token;
		this.pay_type = pay_type;
		this.pay_amount = pay_amount;
		this.pay_date = pay_date;
		this.refund_date = refund_date;
	}
	public String getPay_seq() {
		return pay_seq;
	}
	public void setPay_seq(String pay_seq) {
		this.pay_seq = pay_seq;
	}
	public String getUser_number() {
		return user_number;
	}
	public void setUser_number(String user_number) {
		this.user_number = user_number;
	}
	public String getPay_token() {
		return pay_token;
	}
	public void setPay_token(String pay_token) {
		this.pay_token = pay_token;
	}
	public String getPay_type() {
		return pay_type;
	}
	public void setPay_type(String pay_type) {
		this.pay_type = pay_type;
	}
	public String getPay_amount() {
		return pay_amount;
	}
	public void setPay_amount(String pay_amount) {
		this.pay_amount = pay_amount;
	}
	public String getPay_date() {
		return pay_date;
	}
	public void setPay_date(String pay_date) {
		this.pay_date = pay_date;
	}
	public String getRefund_date() {
		return refund_date;
	}
	public void setRefund_date(String refund_date) {
		this.refund_date = refund_date;
	}
	@Override
	public String toString() {
		return "PayDto [pay_seq=" + pay_seq + ", user_number=" + user_number + ", pay_token=" + pay_token
				+ ", pay_type=" + pay_type + ", pay_amount=" + pay_amount + ", pay_date=" + pay_date + ", refund_date="
				+ refund_date + "]";
	}

}
