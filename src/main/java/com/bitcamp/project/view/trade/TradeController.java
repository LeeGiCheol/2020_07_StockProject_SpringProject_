package com.bitcamp.project.view.trade;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.TradeService;

import stockCode.Info;
import stockCode.StockParsing;

@Controller
public class TradeController {
	@Autowired
	TradeService tradeService;

	public static JSONObject getJsonStringFromMap(Map<String, Object> map) {
		JSONObject jsonObject = new JSONObject();
		for (Map.Entry<String, Object> entry : map.entrySet()) {
			String key = entry.getKey();
			Object value = entry.getValue();
			jsonObject.put(key, value);
		}

		return jsonObject;
	}

//	
//	@GetMapping(value="/trade")
//	public String tradeView() {
//		return "stockdealpage";
//
//	}

	@GetMapping(value = "/trade")
	public String tradeView(Info vo) {
		String stockName = vo.getStockName();
		System.out.println("제발"+stockName);
		
		
		
		
		return "stockdealpage";

	}

//	@GetMapping("/trade")
//	public String trade()throws JsonProcessingException  {
////		Map<String, Object> map = new HashMap<String, Object>();
////		map.put("sam", "삼성전자");
////		String json = new ObjectMapper().writeValueAsString(map);
////		System.out.println(json);
//		
//		return "stockdealpage";
//	}
//	

//
//	@RequestMapping(value= "/trade")
//	public @ResponseBody Map<String, Object> tradeAjax(@ModelAttribute("stockName") String stockName1, HttpServletRequest request) throws InterruptedException {
//		StockParsing st = new StockParsing();
//		String stockName = request.getParameter("stockName");
//		String stockCode = tradeService.stockSearch(stockName);
//		
//		if(stockName.equals(null) || stockName.equals("")) {
//			stockCode = "005930";
//		}
//		
//		
//			while(true) {
//				Info trade = st.parse(stockCode);
//				Map<String, Object> map = new HashMap<String, Object>();
//				
//				map.put("currentPrice", trade.getB()); // 현재가
//				map.put("before", trade.getC());		  // 전일비
//				map.put("updown", trade.getD());		  // 등락률
//				
//				//Thread.sleep(3000);
//				return map;
//			}
//		}	
//	
//	
//	@RequestMapping(value ="/tradeSearch")
//	public @ResponseBody Map tradeSearch( Model model, HttpServletRequest request) throws InterruptedException {
//		
//		
//		StockParsing st = new StockParsing();
//		String stockName = request.getParameter("stockName");
//		
//		System.out.println(stockName);
//		String stockCode = tradeService.stockSearch(stockName);
//		//System.out.println(stockCode);
//		
////		if(stockName.equals(null) || stockName.equals("")) {
////			stockCode = "005930";
////		}
//			System.out.println(1);
//				Info trade = st.parse(stockCode);
//				System.out.println(trade.getB());
//				Map<String, Object> map = new HashMap<String, Object>();
//				
//				
//				map.put("currentPrice", trade.getB()); // 현재가
//				map.put("before", trade.getC());		  // 전일비
//				map.put("updown", trade.getD());		  // 등락률
////				JSONObject a = getJsonStringFromMap(map);
////				String b = JSONObject.toString("before",trade.getC());
////				System.out.println(b);
////				//Thread.sleep(3000);
////				
////				model.addAttribute("currentPrice", trade.getB());
////				model.addAttribute("before", a.get("before"));		  // 전일비
////				model.addAttribute("updown", b);		  // 등락률
//				
////				if(request.getServletPath() != "/trade")
////					break;
//				
//			
//			return map;
//		}	
//	
	
	
	
	//(defaultValue="GS")
	
//	

	
	
	@RequestMapping(value = "/trade/search")
	public @ResponseBody Map tradeSearch(Info vo) throws InterruptedException {
		
//		try {
//			if(vo.getStockName().equals("") && vo.getStockName().equals(null)) 
//				vo.setStockName("삼성전자");
//		
//		
//		}catch(Exception e) {
//			vo.setStockName("삼성전자");
//		}
		
		String stockName = vo.getStockName();
		
		
//			while(true) {
			StockParsing st = new StockParsing();
	//		String stockName = request.getParameter("stockName");
	
			System.out.println(vo.getStockName());
			String stockCode = tradeService.stockSearch(stockName);
			// System.out.println(stockCode);
	
	//		if(stockName.equals(null) || stockName.equals("")) {
	//			stockCode = "005930";
	//		}
			System.out.println(1);
			Info trade = st.parse(stockCode);
			System.out.println(trade.getCurrentPrice());
			
			List<Map<String, Object>> list = new ArrayList();
			Map<String, Object> map = new HashMap<String, Object>();
	
					map.put("currentPrice", trade.getCurrentPrice()); // 현재가
					map.put("before", trade.getBefore());		  // 전일비
					map.put("updown", trade.getUpDown());		  // 등락률
	//				
	//				list.add(map);
	//				System.out.println(list.toString());
					
					
	//				JSONObject a = getJsonStringFromMap(map);
	//				String b = JSONObject.toString("before",trade.getC());
	//				System.out.println(b);
	//				//Thread.sleep(3000);
	//				
			ModelAndView mv = new ModelAndView();
			
	//		mv.addObject("map", list);
	//		mv.addAllObjects(map);
	
	
//			mv.addObject("currentPrice",  trade.getB()); // 등락률
//			mv.addObject("before",  trade.getC()); // 등락률
//			mv.addObject("updown",  trade.getD()); // 등락률
//			mv.setViewName("stockdealpage");
//			System.out.println(mv);
	//		System.out.println("map?="+map);
	//				if(request.getServletPath() != "/trade")
	//					break;
			return map;
//			}
	}
//	
	
//	
//	@ModelAttribute("conditionMap")
//	public Map<String, String> searchConditionMap(@RequestParam(defaultValue="GS") String stockName) throws InterruptedException {
//		Map<String, String> conditionMap = 
//				new HashMap<String, String>();
//		
//		
//		
//			StockParsing st = new StockParsing();
////			String stockName = request.getParameter("stockName");
//	//
//			System.out.println(stockName);
//			String stockCode = tradeService.stockSearch(stockName);
//			// System.out.println(stockCode);
//	
////			if(stockName.equals(null) || stockName.equals("")) {
////				stockCode = "005930";
////			}
//			System.out.println(1);
//			Info trade = st.parse(stockCode);
//			System.out.println(trade.getB());
//			
//			conditionMap.put("currentPrice", trade.getB()); // 현재가
//			conditionMap.put("before", trade.getC());		  // 전일비
//			conditionMap.put("updown", trade.getD());		  // 등락률
//		
//		
//		
//			return conditionMap;
//	}

}
