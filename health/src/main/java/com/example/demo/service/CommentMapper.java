package com.example.demo.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.example.demo.bean.HealthComment;

@Mapper
@Repository("com.example.demo.service.CommentMapper")
public interface CommentMapper {

	public int commentCount() throws Exception;
	public List<HealthComment> commentList(int postNo) throws Exception;
	public int commentInsert(HealthComment comment) throws Exception;
	public int commentUpdate(HealthComment comment) throws Exception;
	public int commentDelete(int commentNo) throws Exception;
	
}
