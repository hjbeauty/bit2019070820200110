package com.example.demo.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.bean.MealplanBoard;
import com.example.demo.service.MealplanBoardMapper;

@Controller
@RequestMapping("/mealplannerBoard")
public class MealplanBoardController {

	@Autowired
	MealplanBoardMapper mealplanboardMapper;

	/* 식단 첫 화면(선택) */
	@RequestMapping("MealBoard")
	public String MealBoard(Model model, 
							HttpServletRequest request,
							@ModelAttribute("mealplan") MealplanBoard mealplan) {
		

		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("list", mealplanboardMapper.MealplanBoardList());
		return "mealplannerBoard/main";
	}

	/* 식단 선택 후 영양정보 화면 */
	@RequestMapping("detail")
	public String MealplanBoardDetail(Model model, 
								      HttpServletRequest request,
									  @RequestParam ArrayList<String> foodselect) {

		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("list", mealplanboardMapper.selected(foodselect));
		model.addAttribute("num", mealplanboardMapper.selected(foodselect).size());
		System.out.println(foodselect);
		System.out.println(mealplanboardMapper.selected(foodselect).size());
		return "mealplannerBoard/detail";
	}

	
	/* 식단 구성 전체 화면(마지막) */
	@RequestMapping("final")
	public String MealplanBoardList(Model model, 
			                        HttpServletRequest request,
								    @ModelAttribute("mealplan") MealplanBoard mealplan) {

		HttpSession session = request.getSession();
		model.addAttribute("login", session.getAttribute("login"));
		model.addAttribute("list", mealplanboardMapper.MealplanBoardList());
		return "mealplannerBoard/final";
	}
	 
}
