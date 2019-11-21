package com.rainbow.um.common;

public class PageModule {
	private int nowPage; // 현재 페이지 번호/
	private int startPage; // 페이지의 시작 페이지 번호/
	private int endPage; // 페이징의 마지막 페이지 번호/
	private int totalPage; // 총 페이지수/
	
	private int totalBoard; // 총 게시글의 수/
	private int startBoard; // 페이지에 보여지는 게시글의 시작 번호 -1/
	private int seeBoard; // 페이지에 보여지는 게시글의 수/
	
	public PageModule(int totalBoard, int nowPage, int pageNum, int seeBoard) {
		if(totalBoard == 0) { return; }
		this.totalBoard = totalBoard;
		this.totalPage = totalBoard/seeBoard+1;
		this.nowPage = nowPage;
		if(this.nowPage <= 0){
			this.nowPage = 1;
		}else if(this.nowPage >= this.totalPage) {
			this.nowPage = this.totalPage;
		}
		this.startPage = nowPage-pageNum;
		this.endPage = nowPage+pageNum;
		this.seeBoard = seeBoard;
		this.startBoard = (nowPage-1)*(this.seeBoard);
		
		if(this.startPage < 1) {
			this.startPage = 1;
		}
		
		if(this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
		
		if(this.nowPage == this.totalPage) {
			this.seeBoard = totalBoard%seeBoard;
		}
	}

	public PageModule() {
	}
	
	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalBoard() {
		return totalBoard;
	}

	public void setTotalBoard(int totalBoard) {
		this.totalBoard = totalBoard;
	}

	public int getStartBoard() {
		return startBoard;
	}

	public void setStartBoard(int startBoard) {
		this.startBoard = startBoard;
	}

	public int getSeeBoard() {
		return seeBoard;
	}

	public void setSeeBoard(int seeBoard) {
		this.seeBoard = seeBoard;
	}

	@Override
	public String toString() {
		return "PageTest [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", totalPage="
				+ totalPage + ", totalBoard=" + totalBoard + ", startBoard=" + startBoard + ", seeBoard=" + seeBoard
				+ "]";
	}
}
