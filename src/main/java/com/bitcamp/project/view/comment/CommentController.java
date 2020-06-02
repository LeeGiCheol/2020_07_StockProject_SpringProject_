package com.bitcamp.project.view.comment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.CommentService;
import com.bitcamp.project.vo.CommentPaging;
import com.bitcamp.project.vo.CommentVO;

@Controller
public class CommentController {

	@Autowired
	CommentService commentService;
	
//	@PostMapping("/board/writeComment")
//	public String writeComment(@ModelAttribute CommentVO vo, Model model) {
//		String test = (String) model.getAttribute("commentList");
//		System.out.println("pnopnopno " + test);
//		System.out.println("pnpnpnpnpnpn" + vo.getPno());
//		commentService.writeComment(vo); 
//		
//		Map<String, Object> map = new HashMap<String, Object>();
//		System.out.println(vo.toString());
//		
//		return "";
//	}
	
	
//	
//	
//	 @RequestMapping("/board/writeComment")
//	    public ModelAndView list(@RequestParam int cno,
//	                            @RequestParam(defaultValue="1") int curPage,
//	                            ModelAndView mav,
//	                            HttpSession session){
//	        // **페이징 처리 
//	        int count = commentService.count(cno); // 댓글 갯수
//	        CommentPaging commentPaging = new CommentPaging(count, curPage);
//	        int start = commentPaging.getPageBegin();
//	        int end = commentPaging.getPageEnd();
//	        List<CommentVO> list = commentService.list(cno, start, end, session);
//	        // 뷰이름 지정
//	        mav.setViewName("board/replyList");
//	        // 뷰에 전달할 데이터 지정
//	        mav.addObject("list", list);
//	        mav.addObject("commentPaging", commentPaging);
//	        // replyList.jsp로 포워딩
//	        return mav;
//	    }
//	
}
