package com.example.demo.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("PagingCriteria")
public class PagingCriteria {

	private int pageNum = 1;
	private int amount = 10;
	
}
