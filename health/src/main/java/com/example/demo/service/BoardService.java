package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.bean.FreeBoard;
import com.example.demo.service.FreeBoardMapper;

@Service
public class BoardService {
	@Autowired
	FreeBoardMapper boardMapper;

	public void addBoard(FreeBoard board) {
		boardMapper.insert(board);
	}

	public List<FreeBoard> getList() {
		return boardMapper.showList();
	}

	public FreeBoard getDetail(int boardnum) {
		return boardMapper.detail(boardnum);
	}

	public void deleteboard(int boardnum) {
		boardMapper.delete(boardnum);

	}
	public void updateboard(int boardnum,String title,String txt) {
		boardMapper.update(boardnum, title, txt);
	}

}
