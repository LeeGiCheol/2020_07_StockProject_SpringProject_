package com.bitcamp.project.view.board;

import java.io.File;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.service.CommentService;
import com.bitcamp.project.service.impl.BoardServiceImpl;
import com.bitcamp.project.util.FileUpload;
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

	@Autowired
	HttpServletRequest request;

	static List<String> uploadedFileName = new ArrayList<String>();

	@GetMapping(value = "/board/free")
	public String boardList(BoardVO vo, Model model, @ModelAttribute("bnowPage") String nowPage,
			@ModelAttribute("searchStyle") String searchStyle, @ModelAttribute("keyword") String keyword,
			@ModelAttribute("orderby") String orderby /* new = 최신순 best = 인기순 */ ) {
		int bno = 1;

		if (nowPage == null || nowPage.equals("")) {
			nowPage = "1";
		}
		if (searchStyle.equals("")) {
			keyword = "";
		}
		System.out.println("path " + request.getServletPath());

		if (orderby.equals("")) {
			orderby = "new";
		}
		System.out.println("orderby "+orderby);
		Map<String, Object> boardList = boardService.boardList(vo, Integer.parseInt(nowPage), searchStyle, keyword,
				orderby, bno, 30);
		model.addAttribute("boardList", (List<BoardVO>) boardList.get("boardList"));
		model.addAttribute("boardPage", (PagingVO) boardList.get("boardPage"));
		model.addAttribute("searchStyle", searchStyle);
		model.addAttribute("keyword", keyword);
		
		List<BoardVO> ServiceCenternotice = new ArrayList<BoardVO>();
		model.addAttribute("ServiceCenternotice",boardService.ServiceCenternotice(vo));
		System.out.println("@@@@@@ : " + model.getAttribute("ServiceCenternotice"));

		return "free-board";
	}

	@GetMapping("/board/free/write")
	public String boardWriteView(BoardVO vo, Model model) {
		return "writeForm";
	}

	@PostMapping("/board/free/write")
	public String boardWrite(BoardVO vo) {

		UserVO loginUser = (UserVO) session.getAttribute("loginUser");
		vo.setId(loginUser.getId());
		vo.setBno(1); // 자유게시판

		List<String> uploadThumbnail = new ArrayList<String>();

		if (vo.getBcontent().contains("<img src=")) {
			String[] img = vo.getBcontent().split("<img src=\"/resources/se2/upload/");

			for (int i = 1; i < img.length; i++) {

				int start = img[i].indexOf("/Photo");
				int end = img[i].indexOf("\" title=\"");
				img[i] = img[i].substring(start - 8, end);
			}

			String thumbnail = null;

			try {
				for (int i = 0; i < uploadedFileName.size(); i++) {
					int a = 0;
					for (int j = 1; j < img.length; j++) {
						if (uploadedFileName.get(i).equals(img[j])) {
							uploadThumbnail.add(uploadedFileName.get(i));
							a++;
						}
					}

					thumbnail = request.getSession().getServletContext().getRealPath("/") + "resources/se2/upload/"
							+ uploadThumbnail.get(i).substring(0, 8) + "/THUMB_" + uploadThumbnail.get(i).substring(9);
					File thumbnailDelete = new File(thumbnail);
					if (thumbnailDelete.exists()) {
						// 파일을 삭제
						thumbnailDelete.delete();
					}
				}

				uploadedFileName.clear();

			} catch (Exception e) {
				e.printStackTrace();
			}

			boardService.writeFreeBoard(vo);
		} else {
			boardService.writeFreeBoard(vo);
		}
		return "redirect:/board/free";
	}

	@GetMapping("/board/free/detail")
	public ModelAndView getView(BoardVO vo, CommentVO cVo, PagingVO pVo, @ModelAttribute("bnowPage") String nowPage) {
		if (nowPage == null || nowPage.equals("")) {
			nowPage = "1";
		}

		ModelAndView mav = new ModelAndView();
		BoardVO boardDetail = boardService.getBoard(vo);
		boardService.updateViews(vo);
		Map<String, Object> commentList = commentService.commentList(cVo, Integer.parseInt(nowPage));
		mav.addObject("boardDetail", boardDetail);
		System.out.println("boardDetail " + boardDetail);
		mav.addObject("commentList", (List<CommentVO>) commentList.get("commentList"));
		mav.addObject("commentPage", (PagingVO) commentList.get("commentPage"));

		mav.setViewName("free-board-detail");

		return mav;
	}

	@GetMapping("/board/free/detail/ajax")
	public @ResponseBody Map<String, Object> getBoard(BoardVO vo, CommentVO cVo, PagingVO pVo,
			@ModelAttribute("bnowPage") String nowPage, @ModelAttribute("pno") int pno) {
		if (nowPage == null || nowPage.equals("")) {
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
		map.put("commentList", (List<CommentVO>) commentList.get("commentList"));
		map.put("commentPage", (PagingVO) commentList.get("commentPage"));
		map.put("boardPrevNext", boardPrevNext);

		return map;
	}

	@GetMapping("/board/detail/likes/ajax")
	@ResponseBody
	public int boardLikes(BoardVO vo, @RequestParam("pno") int pno) {
		UserVO uVo = (UserVO) session.getAttribute("loginUser");
		try {
			vo.setId(uVo.getId());
		} catch (Exception e) {
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
		BoardVO bVo = boardService.getBoard(vo);

		List<String> uploadThumbnail = new ArrayList<String>();

		if (vo.getBcontent().contains("<img src=")) {

			String[] img = vo.getBcontent().split("<img src=\"/resources/se2/upload/");
	
			for (int i = 1; i < img.length; i++) {
	
				int start = img[i].indexOf("/Photo");
				int end = img[i].indexOf("\" title=\"");
				img[i] = img[i].substring(start - 8, end);
			}
	
			String thumbnail = null;
	
			try {
				for (int i = 0; i < uploadedFileName.size(); i++) {
					int a = 0;
					for (int j = 1; j < img.length; j++) {
						if (uploadedFileName.get(i).equals(img[j])) {
							uploadThumbnail.add(uploadedFileName.get(i));
							a++;
						}
					}
	
					thumbnail = request.getSession().getServletContext().getRealPath("/") + "resources/se2/upload/"
							+ uploadedFileName.get(i).substring(0, 8) + "/THUMB_" + uploadedFileName.get(i).substring(9);
					File thumbnailDelete = new File(thumbnail);
					if (thumbnailDelete.exists()) {
						// 파일을 삭제
						thumbnailDelete.delete();
					}
				}
	
				boardService.updateBoard(vo);
				uploadedFileName.clear();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			
			boardService.updateBoard(vo);
		}
		return "redirect:/board/free";
	}

	@GetMapping("/board/free/delete")
	public String deleteBoard(BoardVO vo) {
		BoardVO bVo = boardService.getBoard(vo);
		List<String> uploadThumbnail = new ArrayList<String>();
		FileUpload fileUpload = new FileUpload();
		fileUpload.fileDel(bVo, uploadedFileName, uploadThumbnail, request);

		boardService.deleteBoard(vo);
		return "redirect:/board/free";
	}

	@PostMapping("/reportBoard")
	public ModelAndView reportBoard(BoardVO vo, @RequestParam("title") String title,
			@RequestParam("rtype") String rtype, @RequestParam("rcontent") String rcontent, HttpSession session,
			Model model) {
		System.out.println("title " + title);
		System.out.println("rtype " + rtype);
		vo.setTitle(title);
		vo.setRtype(rtype);
		vo.setRcontent(rcontent);
		UserVO user = (UserVO) session.getAttribute("loginUser");
		vo.setNickname(user.getNickname());

		int report = boardService.reportBoard(vo);

		ModelAndView mav = new ModelAndView();

		if (report == 1) {
			mav.addObject("msg", "해당 게시물이 신고 완료되었습니다.");
			mav.addObject("location", "/board/free/detail?pno=" + vo.getPno());
			mav.addObject("icon", "success");
			mav.setViewName("msg");
			return mav;
		} else {
			mav.addObject("msg", "신고는 1회만 가능합니다.");
			mav.addObject("location", "/board/free/detail?pno=" + vo.getPno());
			mav.addObject("icon", "error");
			mav.setViewName("msg");
			return mav;
		}

	}

	@RequestMapping("/fileUpload")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response) {
		FileUpload file = new FileUpload();
		BoardVO vo = file.file(request, response);
		uploadedFileName.add(vo.getThumbnailName());
		System.out.println(uploadedFileName);
	}

}
