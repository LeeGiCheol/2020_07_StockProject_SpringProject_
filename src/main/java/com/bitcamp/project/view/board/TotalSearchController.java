package com.bitcamp.project.view.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.BoardService;

@Controller
public class TotalSearchController {

	@Autowired
	BoardService boardService;
	@Autowired
	HttpServletRequest request;

	// 기본검색
	// 기본검색 좋아요순
	@GetMapping(value= {"/total-search", "/total-search/free/best", "/total-search/portfolio/best"})
	public ModelAndView totalSearch(@ModelAttribute("keyword") String title) {
		ModelAndView mav = new ModelAndView();
		int check = 0;
		List list = boardService.totalSearch(title, check);

		List stock = (List) list.get(0);
		List free =  (List)list.get(1);
		List port =  (List)list.get(2);
		List nick =  (List)list.get(3);
		int stockCount = (int) list.get(4);
		int freeCount = (int) list.get(5);
		int portCount = (int) list.get(6);
		int nickCount = (int) list.get(7);

		
		
		
		if(request.getServletPath().equals("/total-search/free/best")) {
			check = 1;
			list = boardService.totalSearch(title, check);
			
			
			free =  (List)list.get(1);
			freeCount = (int) list.get(5);
			mav.addObject("free", free);
			mav.addObject("freeCount", freeCount);

			check = 0;
			list = boardService.totalSearch(title, check);
			
			port =  (List)list.get(2);
			portCount = (int) list.get(6);
			mav.addObject("port", port);
			mav.addObject("portCount", portCount);
		}
		else if(request.getServletPath().equals("/total-search/portfolio/best")) {
			check = 1;
			list = boardService.totalSearch(title, check);
			port =  (List)list.get(2);
			portCount = (int) list.get(6);
			mav.addObject("port", port);
			mav.addObject("portCount", portCount);
			
			check = 0;
			list = boardService.totalSearch(title, check);
			
			free =  (List)list.get(1);
			freeCount = (int) list.get(5);
			mav.addObject("free", free);
			mav.addObject("freeCount", freeCount);
		}
		
		else {
			mav.addObject("free", free);
			mav.addObject("port", port);
			mav.addObject("freeCount", freeCount);
			mav.addObject("portCount", portCount);
		}
		
		
		mav.addObject("stock", stock);
		mav.addObject("nick", nick);
		mav.addObject("keyword", title);
		mav.addObject("stockCount", stockCount);
		mav.addObject("nickCount", nickCount);
		
	
		mav.setViewName("total_Search_Result");
		return mav;
	}
	
	// 상세검색
	@GetMapping(value= {"/total-search/free", "/total-search/portfolio", "/total-search/user", "/total-search/stock"})
	public ModelAndView totalSearchDetail(@ModelAttribute("keyword") String title) {
		ModelAndView mav = new ModelAndView();
		int check = 2;
		
		List list = boardService.totalSearch(title, check);
		
		if(request.getServletPath().equals("/total-search/stock")) {
			List stock =  (List)list.get(0);
			int stockCount = (int) list.get(4);
			mav.addObject("stock", stock);
			mav.addObject("stockCount", stockCount);
			mav.setViewName("jongmok_Search_Result");
		}
		if(request.getServletPath().equals("/total-search/free")) {
			List free =  (List)list.get(1);
			int freeCount = (int) list.get(5);
			mav.addObject("free", free);
			mav.addObject("freeCount", freeCount);
			mav.setViewName("free-board_Search_Result");
		}
		else if(request.getServletPath().equals("/total-search/portfolio")) {
			List port =  (List)list.get(2);
			int portCount = (int) list.get(6);
			mav.addObject("port", port);
			mav.addObject("portCount", portCount);
			mav.setViewName("portfolio_Search_Result");
		}
		
		else if(request.getServletPath().equals("/total-search/user")) {
			List nick =  (List)list.get(3);
			int nickCount = (int) list.get(7);
			mav.addObject("nick", nick);
			mav.addObject("nickCount", nickCount);
			mav.setViewName("user_Search_Result");
		}

		
		mav.addObject("keyword", title);
		
		return mav;
	}

	
	// 상세검색 좋아요 순 
	@GetMapping(value= {"/total-search/free/detail/best", "/total-search/portfolio/detail/best"})
	public ModelAndView totalSearchBestDetail(@ModelAttribute("keyword") String title) {

		
		ModelAndView mav = new ModelAndView();
		int check = 3;
		List list = boardService.totalSearch(title, check);
		
		if(request.getServletPath().equals("/total-search/free/detail/best")) {
			List free =  (List)list.get(1);
			int freeCount = (int) list.get(5);
			mav.addObject("free", free);
			mav.addObject("freeCount", freeCount);
			mav.setViewName("free-board_Search_Result");
		}
		else if(request.getServletPath().equals("/total-search/portfolio/detail/best")) {
			List port =  (List)list.get(2);
			int portCount = (int) list.get(6);
			mav.addObject("port", port);
			mav.addObject("portCount", portCount);
			mav.setViewName("portfolio_Search_Result");
		}
		
		
		return mav;
	}
	
}
