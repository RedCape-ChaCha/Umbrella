package com.rainbow.um.dto;

import java.io.Serializable;

public class BoardDto implements Serializable{
	
	private static final long serialVersionUID = 420965915875278912L;
	private String board_seq;
	private String board_title;
	private String board_content;
    private String board_regdate;
    private String board_type;
    
    public BoardDto() {
		// TODO Auto-generated constructor stub
	}

	public BoardDto(String board_seq, String board_title, String board_content, String board_regdate,
			String board_type) {
		super();
		this.board_seq = board_seq;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_regdate = board_regdate;
		this.board_type = board_type;
	}

	@Override
	public String toString() {
		return "BoardDto [board_seq=" + board_seq + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_regdate=" + board_regdate + ", board_type=" + board_type + "]";
	}

	public String getBoard_seq() {
		return board_seq;
	}

	public void setBoard_seq(String board_seq) {
		this.board_seq = board_seq;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_regdate() {
		return board_regdate;
	}

	public void setBoard_regdate(String board_regdate) {
		this.board_regdate = board_regdate;
	}

	public String getBoard_type() {
		return board_type;
	}

	public void setBoard_type(String board_type) {
		this.board_type = board_type;
	}
    
}