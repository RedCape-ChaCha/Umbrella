package com.rainbow.um.dto;

import java.io.Serializable;
import java.util.Date;

public class FileDto implements Serializable {
	
	private static final long serialVersionUID = 4543451659880594755L;
	private String f_seq;
	private String f_realname;
	private String f_storagename;
	private Date f_regdate;
	private String f_info;
	 
	public FileDto() {
	}
	
	public FileDto(String f_seq, String f_realname, String f_storagename, Date f_regdate, String f_info) {
		super();
		this.f_seq = f_seq;
		this.f_realname = f_realname;
		this.f_storagename = f_storagename;
		this.f_regdate = f_regdate;
		this.f_info = f_info;
	}

	public String getF_seq() {
		return f_seq;
	}

	public void setF_seq(String f_seq) {
		this.f_seq = f_seq;
	}

	public String getF_realname() {
		return f_realname;
	}

	public void setF_realname(String f_realname) {
		this.f_realname = f_realname;
	}

	public String getF_storagename() {
		return f_storagename;
	}

	public void setF_storagename(String f_storagename) {
		this.f_storagename = f_storagename;
	}

	public Date getF_regdate() {
		return f_regdate;
	}

	public void setF_regdate(Date f_regdate) {
		this.f_regdate = f_regdate;
	}

	public String getF_info() {
		return f_info;
	}

	public void setF_info(String f_info) {
		this.f_info = f_info;
	}

	@Override
	public String toString() {
		return "FileDto [f_seq=" + f_seq + ", f_realname=" + f_realname + ", f_storagename=" + f_storagename
				+ ", f_regdate=" + f_regdate + ", f_info=" + f_info + "]";
	}
	 
	 
}
