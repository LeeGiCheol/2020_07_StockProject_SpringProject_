package com.bitcamp.project.view.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bitcamp.project.vo.Info;

import stockCode.News3;

@Controller
public class NewsController {
	
	@GetMapping("/news")
	public String newsBoard(Model model) {
		News3 newsBoard = new News3();
//		Info news_ = newsBoard.news();
//		String news = news_.getNews().replace("`", "'");
//		model.addAttribute("news", news);
		
		return "newsboard";
	}
	@GetMapping("/test")
	public String test() {
		return "free-board-update";
	}
}
