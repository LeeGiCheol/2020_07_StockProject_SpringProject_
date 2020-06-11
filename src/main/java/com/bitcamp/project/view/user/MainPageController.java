package com.bitcamp.project.view.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.project.vo.Info;

import stockCode.TopStock;

@Controller
public class MainPageController {

	@GetMapping(value="/mainPage")
	public String mainPage() {
		return "mainpage";
	}
	
	
	@GetMapping(value="/mainPage/stockRankAjax")
	@ResponseBody
	public Map topRankAjax() {
		Map<String, Object> map = new HashMap<String, Object>(); 
		TopStock ts = new TopStock();

		Info topStock = ts.topStock();
		String[] topName = topStock.getTopName();
		String[] topCurrentPrice = topStock.getTopCurrentPrice();
		String[] topBefore = topStock.getTopBefore();
		String[] topUpDown = topStock.getTopUpDown();
		String[] searchName = topStock.getSearchName();
		String[] searchCurrentPrice = topStock.getSearchCurrentPrice();
		String[] searchUpDown = topStock.getSearchUpDown();
		String[] searchSangHa = topStock.getSearchSangHa();

		for (int i = 0; i < topName.length; i++) {
			map.put("topName", topName);
			map.put("topCurrentPrice", topCurrentPrice);
			map.put("topBefore", topBefore);
			map.put("topUpDown", topUpDown);
		}

		for (int i = 0; i < searchUpDown.length; i++) {
			map.put("searchName", searchName);
			map.put("searchCurrentPrice", searchCurrentPrice);
			map.put("searchUpDown", searchUpDown);
			map.put("searchSangHa", searchSangHa);
		}
		return map;
	}
}


