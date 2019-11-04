package com.example.demo.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.bean.HealthComment;
import com.example.demo.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	
	@Resource(name="com.example.demo.service.CommentService")
	CommentService commentService;
	
	 @RequestMapping("/list/{postNo}") //댓글 리스트
	    @ResponseBody
	    private List<HealthComment> mCommentServiceList(@PathVariable("postNo") int postNo, Model model) throws Exception{
	        
	        return commentService.commentListService(postNo);
	    }
	    
	    @RequestMapping("/insert/{postNo}") //댓글 작성 
	    @ResponseBody
	    private int mCommentServiceInsert(HttpServletRequest request,
	    								   @PathVariable("postNo")int postNo,
	    								   @ModelAttribute("user") 
	    								   @RequestParam String content) throws Exception{
	        
	        HealthComment comment = new HealthComment();
	        comment.setPostNo(postNo);
	        comment.setContent(content);
	        
	    	HttpSession session = request.getSession();
			
			if (session != null) {
				
				System.out.println("session.getattribute => " + session.getAttribute("login"));
				System.out.println("session.get attribute => " +session.getAttribute("id"));
			}
	        
	        comment.setWriter((String) session.getAttribute("id"));
	        
	        return commentService.commentInsertService(comment);
	    }
	    
	    @RequestMapping("/update") //댓글 수정  
	    @ResponseBody
	    private int mCommentServiceUpdateProc(@RequestParam int commentNo, @RequestParam String content) throws Exception{
	        
	        HealthComment comment = new HealthComment();
	        comment.setCommentNo(commentNo);
	        comment.setContent(content);
	        
	        return commentService.commentUpdateService(comment);
	    }
	    
	    @RequestMapping("/delete/{commentNo}") //댓글 삭제  
	    @ResponseBody
	    private int mCommentServiceDelete(@PathVariable int commentNo) throws Exception{
	        
	        return commentService.commentDeleteService(commentNo);
	    }
	    
	
}
