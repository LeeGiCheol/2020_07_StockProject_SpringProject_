package com.bitcamp.project.view.user;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.UserVO;

@Controller
public class CustomerController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping(value="/customer")
	public String customerLanding() {
		return "customerLanding";
	}
	
	@GetMapping(value="/customerNotice")
	public String customerNotice(BoardVO vo, Model model, @ModelAttribute("bnowPage") String nowPage,
			@ModelAttribute("searchStyle") String searchStyle, @ModelAttribute("keyword") String keyword) {
		int bno = 3;
		if(nowPage == null || nowPage.equals("")){
			nowPage = "1";
		}
		if(searchStyle.equals("")) {
			keyword = "";
		}
		Map<String, Object> boardList = boardService.boardList(vo, Integer.parseInt(nowPage), searchStyle, keyword, "new", bno, 30);
		model.addAttribute("boardList", (List<BoardVO>)boardList.get("boardList"));
		model.addAttribute("boardPage", (PagingVO)boardList.get("boardPage"));
		model.addAttribute("searchStyle", searchStyle);
		model.addAttribute("keyword", keyword);
		return "customerNotice";
	}	
	
	@GetMapping(value="/customerNoticeDetail")
	public String customerNoticeDetail() {
		return "customerNoticeDetail";
	}	
	
	@GetMapping(value="/customerqna")
	public String customerqna() {
		return "customerqna";
	}	
	
	@GetMapping(value="/customNoticeWrite")
	public String customNoticeWrite() {
		return "customNoticeWrite";
	}	
	
	@PostMapping("/customNoticeWrite")
	public String boardWrite(BoardVO vo) {
		
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		vo.setId(loginUser.getId());
		vo.setBno(3); // 공지사항
		boardService.writeFreeBoard(vo);
		return "redirect:/customerNotice";
	}
	
	
	@GetMapping(value="/customClaimWrite")
	public String customClaimWrite() {
		return "customClaimWrite";
	}
	
	
	
}
