package com.example.demo.bean;

public class Board {
	int postNo;
	int groupNo;
	int groupOrder;
	int depth;
	String title; 
	String writer;
	String content;
	String img;
	
	public Board() {}
	
	public Board(int postNo, int groupNo, int groupOrder, int depth, String title, String writer, String content,
			String img) {
		super();
		this.postNo = postNo;
		this.groupNo = groupNo;
		this.groupOrder = groupOrder;
		this.depth = depth;
		this.title = title;
		this.writer = writer;
		this.content = content;
		this.img = img;
	}

	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public int getGroupNo() {
		return groupNo;
	}
	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}
	public int getGroupOrder() {
		return groupOrder;
	}
	public void setGroupOrder(int groupOrder) {
		this.groupOrder = groupOrder;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	@Override
	public String toString() {
		return "Board [postNo=" + postNo + ", groupNo=" + groupNo + ", groupOrder=" + groupOrder + ", depth=" + depth
				+ ", title=" + title + ", writer=" + writer + ", content=" + content + ", img=" + img + "]";
	}
	
}
