package com.bitcamp.project.view.board;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
	
	
	@GetMapping("/board")
	public String boardList() {
		
		
	
		return "free-board";
	}
	
}
