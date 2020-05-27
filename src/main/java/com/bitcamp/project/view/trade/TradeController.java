package com.bitcamp.project.view.trade;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.TradeService;

import stockCode.Info;
import stockCode.RequestChart;
import stockCode.StockParsing;

@Controller
public class TradeController {
	@Autowired
	TradeService tradeService;

//	public static JSONObject getJsonStringFromMap(Map<String, Object> map) {
//		JSONObject jsonObject = new JSONObject();
//		for (Map.Entry<String, Object> entry : map.entrySet()) {
//			String key = entry.getKey();
//			Object value = entry.getValue();
//			jsonObject.put(key, value);
//		}
//
//		return jsonObject;
//	}

	@GetMapping(value = "/trade")
	public String tradeView(Info vo, Model model) {
		String stockName = vo.getStockName();
		
		// get 방식으로 맨 뒤에 종목명을 받아서
		// 모델에 저장하면 jsp에서 "${stockName}"으로 불러낼 수 있다
		model.addAttribute("stockName",stockName);
		RequestChart rc = new RequestChart();
		rc.connection(stockName);
		System.out.println(stockName);
		
		return "stockdealpage";

	}
	
	@RequestMapping(value = "/trade/search")
	public @ResponseBody Map tradeSearch(Info vo) throws InterruptedException {
		
		String stockName = vo.getStockName();
		
		
		StockParsing st = new StockParsing();

		String stockCode = tradeService.stockSearch(stockName);
		Info trade = st.parse(stockCode);
		
//		RequestChart rc = new RequestChart();
//		rc.connection(stockName);
		
		List<Map<String, Object>> list = new ArrayList();
		Map<String, Object> map = new HashMap<String, Object>();

				map.put("currentPrice", trade.getCurrentPrice()); // 현재가
				map.put("before", trade.getBefore());		  // 전일비
				map.put("updown", trade.getUpDown());		  // 등락률
		
		ModelAndView mv = new ModelAndView();
		return map;
	}

}
