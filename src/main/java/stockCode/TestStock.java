package stockCode;

import java.util.HashMap;
import java.util.Map;

public class TestStock {
	public static void main(String[] args) {

		StockParsing st = new StockParsing();
		String stockName = "005940";

		System.out.println(stockName);
		// System.out.println(stockCode);

//	if(stockName.equals(null) || stockName.equals("")) {
//		stockCode = "005930";
//	}
		Info trade = st.parse(stockName);
		Map<String, Object> map = new HashMap<String, Object>();

		map.put("currentPrice", trade.getB()); // 현재가
		map.put("before", trade.getC()); // 전일비
		map.put("updown", trade.getD()); // 등락률
		
		System.out.println(map.get("currentPrice"));
		System.out.println(map.get("before"));
		System.out.println(map.get("updown"));
		// Thread.sleep(3000);

//			model.addAttribute("currentPrice", trade.getB());
//			model.addAttribute("before", trade.getC());		  // 전일비
//			model.addAttribute("updown", trade.getD());		  // 등락률

//			if(request.getServletPath() != "/trade")
//				break;

	}
}
