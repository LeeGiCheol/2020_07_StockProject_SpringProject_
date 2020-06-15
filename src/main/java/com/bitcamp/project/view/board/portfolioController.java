package com.bitcamp.project.view.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class portfolioController {
	
	@GetMapping("/portfolio")
	public String portfolioBoard() {
		return "portfolio-board";
	}
}
