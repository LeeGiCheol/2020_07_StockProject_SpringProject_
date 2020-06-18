package com.bitcamp.project.view.user;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.BoardService;
import com.bitcamp.project.service.TradeService;
import com.bitcamp.project.service.UserInfoService;
import com.bitcamp.project.vo.BoardVO;
import com.bitcamp.project.vo.Info;
import com.bitcamp.project.vo.UserVO;

import stockCode.TopStock;

@Controller
public class MainPageController {

	@Autowired
	TradeService tradeService;

	@Autowired
	BoardService boardService;

	@Autowired
	UserInfoService userInfoService;

	@GetMapping(value = "/mainPage")
	public ModelAndView mainPage(BoardVO vo, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		Map<String, Object> kospiChart = tradeService.dayChart("종합주가지수");
		Map<String, Object> kosdaqChart = tradeService.dayChart("(코스닥)종합");

		Integer[][] kospiData = new Integer[6][60];
		Integer[][] kosdaqData = new Integer[6][60];
//
		for (int i = 0; i < 60; i++) {
			kospiData[0][i] = (Integer) ((HashMap) kospiChart.get(i)).get("d");
			kospiData[2][i] = (Integer) ((HashMap) kospiChart.get(i)).get("startprice");
			kospiData[3][i] = (Integer) ((HashMap) kospiChart.get(i)).get("highprice");
			kospiData[4][i] = (Integer) ((HashMap) kospiChart.get(i)).get("lowprice");
			kospiData[5][i] = (Integer) ((HashMap) kospiChart.get(i)).get("lastprice");

			kosdaqData[0][i] = (Integer) ((HashMap) kosdaqChart.get(i)).get("d");
			kosdaqData[2][i] = (Integer) ((HashMap) kosdaqChart.get(i)).get("startprice");
			kosdaqData[3][i] = (Integer) ((HashMap) kosdaqChart.get(i)).get("highprice");
			kosdaqData[4][i] = (Integer) ((HashMap) kosdaqChart.get(i)).get("lowprice");
			kosdaqData[5][i] = (Integer) ((HashMap) kosdaqChart.get(i)).get("lastprice");
		}

		Map<String, Object> bestBoardList = boardService.boardList(vo, 0, "", "", "mainNew");
		Map<String, Object> newBoardList = boardService.boardList(vo, 0, "", "", "mainBest");
		mav.addObject("bestBoardList", (List<BoardVO>) bestBoardList.get("boardList"));
		mav.addObject("newBoardList", (List<BoardVO>) newBoardList.get("boardList"));

		mav.addObject("current_kospi", ((HashMap) kospiChart.get(0)).get("lastprice"));
		mav.addObject("current_kosdaq", ((HashMap) kosdaqChart.get(0)).get("lastprice"));

		mav.addObject("kosdaq_d", kosdaqData[0]);
		mav.addObject("kosdaq_startprice", kosdaqData[2]);
		mav.addObject("kosdaq_highprice", kosdaqData[3]);
		mav.addObject("kosdaq_lowprice", kosdaqData[4]);
		mav.addObject("kosdaq_lastprice", kosdaqData[5]);

		mav.addObject("kospi_d", kospiData[0]);
		mav.addObject("kospi_startprice", kospiData[2]);
		mav.addObject("kospi_highprice", kospiData[3]);
		mav.addObject("kospi_lowprice", kospiData[4]);
		mav.addObject("kospi_lastprice", kospiData[5]);

		List<Map> list = userInfoService.getCurrentRevenue();
		for (int i = 0; i < list.size(); i++) {
			list.get(i).put("revenue", Math.round((double) list.get(i).get("revenue") * 100) / 100.0);
		}
		System.out.println(list);
		mav.addObject("currentRevenue", list);

		if (session.getAttribute("loginUser") != null)
			mav.addObject("money", formatter.format(tradeService.getMoney(((UserVO) session.getAttribute("loginUser")).getId())));
		
		mav.setViewName("mainpage");
		return mav;
	}

	@GetMapping(value = "/mainPage/stockRankAjax")
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

//	@GetMapping(value = "/mainPage/userRank")
//	@ResponseBody
//	public List userRank() {
//		List list = userInfoService.getCurrentRevenue();
//		System.out.println(list);
//		return list;
//	}

}
