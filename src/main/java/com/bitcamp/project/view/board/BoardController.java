package com.bitcamp.project.view.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@GetMapping("/board")
	public String boardList(BoardVO vo, Model model) {
		List<BoardVO> boardList = boardService.getBoardList(vo);
		System.out.println(boardList);
		model.addAttribute("boardList", boardList);
	
		return "free-board";
	}
	
}
