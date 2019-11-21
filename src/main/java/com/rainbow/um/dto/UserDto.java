package com.rainbow.um.dto;

import java.io.Serializable;
import java.util.Date;

public class UserDto implements Serializable {
	
	private static final long serialVersionUID = -5027942978843735838L;
	private String user_number;
	private String user_email;
	private String user_passward;
	private String user_phone;
	private String user_address;
	private String user_delflag;
	private Date user_regdate;
	private String user_mileage;
	private String user_grade;
	private String user_api;
	
	public UserDto() {
	}

	public UserDto(String user_number, String user_email, String user_passward, String user_phone, String user_address,
			String user_delflag, Date user_regdate, String user_mileage, String user_grade, String user_api) {
		super();
		this.user_number = user_number;
		this.user_email = user_email;
		this.user_passward = user_passward;
		this.user_phone = user_phone;
		this.user_address = user_address;
		this.user_delflag = user_delflag;
		this.user_regdate = user_regdate;
		this.user_mileage = user_mileage;
		this.user_grade = user_grade;
		this.user_api = user_api;
	}

	public String getUser_number() {
		return user_number;
	}

	public void setUser_number(String user_number) {
		this.user_number = user_number;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_passward() {
		return user_passward;
	}

	public void setUser_passward(String user_passward) {
		this.user_passward = user_passward;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_delflag() {
		return user_delflag;
	}

	public void setUser_delflag(String user_delflag) {
		this.user_delflag = user_delflag;
	}

	public Date getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(Date user_regdate) {
		this.user_regdate = user_regdate;
	}

	public String getUser_mileage() {
		return user_mileage;
	}

	public void setUser_mileage(String user_mileage) {
		this.user_mileage = user_mileage;
	}

	public String getUser_grade() {
		return user_grade;
	}

	public void setUser_grade(String user_grade) {
		this.user_grade = user_grade;
	}

	public String getUser_api() {
		return user_api;
	}

	public void setUser_api(String user_api) {
		this.user_api = user_api;
	}

	@Override
	public String toString() {
		return "UserDto [user_number=" + user_number + ", user_email=" + user_email + ", user_passward=" + user_passward
				+ ", user_phone=" + user_phone + ", user_address=" + user_address + ", user_delflag=" + user_delflag
				+ ", user_regdate=" + user_regdate + ", user_mileage=" + user_mileage + ", user_grade=" + user_grade
				+ ", user_api=" + user_api + "]";
	}
}
