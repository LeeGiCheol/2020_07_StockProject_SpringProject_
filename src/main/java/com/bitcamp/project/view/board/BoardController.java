package com.bitcamp.project.view.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.service.CommentService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	CommentService commentService;
	
	
	@GetMapping("/board/free")
	public String boardList(BoardVO vo, Model model, @ModelAttribute("bnowPage") String nowPage) {
		if(nowPage == null || nowPage.equals("")){
			nowPage = "1";
		}
		System.out.println("vo "+vo.toString());
		Map<String, Object> boardList = boardService.boardList(vo, Integer.parseInt(nowPage));
		model.addAttribute("boardList", (List<BoardVO>)boardList.get("boardList"));
		model.addAttribute("boardPage", (PagingVO)boardList.get("boardPage"));
		PagingVO a = (PagingVO)boardList.get("boardPage");
		System.out.println(a.toString());
		System.out.println(boardList);
		
		
		return "free-board";
	}
	
	
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
	public String getBoard(BoardVO vo, CommentVO cVo, Model model, PagingVO pVo) {
		System.out.println("test1 "+vo);
		BoardVO boardDetail = boardService.getBoard(vo);
		System.out.println("test2 "+boardDetail);
		
		System.out.println("session "+session.getAttribute("loginUser"));
		System.out.println("model "+boardDetail.getNickname());
		model.addAttribute("boardDetail", boardDetail);

		
		// 댓글리스트
		List<CommentVO> commentList = commentService.getCommentList(pVo);
		model.addAttribute("commentList", commentList);
		System.out.println(commentList);
		return "free-board-detail";
	}
	
	
	@GetMapping("/board/free/update")
	public String updateBoardView(BoardVO vo, Model model) {
		BoardVO boardUpdate = boardService.getBoard(vo);
		model.addAttribute("boardUpdate", boardUpdate);
		System.out.println("mmmmm"+boardUpdate);
		return "updateForm";
	}

	@PostMapping("/board/free/update")
	public String updateBoard(BoardVO vo, Model model) {
		System.out.println("test");
		System.out.println(vo);
		boardService.updateBoard(vo);
		return "redirect:/board/free";
	}
	
	@GetMapping("/board/free/delete")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);
		return "redirect:/board/free";
	}
	
}
