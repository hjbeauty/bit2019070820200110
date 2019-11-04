package com.example.demo.service;

import java.util.List;

import com.example.demo.bean.ThumbnailBoard;

public interface ThumbnailBoardService {
	List<ThumbnailBoard> getBoardList();
	int boardCount(ThumbnailBoard board);
	
	
	void writeBoard(ThumbnailBoard board);
	
	void delete(int articleNumber);
	
	void update(ThumbnailBoard board);
	
	ThumbnailBoard getPost(int articleNumber);
	
}
