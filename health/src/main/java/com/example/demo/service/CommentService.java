package com.example.demo.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.example.demo.bean.HealthComment;

@Service("com.example.demo.service.CommentService")
public class CommentService {

	@Resource(name="com.example.demo.service.CommentMapper")
	CommentMapper mCommentMapper;
	
    public List<HealthComment> commentListService(int postNo) throws Exception{
        
        return mCommentMapper.commentList(postNo);
    }
    
    public int commentInsertService(HealthComment comment) throws Exception{
        
        return mCommentMapper.commentInsert(comment);
    }
    
    public int commentUpdateService(HealthComment comment) throws Exception{
        
        return mCommentMapper.commentUpdate(comment);
    }
    
    public int commentDeleteService(int commentNo) throws Exception{
        
        return mCommentMapper.commentDelete(commentNo);
    }

	
}
