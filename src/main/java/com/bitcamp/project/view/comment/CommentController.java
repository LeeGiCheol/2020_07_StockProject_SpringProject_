package com.bitcamp.project.view.comment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.bitcamp.project.service.CommentService;
import com.bitcamp.project.vo.CommentVO;

@Controller
public class CommentController {

	@Autowired
	CommentService commentService;
	
	@GetMapping("/board/comment")
	public List<CommentVO> commentList(CommentVO vo, Model model) {
		return commentService.getCommentList(vo);
	}
	
}
