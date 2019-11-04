package com.example.demo.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.bean.MealplanBoard;
@Mapper 
public interface MealplanBoardMapper {
    //식단 목록  
    public List<MealplanBoard> MealplanBoardList();
    
    //식단 선택 후 상세
    public MealplanBoard MealplanBoardDetail(MealplanBoard board);

	public List<MealplanBoard> selected(List<String> list);
	
	
}
