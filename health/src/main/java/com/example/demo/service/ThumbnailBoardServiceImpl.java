package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.bean.ThumbnailBoard;
import com.example.demo.service.ThumbnailBoardMapper;

@Service
public class ThumbnailBoardServiceImpl implements ThumbnailBoardService{
	@Autowired
	ThumbnailBoardMapper mapper;
	
	@Override
	public List<ThumbnailBoard> getBoardList() {
		return mapper.getBoardList();
	}

	@Override
	public void writeBoard(ThumbnailBoard board) {
		mapper.writeBoard(board);
	}

	@Override
	public void delete(int articleNumber) {
		mapper.delete(articleNumber);
	}

	@Override
	public void update(ThumbnailBoard board) {
		mapper.update(board);
	}

	@Override
	public ThumbnailBoard getPost(int articleNumber) {
		return mapper.getPost(articleNumber);
	}

	@Override
	public int boardCount(ThumbnailBoard board) {
		return mapper.boardCount(board);
	}

}
