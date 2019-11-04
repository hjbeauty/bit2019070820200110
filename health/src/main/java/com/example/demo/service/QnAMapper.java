package com.example.demo.service;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.bean.Board;


@Mapper
public interface QnAMapper {
	List<Board> getQnAList();

	Board getPost(int postNo);

	void writePost(Board board);

	void moveReply(Board board);
	void writeReply(Board board);
	void modify(Board board);

	Board hasReply(Board board);
	void remainDelete(int postNo);
	void delete(int postNo);


}
