package com.bitcamp.project.view.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class NewsController {
	
	@GetMapping("/news")
	public String newsBoard() {
		return "newsboard";
	}
}
