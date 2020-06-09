package com.bitcamp.project.view.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.service.CommentService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.UserVO;

@Controller
public class CommentController {

	@Autowired
	CommentService commentService;
	@Autowired
	BoardService boardService;
	
    @RequestMapping(value="/board/writeComment")
    @ResponseBody
    public String writeCommentAjax(BoardVO bVo, CommentVO vo, HttpServletRequest request) throws Exception{
		// 게시물 옆에 댓글 개수 띄우기용
    	int commentCount = boardService.commentCount(bVo);
    	// 댓글 알림용
    	bVo.setCommentCount(commentCount);
    	commentService.commentNoticeInsert(bVo);
        HttpSession session = request.getSession();
        UserVO loginVO = (UserVO)session.getAttribute("loginUser");
        try {
        	vo.setNickname(loginVO.getNickname());
        	vo.setId(loginVO.getId());
        }
        catch(Exception e) {
        	System.out.println("로그인 해주세요 페이지 구현하기");
        }
        
        commentService.writeComment(vo);
        
        
        return "success";
    }

    @RequestMapping(value="/board/updateComment")
    @ResponseBody
    public String updateCommentAjax(CommentVO vo, @RequestParam("cno")int cno, @RequestParam("ccontent")String ccontent) throws Exception{
    	
    	vo.setCno(cno);
    	vo.setCcontent(ccontent);
    	commentService.updateComment(vo);
    	
    	return "success";
    }
    
    @RequestMapping(value="/board/deleteComment")
    @ResponseBody
    public String deleteCommentAjax(CommentVO vo, @RequestParam("cno")int cno) {
    	
    	vo.setCno(cno);
    	
    	commentService.deleteComment(vo);
    	
    	return "success";
    }
	
	
	
}


