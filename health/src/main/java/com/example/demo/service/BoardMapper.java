package com.example.demo.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.bean.FileVO;
import com.example.demo.bean.HealthBoard;
import com.example.demo.bean.PagingCriteria;

@Mapper
public interface BoardMapper {

	List<HealthBoard> getBoardList();
	List<HealthBoard> getBoardList2(PagingCriteria paging);
	
	//paging 용
	List<HealthBoard> getBoardList3();
	List<HealthBoard> moveList(int board_num);
	int totalCnt();
	int countSearchMove(String condition, String keyword);
	List<HealthBoard> moveSearchList(int board_num, String condition, String keyword);
	
	//data 보기
	List<HealthBoard> boardView(int postNo);
	int viewCount(int postNo);
	
	List<HealthBoard> searchView(String condition, String keyword);
	
	//file 하나만 업로드하고 출력할 때
//	FileVO fileView(int postNo);
	
	//Multifile upload & 출력 성공 할렐루야
	List<FileVO> fileView(int postNo);
	
	//file download용 View
	FileVO fileDownView(int fno);
	
	void insertBoard(HealthBoard board);
	void insertFile(FileVO vo);
	
	
	//Delete
	HealthBoard replyCheck(int groupNo, int groupOrder);
	void replyRemain(int postNo);
	void deleteBoard(int postNo);
	
	void updateBoard(HealthBoard board);
	void replyUpdate(HealthBoard board);
	void insertReply(HealthBoard board);
}
