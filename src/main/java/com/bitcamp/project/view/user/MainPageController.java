package com.bitcamp.project.view.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.service.TradeService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.Info;

import stockCode.TopStock;

@Controller
public class MainPageController {
	
	@Autowired
	TradeService tradeService;
	
	@Autowired
	BoardService boardService;

	@GetMapping(value = "/mainPage")
	public ModelAndView mainPage(BoardVO vo) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> dayChart = tradeService.dayChart("종합주가지수");
		System.out.println("vo? "+vo);
		Integer[][] dayChartData = new Integer[6][60];
//
		for (int i = 0; i < 60; i++) {
			dayChartData[0][i] = (Integer) ((HashMap) dayChart.get(i)).get("d");
			dayChartData[2][i] = (Integer) ((HashMap) dayChart.get(i)).get("startprice");
			dayChartData[3][i] = (Integer) ((HashMap) dayChart.get(i)).get("highprice");
			dayChartData[4][i] = (Integer) ((HashMap) dayChart.get(i)).get("lowprice");
			dayChartData[5][i] = (Integer) ((HashMap) dayChart.get(i)).get("lastprice");
		}
		
		Map<String, Object> bestBoardList = boardService.boardList(vo, 0, "", "", "mainNew");
		Map<String, Object> newBoardList = boardService.boardList(vo, 0, "", "", "mainBest");
		mav.addObject("bestBoardList", (List<BoardVO>)bestBoardList.get("boardList"));
		mav.addObject("newBoardList", (List<BoardVO>)newBoardList.get("boardList"));
		
		mav.addObject("current", ((HashMap) dayChart.get(0)).get("lastprice"));
		mav.addObject("day_d", dayChartData[0]);
		mav.addObject("day_startprice", dayChartData[2]);
		mav.addObject("day_highprice", dayChartData[3]);
		mav.addObject("day_lowprice", dayChartData[4]);
		mav.addObject("day_lastprice", dayChartData[5]);

		mav.setViewName("mainpage");
		return mav;
	}

	@GetMapping(value = "/mainPage/stockRankAjax")
	@ResponseBody
	public Map topRankAjax() {
		Map<String, Object> map = new HashMap<String, Object>();
		TopStock ts = new TopStock();

//		Info topStock = ts.topStock();
//		String[] topName = topStock.getTopName();
//		String[] topCurrentPrice = topStock.getTopCurrentPrice();
//		String[] topBefore = topStock.getTopBefore();
//		String[] topUpDown = topStock.getTopUpDown();
//		String[] searchName = topStock.getSearchName();
//		String[] searchCurrentPrice = topStock.getSearchCurrentPrice();
//		String[] searchUpDown = topStock.getSearchUpDown();
//		String[] searchSangHa = topStock.getSearchSangHa();
//
//		for (int i = 0; i < topName.length; i++) {
//			map.put("topName", topName);
//			map.put("topCurrentPrice", topCurrentPrice);
//			map.put("topBefore", topBefore);
//			map.put("topUpDown", topUpDown);
//		}
//
//		for (int i = 0; i < searchUpDown.length; i++) {
//			map.put("searchName", searchName);
//			map.put("searchCurrentPrice", searchCurrentPrice);
//			map.put("searchUpDown", searchUpDown);
//			map.put("searchSangHa", searchSangHa);
//		}
		return map;
	}
}
