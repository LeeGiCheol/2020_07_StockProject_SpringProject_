package com.bitcamp.project.view.board;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

	List<String> uploadedFileName = BoardController.uploadedFileName;

	@GetMapping(value = "/board/portfolio")
	public String portfolioBoard(BoardVO vo, Model model, @ModelAttribute("bnowPage") String nowPage,
			@ModelAttribute("searchStyle") String searchStyle, @ModelAttribute("keyword") String keyword,
			@ModelAttribute("orderby") String orderby /* new = 최신순 best = 인기순 */ ) {
		String bno = "portfolio";

		if (nowPage == null || nowPage.equals("")) {
			nowPage = "1";
		}
		if (searchStyle.equals("")) {
			keyword = "";
		}
		if (orderby.equals("")) {
			orderby = "new";
		}

		String FilePath = request.getSession().getServletContext().getRealPath("/") + "resources/se2/upload/";

		vo.setThumbnailName(FilePath + vo.getThumbnailName());

		Map<String, Object> boardList = boardService.boardList(vo, Integer.parseInt(nowPage), searchStyle, keyword,
				orderby, bno, 12);
		model.addAttribute("portfolioList", (List<BoardVO>) boardList.get("portfolioList"));
		model.addAttribute("boardPage", (PagingVO) boardList.get("boardPage"));
		model.addAttribute("searchStyle", searchStyle);
		model.addAttribute("keyword", keyword);
		model.addAttribute("path", FilePath);

		return "board/portfolio-board";
	}

	@GetMapping("/board/portfolio/write")
	public String portfolioWriteForm() {
		return "board/portfolio-writeForm";
	}

	@PostMapping("/board/portfolio/write")
	public String portfolioWrite(BoardVO vo, Model model) {

		List<String> uploadThumbnail = new ArrayList<String>();
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		if(loginUser == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("location", "/signInPage");
			model.addAttribute("icon", "error");
			return "msg/msg";
		}
		
		vo.setId(loginUser.getId());
		vo.setBno("portfolio"); // 포트폴리오 게시판

		if (vo.getBcontent().contains("<img src=")) {

			String[] img = vo.getBcontent().split("<img src=\"/resources/se2/upload/");

			
			for (int i = 1; i < img.length; i++) {

				int start = img[i].indexOf("/Photo");
				int end = img[i].indexOf("\" title=\"");
				img[i] = img[i].substring(start - 8, end);
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
					}
					
					
					
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
		}
		else {
			boardService.writeFreeBoard(vo);
		}
			return "redirect:/board/portfolio";

	}

	@GetMapping("/board/portfolio/detail")
	public ModelAndView getView(BoardVO vo, CommentVO cVo, PagingVO pVo, @ModelAttribute("bnowPage") String nowPage) {
		if (nowPage == null || nowPage.equals("")) {
			nowPage = "1";
		}
		ModelAndView mav = new ModelAndView();
		BoardVO boardDetail = boardService.getBoard(vo);
		boardService.updateViews(vo);
		Map<String, Object> commentList = commentService.commentList(cVo, Integer.parseInt(nowPage));
		mav.addObject("boardDetail", boardDetail);
		mav.addObject("commentList", (List<CommentVO>) commentList.get("commentList"));
		mav.addObject("commentPage", (PagingVO) commentList.get("commentPage"));

		mav.setViewName("board/portfolio-board-detail");

		return mav;
	}

	@GetMapping("/board/portfolio/detail/ajax")
	public @ResponseBody Map<String, Object> getBoard(BoardVO vo, CommentVO cVo, PagingVO pVo,
			@ModelAttribute("bnowPage") String nowPage, @ModelAttribute("pno") int pno) {
		if (nowPage == null || nowPage.equals("")) {
			nowPage = "1";
		}
		vo.setPno(pno);
		vo.setBno("portfolio");
		BoardVO boardDetail = boardService.getBoard(vo);
		System.out.println(vo);
		List<BoardVO> boardPrevNext = boardService.boardPrevNext(vo);
		System.out.println(vo);
		// 댓글리스트
		Map<String, Object> commentList = commentService.commentList(cVo, Integer.parseInt(nowPage));
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		
		List<CommentVO> comment = (List<CommentVO>) commentList.get("commentList");
		
		// 아이폰에서 시간이 제대로 표시 안되는 관계로 String으로 형변환
		// mysql Timezone이 UTC로 설정되어있어 시간 재설정
		// 게시물
		boardDetail.setBdateTime(new Date(boardDetail.getBdateTime().getTime()- (1000 * 60 * 60 * 9)));
		Date from = boardDetail.getBdateTime();
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String boardDate = transFormat.format(from);
		// 댓글
		String commentDateString = null;
		List<String> commentDate = new ArrayList<String>();
		for (int i = 0; i < comment.size(); i++) {
			comment.get(i).setCdateTime(new Date(comment.get(i).getCdateTime().getTime()- (1000 * 60 * 60 * 9)));
			Date commentDate_ = comment.get(i).getCdateTime();
			commentDateString = transFormat.format(commentDate_);
			commentDate.add(commentDateString);
		}
		
		
		map.put("boardDetail", boardDetail);
		map.put("commentList", comment);
		map.put("commentPage", (PagingVO) commentList.get("commentPage"));
		map.put("boardPrevNext", boardPrevNext);
		map.put("boardDate", boardDate);
		map.put("commentDate", commentDate);
		return map;
	}

	@GetMapping("/board/portfolio/update")
	public String updateBoardView(BoardVO vo, Model model) {
		BoardVO boardUpdate = boardService.getBoard(vo);
		model.addAttribute("boardUpdate", boardUpdate);
		return "board/portfolio-updateForm";
	}

	@PostMapping("/board/portfolio/update")
	public String updateBoard(BoardVO vo, Model model) {
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		if(loginUser == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("location", "/signInPage");
			model.addAttribute("icon", "error");
			return "msg/msg"; 
		}
		
		
		vo.setBno("portfolio");
		List<String> uploadThumbnail = new ArrayList<String>();

		FileUpload fileUpload = new FileUpload();
		vo = fileUpload.fileUpdate(vo, uploadedFileName, uploadThumbnail, request);
		boardService.updateBoard(vo);
		return "redirect:/board/portfolio";
	}

	@GetMapping("/board/portfolio/delete")
	public String deleteBoard(BoardVO vo, Model model) {
		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		
		if(loginUser == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("location", "/signInPage");
			model.addAttribute("icon", "error");
			return "msg/msg";
		}
		
		BoardVO bVo = boardService.getBoard(vo);
		List<String> uploadThumbnail = new ArrayList<String>();

		FileUpload fileUpload = new FileUpload();
		vo = fileUpload.fileDel(bVo, null, uploadedFileName, uploadThumbnail, request);

		boardService.deleteBoard(vo);
		return "redirect:/board/portfolio";

	}

}
