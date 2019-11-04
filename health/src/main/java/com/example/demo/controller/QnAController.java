package com.example.demo.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.bean.Board;
import com.example.demo.service.QnAService;

@Controller
public class QnAController {
	
	@Autowired
	QnAService service;
	
	@RequestMapping("QnAboard")//게시판을 작성
	public String qnABoard(Model model , HttpServletRequest request) {
		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		
		model.addAttribute("boardList", service.getQnAList());
		System.out.println(service.getQnAList());
		return "QnAboard";
	}
	
	
	@RequestMapping("writeForm.do") 						//글쓰기 버튼 클릭시 글작성페이지로 이동
	public void writeForm(Model model,String type ,HttpServletRequest request) {
		Board board = new Board();
		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		
		model.addAttribute("board", board);
		model.addAttribute("type", type);
	}
	
	
	@RequestMapping("post.do") 								//글페이지로 이동
	public String post(Model model,int postNo , HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		
		Board board = service.getPost(postNo);
		model.addAttribute("board", board);
		
		return "post";
	}

	
	@RequestMapping("goReply.do")						//답글 작성페이지로 이동
	public String writeReply(Model model,int postNo, String type, HttpServletRequest request) {
		Board board = service.getPost(postNo);

		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		
		model.addAttribute("board", board);
		model.addAttribute("type", type);
		
		return "writeForm";
	}
	
	
	@RequestMapping("goModify.do") 							//글 수정페이지로 이동
	public String modify(Model model,int postNo,String type ) {
		Board board = service.getPost(postNo);

		model.addAttribute("board", board);
		model.addAttribute("type", type);
		
		return "writeForm";
	}
	
	
	@RequestMapping("writePost.do")							//원글 작성
	public String writePost(Model model,@ModelAttribute Board board,MultipartFile file,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String writer = (String) session.getAttribute("login");
		
		String fileName = file.getOriginalFilename();
		String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
		String realFileName;
		File realFile;
		do {
			realFileName = RandomStringUtils.randomAlphanumeric(32)+"."+fileNameExtension;
			realFile = new File(request.getServletContext().getRealPath("/uploadFiles/")+realFileName);
		} while(realFile.exists());
		
		String img = "uploadFiles/"+realFileName;
		
		board.setWriter(writer);
		board.setImg(img);

		try {
			file.transferTo(realFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		service.writePost(board);
		
		return "redirect:QnAboard";
	}
	
	
	@RequestMapping("writeReply.do")							//답글 작성
	public String writeReply(Model model,@ModelAttribute Board board,MultipartFile file,HttpServletRequest request) {
		HttpSession session = request.getSession();
		String writer = (String) session.getAttribute("login");
		String img;
		String fileName = file.getOriginalFilename();
		String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
		String realFileName;
		File realFile;
		do {
			realFileName = RandomStringUtils.randomAlphanumeric(32)+"."+fileNameExtension;
			realFile = new File(request.getServletContext().getRealPath("/uploadFiles/")+realFileName);
		} while(realFile.exists());
		
		img = "uploadFiles/"+realFileName;		
		
		board.setImg(img);
		board.setWriter(writer);

		try {
			file.transferTo(realFile);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		service.writeReply(board);

		return "redirect:QnAboard";
	}
	
	
	@RequestMapping("modifyPost.do")							//글 수정
	public String modofyPost(Model model,@ModelAttribute Board board) {

		service.modify(board);
		
		return "redirect:QnAboard";
	}

	
	@RequestMapping("delete.do") 							//글 삭제
	public String delete(Model model,int postNo) {
		
		service.delete(postNo);
		
		return "redirect:QnAboard";
	}
}
