package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.bean.Board;

@Service
public class QnAServiceImpl implements QnAService {
	@Autowired
	QnAMapper mapper;

	@Override
	public List<Board> getQnAList() {
		return mapper.getQnAList();
	}

	@Override
	public Board getPost(int postNo) {
		return mapper.getPost(postNo);
	}

	@Override
	public void writePost(Board board) {
		mapper.writePost(board);
		
	}

	@Override
	public void writeReply(Board board) {
		mapper.moveReply(board);
		mapper.writeReply(board);
		
	}

	@Override
	public void modify(Board board) {
		mapper.modify(board);
		
	}

	@Override
	public void delete(int postNo) {
		Board board = mapper.getPost(postNo);
		
		//답글이 있을 경우 삭제된 글입니다라고 남기고 답글이 없을경우 완전 삭제
		if(mapper.hasReply(board) != null) {
			System.out.println("답변있음");
			mapper.remainDelete(postNo);
		} else {
			
			System.out.println("답변없음");
			mapper.delete(postNo);
		}
		
	}
}
