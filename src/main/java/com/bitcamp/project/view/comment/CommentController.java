package com.bitcamp.project.view.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.project.service.CommentService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.UserVO;

@Controller
public class CommentController {

	@Autowired
	CommentService commentService;
	
	
    @RequestMapping(value="/board/writeComment")
    @ResponseBody
    public String writeCommentAjax(BoardVO bVo, CommentVO vo, HttpServletRequest request) throws Exception{
        
        HttpSession session = request.getSession();
        UserVO loginVO = (UserVO)session.getAttribute("loginUser");
        try {
        	vo.setNickname(loginVO.getNickname());
        	vo.setId(loginVO.getId());
        }
        catch(Exception e) {
        	System.out.println("로그인 해주세요 페이지 구현하기");
        }
        
        
        System.out.println("테스트b = "+bVo);
        System.out.println("테스트c = "+vo);
        commentService.writeComment(vo);
        
        
        return "success";
    }
	
	
	
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
