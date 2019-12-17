package com.rainbow.um.dto;

import java.io.Serializable;
import java.util.Date;

public class MilgHistory implements Serializable{
	
	private static final long serialVersionUID = 3459302051505521732L;
	private Integer milg_amount;
	private Integer remain_milg;
	private String milg_time;
	
	public MilgHistory() {
	}

	public Integer getMilg_amount() {
		return milg_amount;
	}

	public void setMilg_amount(Integer milg_amount) {
		this.milg_amount = milg_amount;
	}

	public Integer getRemain_milg() {
		return remain_milg;
	}

	public void setRemain_milg(Integer remain_milg) {
		this.remain_milg = remain_milg;
	}

	public String getMilg_time() {
		return milg_time;
	}

	public void setMilg_time(String milg_time) {
		this.milg_time = milg_time;
	}

	public MilgHistory(Integer milg_amount, Integer remain_milg, String milg_time) {
		super();
		this.milg_amount = milg_amount;
		this.remain_milg = remain_milg;
		this.milg_time = milg_time;
	}

	@Override
	public String toString() {
		return "MilgHistory [milg_amount=" + milg_amount + ", remain_milg=" + remain_milg + ", milg_time=" + milg_time
				+ "]";
	}
	
	

}
