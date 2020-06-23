package com.bitcamp.project.view.user;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import com.bitcamp.project.service.QnaService;
import com.bitcamp.project.util.FileUpload;
import com.bitcamp.project.view.board.BoardController;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.CommentVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.QnaVO;
import com.bitcamp.project.vo.UserVO;

@Controller
public class CustomerController {
	
	@Autowired
	BoardService boardService;

	@Autowired
	CommentService commentService;

	@Autowired
	QnaService qnaService;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	HttpServletRequest request;
	
	List<String> uploadedFileName = BoardController.uploadedFileName;
	
	@GetMapping(value="/customer")
	public String customerLanding(Model model, BoardVO vo) {
		vo.setBno(3);
		List<BoardVO> ServiceCenternotice = new ArrayList<BoardVO>();
		model.addAttribute("ServiceCenternotice",boardService.ServiceCenternotice(vo));
		
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
	@GetMapping("/customerNotice/detail")
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
		
		
		mav.setViewName("customerNoticeDetail");
		
		return mav;
	}
	
	@GetMapping("/customerNotice/detail/ajax")
	public @ResponseBody Map<String, Object> getBoard(BoardVO vo, CommentVO cVo, PagingVO pVo, @ModelAttribute("bnowPage") String nowPage, @ModelAttribute("pno") int pno) {
		if(nowPage == null || nowPage.equals("")){
			nowPage = "1";
		}
		vo.setPno(pno);
		BoardVO boardDetail = boardService.getBoard(vo);
		List<BoardVO> boardPrevNext = boardService.boardPrevNext(vo);
		// 댓글리스트
		Map<String, Object> commentList = commentService.commentList(cVo, Integer.parseInt(nowPage));
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("boardDetail", boardDetail);
		map.put("commentList", (List<CommentVO>)commentList.get("commentList"));
		map.put("commentPage", (PagingVO)commentList.get("commentPage"));
		map.put("boardPrevNext", boardPrevNext);
		
		return map;
	}
	
	@GetMapping(value="/customerqna")
	public String customerqnaView() {
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
		List<String> uploadThumbnail = new ArrayList<String>();

		if(vo.getBcontent().contains("<img src=")) {
			String[] img = vo.getBcontent().split("<img src=\"/resources/se2/upload/");
	
			for (int i = 1; i < img.length; i++) {
				
				int start = img[i].indexOf("/Photo");
				int end = img[i].indexOf("\" title=\"");
				img[i] = img[i].substring(start-8, end);
			}
			String thumbnail = null;
			try {
				for (int i = 0; i < uploadedFileName.size(); i++) {
					int a = 0;
					for (int j = 1; j < img.length; j++) {
						if(uploadedFileName.get(i).equals(img[j])) {
							uploadThumbnail.add(uploadedFileName.get(i));
							a++;
						}
					}
	
					thumbnail = request.getSession().getServletContext().getRealPath("/")+"resources/se2/upload/"+ uploadThumbnail.get(i).substring(0,8) + "/THUMB_" + uploadThumbnail.get(i).substring(9);
					File thumbnailDelete = new File(thumbnail);
					if(thumbnailDelete.exists()) {
					    // 파일을 삭제
						thumbnailDelete.delete();
					}
				}
				
				uploadedFileName.clear();
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
			boardService.writeFreeBoard(vo);
		}else {

		
			boardService.writeFreeBoard(vo);
		}
		return "redirect:/customerNotice";
	}
	
	@GetMapping("/customerNotice/update")
	public String updateBoardView(BoardVO vo, Model model) {
		BoardVO boardUpdate = boardService.getBoard(vo);
		model.addAttribute("boardUpdate", boardUpdate);
		return "customNoticeUpdate";
	}

	@PostMapping("/customerNotice/update")
	public String updateBoard(BoardVO vo, Model model) {
		BoardVO bVo = boardService.getBoard(vo);
		List<String> uploadThumbnail = new ArrayList<String>();
		
		if(vo.getBcontent().contains("<img src=")) {
			String[] img = vo.getBcontent().split("<img src=\"/resources/se2/upload/");
	
			for (int i = 1; i < img.length; i++) {
				
				int start = img[i].indexOf("/Photo");
				int end = img[i].indexOf("\" title=\"");
				img[i] = img[i].substring(start-8, end);
			}
			
	
			String thumbnail = null;
			
			try {
				for (int i = 0; i < uploadedFileName.size(); i++) {
					int a = 0;
					for (int j = 1; j < img.length; j++) {
						if(uploadedFileName.get(i).equals(img[j])) {
							uploadThumbnail.add(uploadedFileName.get(i));
							a++;
						}
					}
					
					thumbnail = request.getSession().getServletContext().getRealPath("/")+"resources/se2/upload/"+ uploadedFileName.get(i).substring(0,8) + "/THUMB_" + uploadedFileName.get(i).substring(9);
					File thumbnailDelete = new File(thumbnail);
					if(thumbnailDelete.exists()) {
					    // 파일을 삭제
						thumbnailDelete.delete();
					}
				}
				
				
				boardService.updateBoard(vo);
				uploadedFileName.clear();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}			
		boardService.updateBoard(vo);
		return "redirect:/customerNotice";
	}
	
	@GetMapping("/customNotice/delete")
	public String deleteBoard(BoardVO vo) {
		BoardVO bVo = boardService.getBoard(vo);
		List<String> uploadThumbnail = new ArrayList<String>();
		FileUpload fileUpload = new FileUpload();
		fileUpload.fileDel(bVo, uploadedFileName, uploadThumbnail, request);
		
		boardService.deleteBoard(vo);
		return "redirect:/customerNotice";
	}
	
	@GetMapping(value="/customerClaim/write")
	public String customClaimWriteView(Model model) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("location", "/signInPage");
			model.addAttribute("icon", "error");
			return "msg";
		}else {
			return "customerClaimWrite";
		}
	}
	@PostMapping(value="/customerClaim/write")
	public ModelAndView customClaimWrite(QnaVO vo) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		ModelAndView mav = new ModelAndView();
		
		if(loginUser == null) {
			mav.addObject("msg", "로그인이 필요한 페이지입니다.");
			mav.addObject("location", "/signInPage");
			mav.addObject("icon", "error");
			mav.setViewName("msg");
			return mav;
		}else {
		
			vo.setId(loginUser.getId());
			List<String> uploadThumbnail = new ArrayList<String>();

			FileUpload fu = new FileUpload();
			try {

				fu.thumbnailDel(null, vo, request, uploadedFileName, uploadThumbnail);
				uploadedFileName.clear();
				qnaService.writeQna(vo);
			}
			catch(Exception e) {
				qnaService.writeQna(vo);
			}
			
			mav.addObject("msg", "문의가 등록되었습니다");
			mav.addObject("location", "/customerClaim/list");
			mav.addObject("icon", "success");
			mav.setViewName("msg");
			
			return mav;
		}
	}
	
	@GetMapping(value="/customerClaim/list")
	public String customerQnaList(QnaVO vo, Model model, @ModelAttribute("bnowPage") String nowPage,
			@ModelAttribute("searchStyle") String searchStyle, @ModelAttribute("keyword") String keyword) {

		if (nowPage == null || nowPage.equals("")) {
			nowPage = "1";
		}
		if (searchStyle.equals("")) {
			keyword = "";
		}

		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("location", "/signInPage");
			model.addAttribute("icon", "error");
			return "msg";
		}
		else {
			vo.setId(loginUser.getId());
			
			
			Map<String, Object> qnaList = qnaService.qnaList(vo, Integer.parseInt(nowPage), 15, searchStyle, keyword);	
			model.addAttribute("qnaList", (List<QnaVO>) qnaList.get("qnaList"));
			model.addAttribute("qnaPage", (PagingVO) qnaList.get("qnaPage"));
			model.addAttribute("searchStyle", searchStyle);
			model.addAttribute("keyword", keyword);
			
			
		
			return "customerClaimList";
		}
	}
	
	@GetMapping(value="/customerClaim/detail")
	public String customerClaimDetail(QnaVO vo, Model model, @ModelAttribute("bnowPage") String nowPage) {
		if (nowPage == null || nowPage.equals("")) {
			nowPage = "1";
		}
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("location", "/signInPage");
			model.addAttribute("icon", "error");
			return "msg";
		}
		else {
		
		vo.setId(loginUser.getId());
		
		QnaVO qna = qnaService.qnaDetail(vo);
		model.addAttribute("qna", qna);
		model.addAttribute("qno", vo.getQno());
		return "customerClaimDetail";
		}
				
	}
	
	
	@GetMapping(value="/customerClaim/update")
	public String customerClaimUpdateView(QnaVO vo, Model model) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("location", "/signInPage");
			model.addAttribute("icon", "error");
			return "msg";
		}
		else {
			QnaVO qna = qnaService.qnaDetail(vo);
			model.addAttribute("qna", qna);
			model.addAttribute("qno", qna.getQno());
			return "customerClaimUpdate";
		}
	}

	@PostMapping(value="/customerClaim/update")
	public String customerClaimUpdate(QnaVO vo, Model model, @ModelAttribute("qno") int qno) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("location", "/signInPage");
			model.addAttribute("icon", "error");
			return "msg";
		}
		else {
			vo.setQno(qno);
			
			FileUpload fu = new FileUpload();
			try {
				List<String> uploadThumbnail = new ArrayList<String>();

				fu.thumbnailDel(null, vo, request, uploadedFileName, uploadThumbnail);
				uploadedFileName.clear();
				qnaService.qnaUpdate(vo);
			}
			catch(Exception e) {
				qnaService.qnaUpdate(vo);
			}
			
			
			
			
			return "redirect:/customerClaim/list";
		}
	}

	
	
	@GetMapping(value="/customerClaim/delete")
	public String customerClaimDelete(QnaVO vo, Model model, @ModelAttribute("qno") int qno) {
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		if(loginUser == null) {
			model.addAttribute("msg", "로그인이 필요한 페이지입니다.");
			model.addAttribute("location", "/signInPage");
			model.addAttribute("icon", "error");
			return "msg";
		}
		else {
			vo.setId(loginUser.getId());
			QnaVO qna = qnaService.qnaDetail(vo);
			
			
			int check = qnaService.qnaDelete(qna);
			if(check == 1) {
				model.addAttribute("msg", "문의를 삭제하였습니다.");
				model.addAttribute("location", "/customerClaim/list");
				model.addAttribute("icon", "success");
				
				return "msg";
			}
			else {
				model.addAttribute("msg", "문의를 삭제하지 못했습니다.");
				model.addAttribute("location", "/customerClaim/list");
				model.addAttribute("icon", "error");
				
				return "msg";
				
			}
		}
	}
	
	
			
	
}
