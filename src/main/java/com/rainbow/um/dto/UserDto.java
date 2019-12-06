package com.rainbow.um.dto;

import java.io.Serializable;
import java.util.Date;

public class UserDto implements Serializable {
	
	private static final long serialVersionUID = -5027942978843735838L;
	private String user_email   ;
	private String user_password;
	private String user_phone   ;
	private String user_zip     ;
	private String user_address ;
	private String user_detail  ;
	private String user_delflag ;
	private String user_regdate ;
	private String user_mileage ;
	private String user_grade   ;
	private String user_api     ;
	
	public UserDto() {
	}

	public UserDto(String user_email, String user_password, String user_phone, String user_zip, String user_address,
			String user_detail, String user_delflag, String user_regdate, String user_mileage, String user_grade,
			String user_api) {
		super();
		this.user_email = user_email;
		this.user_password = user_password;
		this.user_phone = user_phone;
		this.user_zip = user_zip;
		this.user_address = user_address;
		this.user_detail = user_detail;
		this.user_delflag = user_delflag;
		this.user_regdate = user_regdate;
		this.user_mileage = user_mileage;
		this.user_grade = user_grade;
		this.user_api = user_api;
	}

	@Override
	public String toString() {
		return "UserDto [user_email=" + user_email + ", user_password=" + user_password + ", user_phone=" + user_phone
				+ ", user_zip=" + user_zip + ", user_address=" + user_address + ", user_detail=" + user_detail
				+ ", user_delflag=" + user_delflag + ", user_regdate=" + user_regdate + ", user_mileage=" + user_mileage
				+ ", user_grade=" + user_grade + ", user_api=" + user_api + "]";
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_phone() {
		return user_phone;
	}

	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}

	public String getUser_zip() {
		return user_zip;
	}

	public void setUser_zip(String user_zip) {
		this.user_zip = user_zip;
	}

	public String getUser_address() {
		return user_address;
	}

	public void setUser_address(String user_address) {
		this.user_address = user_address;
	}

	public String getUser_detail() {
		return user_detail;
	}

	public void setUser_detail(String user_detail) {
		this.user_detail = user_detail;
	}

	public String getUser_delflag() {
		return user_delflag;
	}

	public void setUser_delflag(String user_delflag) {
		this.user_delflag = user_delflag;
	}

	public String getUser_regdate() {
		return user_regdate;
	}

	public void setUser_regdate(String user_regdate) {
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
	
	

}
