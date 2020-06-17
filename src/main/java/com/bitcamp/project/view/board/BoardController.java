package com.bitcamp.project.view.board;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.service.CommentService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.UserVO;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	CommentService commentService;
	
	
	@GetMapping(value= {"/board/free", "/board/free/popularity"})
	public String boardList(BoardVO vo, Model model, @ModelAttribute("bnowPage") String nowPage,
							@ModelAttribute("searchStyle") String searchStyle, @ModelAttribute("keyword") String keyword,
							@ModelAttribute("orderby") String orderby /*new = 최신순 best = 인기순*/ ) {
		
		if(nowPage == null || nowPage.equals("")){
			nowPage = "1";
		}
		if(searchStyle.equals("")) {
			keyword = "";
		}
		if(orderby.equals("")) {
			orderby = "new";
		}
		Map<String, Object> boardList = boardService.boardList(vo, Integer.parseInt(nowPage), searchStyle, keyword, orderby);
		System.out.println("abd "+boardList);
		model.addAttribute("boardList", (List<BoardVO>)boardList.get("boardList"));
		model.addAttribute("boardPage", (PagingVO)boardList.get("boardPage"));
		model.addAttribute("searchStyle", searchStyle);
		model.addAttribute("keyword", keyword);
		
		
		if(orderby.equals("new")) {
			return "free-board";
		}
		else {
			return "free-board-best";
		}
	}
	
	
	
	
	
	@GetMapping("/board/free/write")
	public String boardWriteView(BoardVO vo, Model model) {
		return "writeForm";
	}
	
	
	@PostMapping("/board/free/write")
	public String boardWrite(BoardVO vo) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		vo.setId(loginUser.getId());
		vo.setBno(1); // 자유게시판
		
		System.out.println("BV " + vo);
		boardService.writeFreeBoard(vo);
		return "redirect:/board/free";
	}
	
	@GetMapping("/board/free/detail")
	public ModelAndView getView(BoardVO vo, CommentVO cVo, PagingVO pVo, @ModelAttribute("bnowPage") String nowPage) {
		if(nowPage == null || nowPage.equals("")){
			nowPage = "1";
		}
		ModelAndView mav = new ModelAndView();
		BoardVO boardDetail = boardService.getBoard(vo);
		boardService.updateViews(vo);
		Map<String, Object> commentList = commentService.commentList(cVo, Integer.parseInt(nowPage));
		mav.addObject("boardDetail", boardDetail);
		mav.addObject("commentList", (List<CommentVO>)commentList.get("commentList"));
		mav.addObject("commentPage", (PagingVO)commentList.get("commentPage"));
		
		
		mav.setViewName("free-board-detail");
		
		return mav;
	}
	
	@GetMapping("/board/free/detail/ajax")
	public @ResponseBody Map<String, Object> getBoard(BoardVO vo, CommentVO cVo, PagingVO pVo, @ModelAttribute("bnowPage") String nowPage, @ModelAttribute("pno") int pno) {
		if(nowPage == null || nowPage.equals("")){
			nowPage = "1";
		}
		vo.setPno(pno);
		BoardVO boardDetail = boardService.getBoard(vo);
		System.out.println(vo);
		List<BoardVO> boardPrevNext = boardService.boardPrevNext(vo);
		System.out.println(vo);
		// 댓글리스트
		Map<String, Object> commentList = commentService.commentList(cVo, Integer.parseInt(nowPage));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardDetail", boardDetail);
		map.put("commentList", (List<CommentVO>)commentList.get("commentList"));
		map.put("commentPage", (PagingVO)commentList.get("commentPage"));
		map.put("boardPrevNext", boardPrevNext);
		
		return map;
	}
	
	@GetMapping("/board/free/detail/likes/ajax")
	@ResponseBody
	public int boardLikes(BoardVO vo, @RequestParam("pno") int pno) {
		UserVO uVo = (UserVO)session.getAttribute("loginUser");
		try {
			vo.setId(uVo.getId());
		}catch(Exception e) {
			return 2;
		}
		
		vo.setPno(pno);
		return boardService.boardLikes(vo);
	}
	
	
	@GetMapping("/board/free/update")
	public String updateBoardView(BoardVO vo, Model model) {
		BoardVO boardUpdate = boardService.getBoard(vo);
		model.addAttribute("boardUpdate", boardUpdate);
//		System.out.println("mmmmm"+boardUpdate);
		return "updateForm";
	}

	@PostMapping("/board/free/update")
	public String updateBoard(BoardVO vo, Model model) {
//		System.out.println("test");
//		System.out.println(vo);
		boardService.updateBoard(vo);
		return "redirect:/board/free";
	}
	
	@GetMapping("/board/free/delete")
	public String deleteBoard(BoardVO vo) {
		boardService.deleteBoard(vo);
		return "redirect:/board/free";
	}
	
	
	@PostMapping("/reportBoard")
	public ModelAndView reportBoard(BoardVO vo, @RequestParam("title") String title, @RequestParam("rtype") String rtype, @RequestParam("rcontent") String rcontent, HttpSession session, Model model) {
		System.out.println("title "+title);
		System.out.println("rtype "+rtype);
		vo.setTitle(title);
		vo.setRtype(rtype);
		vo.setRcontent(rcontent);
		UserVO user = (UserVO)session.getAttribute("loginUser");
		vo.setNickname(user.getNickname());
		
		int report = boardService.reportBoard(vo);
		
		ModelAndView mav = new ModelAndView();
		
		if(report == 1) {
			mav.addObject("msg", "해당 게시물이 신고 완료되었습니다.");
			mav.addObject("location", "/board/free/detail?pno="+vo.getPno());
			mav.addObject("icon", "success");
			mav.setViewName("msg");
			return mav;
		}
		else {
			mav.addObject("msg", "신고는 1회만 가능합니다.");
			mav.addObject("location", "/board/free/detail?pno="+vo.getPno());
			mav.addObject("icon", "error");
			mav.setViewName("msg");
			return mav;
		}
		
	}
	
	
	
	@RequestMapping("/fileUpload")

	 public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response){

	    try {
	         //파일정보
	         String sFileInfo = "";
	         //파일명을 받는다 - 일반 원본파일명
	         String filename = request.getHeader("file-name");
	         //파일 확장자
	         String filename_ext = filename.substring(filename.lastIndexOf(".")+1);
	         //확장자를소문자로 변경
	         filename_ext = filename_ext.toLowerCase();
	         //파일 기본경로
	         String dftFilePath = request.getSession().getServletContext().getRealPath("/");
	         //파일 기본경로 _ 상세경로
	         String filePath = dftFilePath + "resources" + File.separator + "se2/upload" + File.separator;
	         System.out.println(filePath);
	         
	         File file = new File(filePath);
	         
	         if(!file.exists()) {
	            file.mkdirs();
	         }
	
	         String realFileNm = "";
	         SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
	         String today= formatter.format(new java.util.Date());
	
	         realFileNm = today+UUID.randomUUID().toString() + filename.substring(filename.lastIndexOf("."));
	         String rlFileNm = filePath + realFileNm;
	
	         ///////////////// 서버에 파일쓰기 ///////////////// 
	         InputStream is = request.getInputStream();
	         OutputStream os=new FileOutputStream(rlFileNm);
	
	         int numRead;
	         byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
	
	         while((numRead = is.read(b,0,b.length)) != -1){
	            os.write(b,0,numRead);
	         }
	
	         if(is != null) {
	            is.close();
	         }
	
	         os.flush();
	         os.close();
	
	         ///////////////// 서버에 파일쓰기 /////////////////
	
	         // 정보 출력
	         sFileInfo += "&bNewLine=true";
	
	         // img 태그의 title 속성을 원본파일명으로 적용시켜주기 위함
	         sFileInfo += "&sFileName="+ filename;;
	         sFileInfo += "&sFileURL="+"/resources/se2/upload/"+realFileNm;
	
	         PrintWriter print = response.getWriter();
	
	         print.print(sFileInfo);
	         System.out.println("sFileInfo "+sFileInfo);
	         print.flush();
	
	         print.close();
	
	    } catch (Exception e) {
	
	        e.printStackTrace();
	
	    }
	
	}



	
	
	
	
	
	
	
}
