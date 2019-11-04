package com.example.demo.bean;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("PageMaker")
public class PageMaker {

	private int startPage;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	private PagingCriteria cri;
	
	public PageMaker() {}
	
	public PageMaker(PagingCriteria cri, int total) {
		
		this.cri = cri;
		int realEnd = (int)(Math.ceil((total * 1.0)/cri.getAmount()));
		this.endPage = (int)(Math.ceil(cri.getPageNum() / 10.0) *10);
		this.startPage = getEndPage() - 9;
		
		if(realEnd < this.endPage) {
			this.endPage = realEnd;
		}
		this.next = getEndPage() < realEnd;
		this.prev = getStartPage() > 1;
	}
}
