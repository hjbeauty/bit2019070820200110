package com.example.demo.bean;

public class ThumbnailBoard {
	String title; //varchar2(50),
	String uploadDate; //date,
	String boardContent; //varchar2(1000),
	int articleNumber; //number(10),
	String imgsrc; //varchar2(200),
	
	public ThumbnailBoard() {}

	public ThumbnailBoard(String title, String uploadDate, String boardContent, int articleNumber, String imgsrc) {
		super();
		this.title = title;
		this.uploadDate = uploadDate;
		this.boardContent = boardContent;
		this.articleNumber = articleNumber;
		this.imgsrc = imgsrc;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUploadDate() {
		return uploadDate;
	}

	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public int getArticleNumber() {
		return articleNumber;
	}

	public void setArticleNumber(int articleNumber) {
		this.articleNumber = articleNumber;
	}

	public String getImgsrc() {
		return imgsrc;
	}

	public void setImgsrc(String imgsrc) {
		this.imgsrc = imgsrc;
	}

	@Override
	public String toString() {
		return "Board [title=" + title + ", uploadDate=" + uploadDate + ", boardContent=" + boardContent
				+ ", articleNumber=" + articleNumber + ", imgsrc=" + imgsrc + "]";
	}
	
	
	
}

