package com.example.demo.bean;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("freeboard")
public class FreeBoard {
int boardnum;
String title;
Date boardtime;
String txt;
String writer;

 public FreeBoard() {
	super();
 }

public FreeBoard(int boardnum, String title, Date boardtime, String txt, String writer) {
	super();
	this.boardnum = boardnum;
	this.title = title;
	this.boardtime = boardtime;
	this.txt = txt;
	this.writer = writer;
}

public int getBoardnum() {
	return boardnum;
}

public void setBoardnum(int boardnum) {
	this.boardnum = boardnum;
}

public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public Date getBoardtime() {
	return boardtime;
}

public void setBoardtime(Date boardtime) {
	this.boardtime = boardtime;
}

public String getTxt() {
	return txt;
}

public void setTxt(String txt) {
	this.txt = txt;
}

public String getWriter() {
	return writer;
}

public void setWriter(String writer) {
	this.writer = writer;
}

@Override
public String toString() {
	return "Board [boardnum=" + boardnum + ", title=" + title + ", boardtime=" + boardtime + ", txt=" + txt
			+ ", writer=" + writer + "]";
}

 



}
