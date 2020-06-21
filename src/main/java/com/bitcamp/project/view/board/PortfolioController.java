package com.bitcamp.project.view.board;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.service.CommentService;
import com.bitcamp.project.util.FileUpload;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.UserVO;

@Controller
public class PortfolioController {
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	CommentService commentService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	@Autowired
	HttpServletResponse response;
	
	List<String> uploadedFileName =BoardController.uploadedFileName;
	
	
	@GetMapping(value= {"/board/portfolio", "/board/portfolio/best"})
	public String portfolioBoard(BoardVO vo, Model model, @ModelAttribute("bnowPage") String nowPage,
							@ModelAttribute("searchStyle") String searchStyle, @ModelAttribute("keyword") String keyword,
							@ModelAttribute("orderby") String orderby /*new = 최신순 best = 인기순*/ ) {
		int bno = 2;
		
		if(nowPage == null || nowPage.equals("")){
			nowPage = "1";
		}
		if(searchStyle.equals("")) {
			keyword = "";
		}
		if(request.getServletPath().equals("/board/portfolio/best")) {
			orderby = "best";
		}
		else if(request.getServletPath().equals("/board/portfolio")) {
			orderby = "new";
		}
		else if(orderby.equals("")) {
			orderby = "new";
		}
		
        String FilePath = request.getSession().getServletContext().getRealPath("/")+"resources/se2/upload/";
        
        vo.setThumbnailName(FilePath+vo.getThumbnailName());
        
		Map<String, Object> boardList = boardService.boardList(vo, Integer.parseInt(nowPage), searchStyle, keyword, orderby, bno, 12);
		model.addAttribute("portfolioList", (List<BoardVO>)boardList.get("portfolioList"));
		model.addAttribute("boardPage", (PagingVO)boardList.get("boardPage"));
		model.addAttribute("searchStyle", searchStyle);
		model.addAttribute("keyword", keyword);
		model.addAttribute("path", FilePath);
		System.out.println("searchStyle "+searchStyle);
		System.out.println("keyword "+keyword);
		
		if(orderby.equals("new")) {
			return "portfolio-board";
		}
		else {
			return "portfolio-board-best";
		}
	}
	
	
	
	
	@GetMapping("/board/portfolio/write")
	public String portfolioWriteForm() {
		return "portfolio-writeForm";
	}
	
	
	@PostMapping("/board/portfolio/write")
	public String portfolioWrite(BoardVO vo) {
		
		List<String> uploadThumbnail = new ArrayList<String>();
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
        SimpleDateFormat folderNameFormatter = new SimpleDateFormat("yyyyMMdd");
		vo.setId(loginUser.getId());
		vo.setBno(2); // 포트폴리오 게시판
		
		
		String[] img = vo.getBcontent().split("/resources/se2/upload/");

		for (int i = 0; i < img.length; i++) {
			if(img[i].indexOf("/Photo") != -1) {
				int start = img[i].indexOf("/Photo");
				int end = img[i].indexOf("\" title=\"");
				img[i] = img[i].substring(start-8, end);
			}
		}
		
		

		String thumbnail = null;
		
		try {
			if(uploadedFileName.size() != 0) {
				for (int i = 0; i < img.length; i++) {
					int a = 0;
					for (int j = 0; j < uploadedFileName.size(); j++) {
						if(uploadedFileName.get(j).equals(img[i])) {
							uploadThumbnail.add(uploadedFileName.get(j));
							a++;
						}
					}
					// 파일이 존재하지 않을 경우 삭제 - 삭제하니까 업데이트가 불가(새로 추가하는 파일은 상관없으나 기존에 있던 파일을 지울경우 안)
	//				if(a != 1) {
	//					String origin = request.getSession().getServletContext().getRealPath("/")+"resources/se2/upload/"+uploadedFileName.get(i);
	//					File originDelete = new File(origin);
	//					thumbnail = request.getSession().getServletContext().getRealPath("/")+"resources/se2/upload/"+ uploadedFileName.get(i).substring(0,8) + "/THUMB_" + uploadedFileName.get(i).substring(9);
	//					File thumbnailDelete = new File(thumbnail);
	//					
	//					// 파일이 존재하는지 체크 존재할경우 true, 존재하지않을경우 false
	//					if(originDelete.exists()) {
	//					    // 파일을 삭제합니다.
	//						originDelete.delete();
	//						thumbnailDelete.delete();
	//					}
	//					    
	//				}
				}
				
	//			List<String> upload = multiplePhotoUpload(request, response);
				
				
				for (int i = 1; i < uploadThumbnail.size(); i++) {
					thumbnail = request.getSession().getServletContext().getRealPath("/")+"resources/se2/upload/"+ uploadThumbnail.get(i).substring(0,8) + "/THUMB_" + uploadThumbnail.get(i).substring(9);
					File thumbnailDelete = new File(thumbnail);
					if(thumbnailDelete.exists()) {
						thumbnailDelete.delete(); 
					}
				}
				
				vo.setThumbnailName("/resources/se2/upload/"+img[1].substring(0,8) + "/THUMB_" + img[1].substring(9));
				uploadedFileName.clear();
				boardService.writeFreeBoard(vo);
			}
			else {
				boardService.writeFreeBoard(vo);
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		// vo에 저장 후 리셋
		
		
		
		return "redirect:/board/portfolio";
	}
	
	
	@GetMapping("/board/portfolio/detail")
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
		
		
		mav.setViewName("portfolio-board-detail");
		
		return mav;
	}
	
	@GetMapping("/board/portfolio/detail/ajax")
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


	
	@GetMapping("/board/portfolio/update")
	public String updateBoardView(BoardVO vo, Model model) {
		BoardVO boardUpdate = boardService.getBoard(vo);
		model.addAttribute("boardUpdate", boardUpdate);
//		System.out.println("mmmmm"+boardUpdate);
		return "portfolioUpdateForm";
	}

	@PostMapping("/board/portfolio/update")
	public String updateBoard(BoardVO vo, Model model) {
		vo.setBno(2);
		List<String> uploadThumbnail = new ArrayList<String>();
		
		FileUpload fileUpload = new FileUpload();
		if(uploadedFileName.size() != 0){
			vo = fileUpload.fileUpdate(vo, uploadedFileName, uploadThumbnail, request);
		}	
		else {
			vo = fileUpload.fileUpdate(vo, uploadedFileName, uploadThumbnail, request);
		}
		boardService.updateBoard(vo);
		return "redirect:/board/portfolio";
	}
	
	@GetMapping("/board/portfolio/delete")
	public String deleteBoard(BoardVO vo) {
		BoardVO bVo = boardService.getBoard(vo);
		List<String> uploadThumbnail = new ArrayList<String>();

		FileUpload fileUpload = new FileUpload();
		vo = fileUpload.fileDel(bVo, uploadedFileName, uploadThumbnail, request);
		
		boardService.deleteBoard(vo);
		return "redirect:/board/portfolio";
	
	}

	
}

