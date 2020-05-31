package com.bitcamp.project.view.board;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.vo.BoardVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@GetMapping("/board/free")
	public String boardList(BoardVO vo, Model model) {
		List<BoardVO> boardList = boardService.getBoardList(vo);
		model.addAttribute("boardList", boardList);
		System.out.println(boardList);
		
		return "free-board";
	}
	
//	@GetMapping("/board/free/detail")
//	public String getBoard(BoardVO vo, Model model) {
//		List<BoardVO> boardList = boardService.getBoardList(vo);
//		model.addAttribute("boardList", boardList);
//		System.out.println(boardList);
//		
//		return "free-board-detail";
//	}
	
	@GetMapping("/board/free/write")
	public String boardWriteView(BoardVO vo, Model model) {
	
		return "writeForm";
	}
	
	@PostMapping("/board/free/write")
	public String boardWrite(BoardVO vo, @RequestParam(value="id") String id) {
		vo.setId(id);
		boardService.writeFreeBoard(vo);
		return "redirect:/board/free";
//		return "free-board";
	}
	
	@GetMapping("/board/free/detail")
	public String getBoard(BoardVO vo, Model model) {
		System.out.println("test1 "+vo);
		BoardVO boardDetail = boardService.getBoard(vo);
		System.out.println("test2 "+boardDetail);
		model.addAttribute("boardDetail", boardDetail);
		return "free-board-detail";
	}
}
