package com.rainbow.um.dto;

import java.io.Serializable;

public class BookDto implements Serializable{
	
	private static final long serialVersionUID = 4978034438206422970L;
	private String book_cseq;
	private String book_name;
	private String isbn;
	private String book_number;
	private String book_writer;
	private String book_publisher;
	private String book_price;
    private String book_img;
    private int book_count;
    private int bobcount;
    
    public int getBobcount() {
		return bobcount;
	}

	public void setBobcount(int bobcount) {
		this.bobcount = bobcount;
	}

	public BookDto() {
	}
    
	

	public BookDto(String book_cseq, String book_name, String book_isbn, String book_number, String book_writer,
			String book_publisher, String book_price, String book_img, int book_count, int bobcount) {
		super();
		this.book_cseq = book_cseq;
		this.book_name = book_name;
		this.isbn = book_isbn;
		this.book_number = book_number;
		this.book_writer = book_writer;
		this.book_publisher = book_publisher;
		this.book_price = book_price;
		this.book_img = book_img;
		this.book_count = book_count;
		this.bobcount = bobcount;
	}

	@Override
	public String toString() {
		return "BookDto [book_cseq=" + book_cseq + ", book_name=" + book_name + ", book_isbn=" + isbn
				+ ", book_number=" + book_number + ", book_writer=" + book_writer + ", book_publisher=" + book_publisher
				+ ", book_price=" + book_price + ", book_img=" + book_img + ", book_count=" + book_count + ", bobcount="
				+ bobcount + "]";
	}

	public String getBook_cseq() {
		return book_cseq;
	}

	public void setBook_cseq(String book_cseq) {
		this.book_cseq = book_cseq;
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

	public void setIsbn(String book_isbn) {
		this.isbn = book_isbn;
	}

	public String getBook_number() {
		return book_number;
	}

	public void setBook_number(String book_number) {
		this.book_number = book_number;
	}

	public String getBook_writer() {
		return book_writer;
	}

	public void setBook_writer(String book_writer) {
		this.book_writer = book_writer;
	}

	public String getBook_publisher() {
		return book_publisher;
	}

	public void setBook_publisher(String book_publisher) {
		this.book_publisher = book_publisher;
	}

	public String getBook_price() {
		return book_price;
	}

	public void setBook_price(String book_price) {
		this.book_price = book_price;
	}

	public String getBook_img() {
		return book_img;
	}

	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}

	public int getBook_count() {
		return book_count;
	}

	public void setBook_count(int book_count) {
		this.book_count = book_count;
	}
	
    
    
}
