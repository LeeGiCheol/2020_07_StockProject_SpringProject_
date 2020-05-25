package com.bitcamp.project.view.trade;

import java.util.HashMap;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bitcamp.project.service.TradeService;
import com.fasterxml.jackson.core.JsonProcessingException;

import stockCode.Info;
import stockCode.StockParsing;

@Controller
public class TradeController {
	@Autowired
	TradeService tradeService; 
	
	
	public static JSONObject getJsonStringFromMap( Map<String, Object> map ){
        JSONObject jsonObject = new JSONObject();
        for( Map.Entry<String, Object> entry : map.entrySet() ) {
            String key = entry.getKey();
            Object value = entry.getValue();
            jsonObject.put(key, value);
        }
        
        return jsonObject;
    }

	
//	
//	@GetMapping("/trade")
//	public String tradeView() {
//	
//	}
	
	@GetMapping("/trade")
	public String trade()throws JsonProcessingException  {
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("sam", "삼성전자");
//		String json = new ObjectMapper().writeValueAsString(map);
//		System.out.println(json);
		
		return "stockdealpage";
	}
	
	
	
	@PostMapping(value="/trade")
	public @ResponseBody Map<String, Object> tradeAjax()  {
		
		StockParsing st = new StockParsing();
		String name = "삼성전자";
		Info a = st.parse(name);
		System.out.println(a.getA());
		Map<String, Object> map = new HashMap<String, Object>();
			
			map.put("currentPrice", a.getB()); // 현재가
			map.put("before", "100");		  // 전일비
			map.put("updown", "+1.5%");		  // 등락률
			return map;
	}
	
	
	
	
	
}
