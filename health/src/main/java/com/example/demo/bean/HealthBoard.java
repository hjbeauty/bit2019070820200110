package com.example.demo.bean;

import java.time.LocalDateTime;

import org.apache.ibatis.type.Alias;

import lombok.Data;

/*
CREATE TABLE healthBoard (
postno  NUMBER(5) PRIMARY KEY,      
groupno NUMBER(5) ,                              
grouporder NUMBER(2),                             
depth NUMBER(2),                                  
title VARCHAR2(100),
writer VARCHAR2 (100),
content VARCHAR2 (3000),
reg_date DATE,
count NUMBER(3) DEFAULT 0
);
 */


@Data
@Alias("HealthBoard")
public class HealthBoard {

	private int postNo;
	private int groupNo;
	private int groupOrder;
	private int depth;
	private String title;
	private String writer;
	private String content;
	private LocalDateTime reg_date;
	private int count;
}
