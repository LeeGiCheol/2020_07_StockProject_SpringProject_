package com.bitcamp.project.view.board;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Date;
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
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.AdminService;
import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.vo.AdminVO;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.UserVO;

@Controller
public class AdminController {
	
	@Autowired
	AdminService adminService;
	@Autowired
	BoardService boardService;
	@Autowired
	HttpSession session;
	

	@GetMapping("/admin/main")
	public ModelAndView adminPage(BoardVO bVo, AdminVO vo, Model model, @ModelAttribute("bnowPage") String nowPage,
			@ModelAttribute("searchStyle") String searchStyle, @ModelAttribute("keyword") String keyword) {
		ModelAndView mav = new ModelAndView();
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null || loginUser.getPoint() >= 0) {
			mav.addObject("msg", "관리자만 접근할 수 있습니다");
			mav.addObject("location", "/mainPage");
			mav.addObject("icon", "error");
			mav.setViewName("msg");
		}
		
		
		List<BoardVO> boardChart = adminService.boardChart(bVo);
		System.out.println("boardChart "+boardChart);
		mav.addObject("boardChart", boardChart);
		
		
		
		loginUser.getPoint();
		
		
		if (nowPage == null || nowPage.equals("")) {
			nowPage = "1";
		}
		if (searchStyle.equals("")) {
			keyword = "";
		}

		Map<String, Object> qnaList = adminService.qnaList(vo, 0, "", "", 5, "main");
		System.out.println("여 기 " +qnaList);
		model.addAttribute("qnaList", (List<AdminVO>) qnaList.get("qnaList"));
		
		
		
		
		mav.setViewName("adminPage");
		return mav;
	}
	
	
	@GetMapping("/admin/qna")
	public String adminQnaList(AdminVO vo, Model model, @ModelAttribute("bnowPage") String nowPage,
			@ModelAttribute("searchStyle") String searchStyle, @ModelAttribute("keyword") String keyword) {

		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null || loginUser.getPoint() >= 0) {
			model.addAttribute("msg", "관리자만 접근할 수 있습니다");
			model.addAttribute("location", "/mainPage");
			model.addAttribute("icon", "error");
			return "msg";
		}
		
		loginUser.getPoint();
		
		
		if (nowPage == null || nowPage.equals("")) {
			nowPage = "1";
		}
		if (searchStyle.equals("")) {
			keyword = "";
		}

		Map<String, Object> qnaList = adminService.qnaList(vo, Integer.parseInt(nowPage), searchStyle, keyword, 30, "");
		model.addAttribute("qnaList", (List<AdminVO>) qnaList.get("qnaList"));
		model.addAttribute("qnaPage", (PagingVO) qnaList.get("qnaPage"));
		model.addAttribute("searchStyle", searchStyle);
		model.addAttribute("keyword", keyword);
		return "adminQna";
	}
	
	@GetMapping("/admin/qna/detail")
	public ModelAndView adminQnaDetail(AdminVO vo) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
		ModelAndView mav = new ModelAndView();
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");

		if(loginUser == null || loginUser.getPoint() >= 0) {
			mav.addObject("msg", "관리자만 접근할 수 있습니다");
			mav.addObject("location", "/mainPage");
			mav.addObject("icon", "error");
			mav.setViewName("msg");
			
			return mav;
		}
		
		int check = adminService.qnaCount(vo);
		if(check == 1) {
			vo.setAno(1);
		}
		else
			vo.setAno(-1);
		
		
		// TestVO == VO 클래스
		// testVO == TestVO Instance
		
		
		
		AdminVO qnaDetail = adminService.qnaDetail(vo);
		
			qnaDetail.setQdateTime(new Date(qnaDetail.getQdateTime().getTime()- (1000 * 60 * 60 * 9)));
			if(qnaDetail.getAno() != 0) {
				qnaDetail.setAdateTime(new Date(qnaDetail.getAdateTime().getTime()- (1000 * 60 * 60 * 9)));
				
			}
		
		System.out.println("?? " + qnaDetail);
		mav.addObject("qna", qnaDetail);
		mav.setViewName("adminQnaDetail");
		
		return mav;
	}
	
	
	
	@GetMapping(value="/admin/qna/answer/write")
	public String qnaAnswerWriteView(AdminVO vo, Model model, @ModelAttribute("qno") int qno) {
		vo.setQno(qno);
		AdminVO qnaDetail = adminService.qnaDetail(vo);
		System.out.println("관리자 "+qnaDetail);
		model.addAttribute("qna", qnaDetail);
		model.addAttribute("qno", vo.getQno());
		return "qnaAnswerWrite";
	}
	
	@PostMapping(value="/admin/qna/answer/write")
	public String qnaAnswerWrite(AdminVO vo, Model model, @ModelAttribute("qno") int qno, @ModelAttribute("acontent") String acontent) {
		System.out.println(vo.getAcontent());
		vo.setQno(qno);
		
		int check = adminService.qnaCount(vo);
		if(check == 1) {
			vo.setAno(1);
		}
		else
			vo.setAno(-1);
		System.out.println("v?o "+vo);
		AdminVO qnaDetail = adminService.qnaDetail(vo);
		qnaDetail.setAcontent(acontent);
		System.out.println("v?o2 "+qnaDetail);
		System.out.println("detail "+qnaDetail);
		System.out.println("관리자 "+qnaDetail);
		model.addAttribute("qna", qnaDetail);
		adminService.writeAnswer(qnaDetail);
		
		
		return "redirect:/admin/qna/detail?qno="+vo.getQno();
	}
//			
//	@GetMapping(value="/admin/qna/answer/write")
//	public String qnaAnswerWrite(AdminVO vo, Model model, @ModelAttribute("qno") int qno) {
//		
//		vo.setQno(qno);
//		vo.setAno(-1);
//		AdminVO qnaDetail = adminService.qnaDetail(vo);
//		System.out.println("관리자 "+qnaDetail);
//		model.addAttribute("qna", qnaDetail);
//		adminService.writeAnswer(qnaDetail);
//		
//		
//		return "adminQna";
//	}
//	
	
//	@GetMapping("/admin/qna/detail/ajax")
//	public @ResponseBody Map<String, Object> adminQnaDetailAjax(AdminVO vo) {
//		System.out.println(vo);
//		AdminVO qnaDetail = adminService.qnaDetail(vo);
//		System.out.println(vo);
//		// 댓글리스트
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("qnaDetail", qnaDetail);
//		return map;
//	}
	
	
	@GetMapping("/admin/qna/delete")
	public String adminQnaDelete(AdminVO vo) {
		System.out.println("as "+vo);
		if(vo.getAno() != 0) {
			adminService.answerDelete(vo);
		}
		else if(vo.getQno() != 0) {
			adminService.questionDelete(vo);
		}
			
		
		return "redirect:/adminQna";
	}
	
	
	
	@GetMapping("/admin/report")
	public String adminReportList(AdminVO vo, HttpServletRequest request, Model model, @ModelAttribute("bnowPage") String nowPage,
			@ModelAttribute("searchStyle") String searchStyle, @ModelAttribute("keyword") String keyword,
			@ModelAttribute("orderby") String orderby ) {

		if (nowPage == null || nowPage.equals("")) {
			nowPage = "1";
		}
		if (searchStyle.equals("")) {
			keyword = "";
		}

		if (orderby.equals("")) {
			orderby = "new";
		}
		Map<String, Object> reportList = adminService.reportList(vo, Integer.parseInt(nowPage), 30, searchStyle, keyword);
		model.addAttribute("reportList", (List<AdminVO>) reportList.get("reportList"));
		model.addAttribute("reportPage", (PagingVO) reportList.get("reportPage"));
		model.addAttribute("searchStyle", searchStyle);
		model.addAttribute("keyword", keyword);
		
		
		
		return "adminReport";
	}
	
}
