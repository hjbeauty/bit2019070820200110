package com.example.demo.bean;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

/*
CREATE TABLE healthComment(
		  commentno NUMBER(3) PRIMARY KEY,
		  postNo NUMBER(3),
		  content VARCHAR2 (1000),
		  writer VARCHAR2 (20),
		  reg_date DATE
		);
*/

@Data
@Alias("HealthComment")
public class HealthComment {

	private int commentNo;
	private int postNo;
	private String content;
	private String writer;
	private Date reg_date;
}
