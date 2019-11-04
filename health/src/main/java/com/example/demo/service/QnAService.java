package com.example.demo.service;

import java.util.List;

import com.example.demo.bean.Board;

public interface QnAService {

	List<Board> getQnAList();	

	Board getPost(int postNo);

	void writePost(Board board);

	void writeReply(Board board);

	void modify(Board board);

	void delete(int postNo);

}
