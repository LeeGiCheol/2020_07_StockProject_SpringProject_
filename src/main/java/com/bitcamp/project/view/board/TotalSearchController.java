package com.bitcamp.project.view.board;

import java.util.List;
import java.util.Map;

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

	@GetMapping("/total-search")
	public ModelAndView totalSearch(@ModelAttribute("keyword") String title) {
		ModelAndView mav = new ModelAndView();
		List list = boardService.totalSearch(title);

		System.out.println(list);
		List stock = (List) list.get(0);
		List free =  (List)list.get(1);
		List port =  (List)list.get(2);
		List nick =  (List)list.get(3);

		mav.addObject("stock", stock);
		mav.addObject("free", free);
		mav.addObject("port", port);
		mav.addObject("nick", nick);
		mav.setViewName("total_Search_Result");
		return mav;
	}
}
