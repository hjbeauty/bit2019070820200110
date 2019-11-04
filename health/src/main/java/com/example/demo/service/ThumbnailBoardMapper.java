package com.example.demo.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.bean.ThumbnailBoard;

@Mapper
public interface ThumbnailBoardMapper {
	
	List<ThumbnailBoard> getBoardList();
	int boardCount(ThumbnailBoard board);
	
	void writeBoard(ThumbnailBoard board);
	
	void delete(int articleNumber);
	
	void update(ThumbnailBoard board);
	
	ThumbnailBoard getPost(int articleNumber);
}
