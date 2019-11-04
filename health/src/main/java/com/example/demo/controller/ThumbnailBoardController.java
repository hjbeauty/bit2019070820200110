package com.example.demo.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.bean.ThumbnailBoard;
import com.example.demo.service.ThumbnailBoardService;

@Controller
public class ThumbnailBoardController {

	@Autowired
	ThumbnailBoardService service;
	// 보드 리스트 출력
	@RequestMapping("thumbnailBoard")
	public String Board(HttpServletRequest req, Model model, ThumbnailBoard board) {
		HttpSession session = req.getSession();
		model.addAttribute("login", session.getAttribute("login"));

		model.addAttribute("boardList", service.getBoardList());

		return "thumbnailBoard";
	}
	// 글 작성 페이지로 이동
	@RequestMapping("goWriteBoard.do")
	public String goWriteBoard(Model model, HttpServletRequest request) {
		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		ThumbnailBoard board = new ThumbnailBoard();
		model.addAttribute("board", board);
		return "writeBoard";
	}
	// 글 작성
	@RequestMapping("writeBoard.do")
	public String writeBoard(Model model, @ModelAttribute ThumbnailBoard board,
	 												HttpServletRequest request) {
		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		service.writeBoard(board);
		return "redirect:thumbnailBoard";
	}
	// 글 페이지 이동
	@RequestMapping("postBoard.do")
	public String postBoard(HttpServletRequest request,
			                Model model, int articleNumber) {
		ThumbnailBoard board = service.getPost(articleNumber);
		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("board", board);
		return "postBoard";
	}
	// 글 삭제
	@RequestMapping("delete_Board.do")
	public String delete_Board(Model model, int articleNumber, HttpServletRequest request) {
		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		service.delete(articleNumber);
		return "redirect:thumbnailBoard";
	}
	// 글 수정
	@RequestMapping("update.do")
	public String update(Model model,@ModelAttribute ThumbnailBoard board, HttpServletRequest request) {
		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		service.update(board);
		return "redirect:thumbnailBoard";
	}
	// 글 수정 페이지로 이동
	@RequestMapping("goUpdate.do")
	public String goUpdate(Model model, int articleNumber, HttpServletRequest request) {
		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		ThumbnailBoard board = service.getPost(articleNumber);
		model.addAttribute("board", board);
		return "update";
	}

}
