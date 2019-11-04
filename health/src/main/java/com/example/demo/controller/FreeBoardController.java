package com.example.demo.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.bean.FreeBoard;
import com.example.demo.service.BoardService;

@Controller
public class FreeBoardController {
	@Autowired
	BoardService boardService;

	@RequestMapping("/freeboardinsert")
	public String boardList(Model model,FreeBoard board, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String writer = (String)session.getAttribute("login"); 

		board.setWriter(writer);
		
		boardService.addBoard(board);

		return "redirect:/freemain";
	}

	@RequestMapping("/freeinsert")
	public void boardcreate(Model model, FreeBoard board) {
		model.addAttribute("board", board);

	}
	@RequestMapping("/freecontent")
	public void boardcontent(Model model,@RequestParam("boardnum") int boardnum, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		FreeBoard board=boardService.getDetail(boardnum);
		model.addAttribute("board", board);
		
	}
	@RequestMapping("/freedelete")
	public String delete(Model model,@RequestParam("boardnum") int boardnum) {
		boardService.deleteboard(boardnum);
		model.addAttribute("list", boardService.getList());
		return "redirect:/freemain";
		
	}
	
	@RequestMapping("/freeupdate")
	public void update(Model model, @RequestParam("boardnum") int boardnum) {
		FreeBoard board = boardService.getDetail(boardnum);
		model.addAttribute("boardup",board);
	}
	
	@RequestMapping("/freeupdatecontent")
	public String updatecontents(Model model, @RequestParam("boardnum") int boardnum,@RequestParam("title") String title, @RequestParam("txt") String txt) {
		boardService.updateboard(boardnum, title, txt);
		model.addAttribute("list",boardService.getList());
		return "redirect:/freemain";
	}
	
	@RequestMapping("/freemain")
	public void boardmain(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("list",boardService.getList());
		
	}

}
