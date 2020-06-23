package com.bitcamp.project.view.board;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.QnaService;
import com.bitcamp.project.vo.QnaVO;
import com.bitcamp.project.vo.UserVO;

@Controller
public class AdminController {
	
	@Autowired
	QnaService qnaService;
	@Autowired
	HttpSession session;
	

	@GetMapping("/admin/main")
	public ModelAndView adminPage() {
		ModelAndView mav = new ModelAndView();
		UserVO loginUser = (UserVO)session.getAttribute("loginUser");
		
		if(loginUser == null || loginUser.getPoint() >= 0) {
			mav.addObject("msg", "관리자만 접근할 수 있습니다");
			mav.addObject("location", "/mainPage");
			mav.addObject("icon", "error");
			mav.setViewName("msg");
		}
		
		mav.setViewName("adminPage");
		return mav;
	}
	
	@GetMapping("/admin/qna")
	public String adminQnaList(QnaVO vo, Model model, @ModelAttribute("bnowPage") String nowPage,
			@ModelAttribute("searchStyle") String searchStyle, @ModelAttribute("keyword") String keyword) {

		if (nowPage == null || nowPage.equals("")) {
			nowPage = "1";
		}
		if (searchStyle.equals("")) {
			keyword = "";
		}

		Map<String, Object> qnaList = qnaService.qnaList(vo, Integer.parseInt(nowPage), 30, searchStyle, keyword);
		return "adminQna";
	}
	
	@GetMapping("/admin/report")
	public String adminReportList() {
		return "adminReport";
	}
}
