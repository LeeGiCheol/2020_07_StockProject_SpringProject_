package com.bitcamp.project.view.board;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.service.CommentService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class BoardController_origin {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	CommentService commentService;
	
	
	@RequestMapping(value="/board/free/detail.ajax")
	@ResponseBody
	public String getBoard(BoardVO vo, CommentVO cVo, Model model, @ModelAttribute("bnowPage") String nowPage) throws JsonProcessingException {
		if(nowPage == null || nowPage.equals("")){
			nowPage = "1";
		}
		
		int nowPage_ = Integer.parseInt(nowPage);
//		System.out.println("test1 "+vo);
		BoardVO boardDetail = boardService.getBoard(vo);
//		System.out.println("test2 "+boardDetail);
//		
//		System.out.println("session "+session.getAttribute("loginUser"));
//		System.out.println("model "+boardDetail.getNickname());
//		model.addAttribute("boardDetail", boardDetail);
		
		String returnVal = "jsonView";

		// 댓글리스트
		//cVo.setPno(pno);
		Map<String, Object> commentList = commentService.commentList(cVo, Integer.parseInt(nowPage));
		ModelAndView mav = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		
		

		
//		map.put("boardDetail", boardDetail);
//		map.put("commentList", (List<CommentVO>)commentList.get("commentList"));
//		map.put("commentPage", (PagingVO)commentList.get("commentPage"));
		mav.addObject("boardDetail", vo);
		mav.addObject("commentList", cVo);
		mav.addObject("commentPage", nowPage);
//		mav.addObject("boardDetail", boardDetail);
//		mav.addObject("commentList", (List<CommentVO>)commentList.get("commentList"));
//		mav.addObject("commentPage", (PagingVO)commentList.get("commentPage"));
//		mav.setViewName("/board/free/detail");
		mav.setViewName("free-board-detail");
		
		ObjectMapper mapper = new ObjectMapper();

		String json = mapper.writeValueAsString(map); System.out.println(json); // compact-print 
		json = mapper.writerWithDefaultPrettyPrinter().writeValueAsString(map);
		System.out.println(commentList);
		return returnVal;

	}
	
//	
//	@GetMapping("/board/free/detail/a")
//	public String getBoardJson() {
//		
//		return "free-board-detail";
//
//	}
//	
//		
	
}
