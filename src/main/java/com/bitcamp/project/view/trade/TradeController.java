package com.bitcamp.project.view.trade;

import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bitcamp.project.service.TradeService;
import com.bitcamp.project.vo.Info;
import com.bitcamp.project.vo.StockVO;
import com.bitcamp.project.vo.UserVO;

import stockCode.RequestChart;
import stockCode.StockParsing;

@Controller
public class TradeController {
	@Autowired
	TradeService tradeService;

	@Autowired
	HttpSession session;

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

	@PostMapping(value = "/modify")
	public ModelAndView modify(@RequestParam(value = "modifyQu") String qu,
			@RequestParam(value = "modifyPrice") String price, @RequestParam(value = "uno") String uno,
			@RequestParam(value = "cancleModify") String modify) {
		String id = ((UserVO) session.getAttribute("loginUser")).getId();
//		String id = "test"; // test 용 아이디
		ModelAndView mav = new ModelAndView();

		if (id == null) {
			mav.addObject("msg", "회원만 사용가능합니다");
			mav.addObject("location", "/signInPage");
			mav.setViewName("notice");
			return mav;
		}

		StockVO vo = new StockVO();

		vo.setId(id);
		vo.setUno(Integer.parseInt(uno));
		vo.setQuantity(Integer.parseInt(qu));

		Map unsettledDetail = tradeService.getUnsettledDetail(vo);
		if (unsettledDetail == null) {
			mav.addObject("msg", "주문 번호가 조회되지 않습니다");
			mav.addObject("location", "/trade");
			mav.setViewName("notice");
			return mav;
		}

		vo.setCategory((String) unsettledDetail.get("category"));
		vo.setrPrice((Integer) unsettledDetail.get("rPrice"));
		vo.setStockName((String) unsettledDetail.get("stockName"));

		switch (modify) {
		case "modify":
			if (Integer.parseInt(qu) == 0) {
				mav.addObject("msg", "정정 가능한 최소 수량은 1주 입니다");
				mav.addObject("location", "/trade?stockName=" + unsettledDetail.get("stockName"));
				mav.setViewName("notice");
				return mav;
			}

			vo.setNewPrice(Integer.parseInt(price));
			vo.setNewQuantity(Integer.parseInt(qu));
			vo.setQuantity((Integer) unsettledDetail.get("quantity"));
			int myStockQu = tradeService.getStockQuantity(vo);

			if (((String) unsettledDetail.get("category")).equals("sell")
					&& (myStockQu < Integer.parseInt(qu) - (Integer) unsettledDetail.get("quantity"))) {
				mav.addObject("msg", "보유 수량이 부족합니다");
				mav.addObject("location", "/trade?stockName=" + unsettledDetail.get("stockName"));
				mav.setViewName("notice");
				return mav;
			}

			long money = tradeService.getMoney(id);
			if (((String) unsettledDetail.get("category")).equals("buy")
					&& (money < (Long.parseLong(qu) * Long.parseLong(price)
							- Long.valueOf((int) unsettledDetail.get("rPrice"))
									* Long.valueOf((int) unsettledDetail.get("quantity"))))) {
				mav.addObject("msg", "잔액이 부족합니다");
				mav.addObject("location", "/trade?stockName=" + unsettledDetail.get("stockName"));
				mav.setViewName("notice");
				return mav;
			}

			tradeService.modify(vo);
			break;

		case "cancle":
			if (Integer.parseInt(qu) > (Integer) unsettledDetail.get("quantity")) {
				mav.addObject("msg", "보유 수량이 부족합니다");
				mav.addObject("location", "/trade?stockName=" + unsettledDetail.get("stockName"));
				mav.setViewName("notice");
				return mav;
			}

			if (Integer.parseInt(qu) == (Integer) unsettledDetail.get("quantity"))
				vo.setModifyALL(true);
			else
				vo.setModifyALL(false);

			tradeService.stockCancel(vo);
			break;
		}

		if (modify.equals("cancle"))
			modify = "취소";
		else
			modify = "정정";
		mav.addObject("msg", "주문 " + modify + " 성공");
		mav.addObject("location", "/trade?stockName=" + unsettledDetail.get("stockName"));
		mav.setViewName("notice");
		return mav;
	}

	@PostMapping(value = "/selling")
	public ModelAndView selling(@RequestParam(value = "sellingQu") String qu,
			@RequestParam(value = "sellingPrice") String price, @RequestParam(value = "sName") String stockName) {
		String id = ((UserVO) session.getAttribute("loginUser")).getId();
//		String id = "test"; // test 용 아이디
		ModelAndView mav = new ModelAndView();

		if (id == null) {
			mav.addObject("msg", "회원만 사용가능합니다");
			mav.addObject("location", "/trade?stockName=" + stockName);
			mav.setViewName("notice");
			return mav;
		}

		StockVO vo = new StockVO();

		vo.setId(id);
		vo.setQuantity(Integer.parseInt(qu));
		vo.setStockName(stockName);
		int myStockQu;

		myStockQu = tradeService.getStockQuantity(vo);

		if (myStockQu < Integer.parseInt(qu)) {
			mav.addObject("msg", "보유 수량이 부족합니다");
			mav.addObject("location", "/trade?stockName=" + stockName);
			mav.setViewName("notice");
			return mav;
		}

		vo.setrPrice(Integer.parseInt(price));

		tradeService.stockSelling(vo);
		mav.addObject("msg", "매도 등록: " + stockName + ", " + price);
		mav.addObject("location", "/trade?stockName=" + stockName);
		mav.setViewName("notice");
		return mav;
	}

	@PostMapping(value = "/buying")
	public ModelAndView buying(@RequestParam(value = "buyingQu") String qu,
			@RequestParam(value = "buyingPrice") String price, @RequestParam(value = "sName") String stockName) {
		String id = ((UserVO) session.getAttribute("loginUser")).getId();
//		String id = "test"; // test 용 아이디

		ModelAndView mav = new ModelAndView();

		if (id == null) {
			mav.addObject("msg", "회원만 사용가능합니다");
			mav.addObject("location", "/trade?stockName=" + stockName);
			mav.setViewName("notice");
			return mav;
		}

		long money = tradeService.getMoney(id);
		if (money < Long.parseLong(price) * Long.parseLong(qu)) {
			mav.addObject("msg", "잔액이 부족합니다");
			mav.addObject("location", "/trade?stockName=" + stockName);
			mav.setViewName("notice");
			return mav;
		}

		StockVO vo = new StockVO();

		vo.setId(id);
		vo.setQuantity(Integer.parseInt(qu));
		vo.setStockName(stockName);
		vo.setrPrice(Integer.parseInt(price));

		tradeService.stockBuying(vo);

		mav.addObject("msg", "매수 등록: " + stockName + ", " + price);
		mav.addObject("location", "/trade?stockName=" + stockName);
		mav.setViewName("notice");
		return mav;
	}

	@GetMapping(value = "/trade")
	public ModelAndView tradeView(Info vo) {
		DecimalFormat formatter = new DecimalFormat("###,###,###");
		String stockName = vo.getStockName();
		
		if (stockName == null)
			stockName = "삼성전자";
		
		ModelAndView mav = new ModelAndView();
		String stockCode = tradeService.stockSearch(stockName);

		try {
			String id = ((UserVO) session.getAttribute("loginUser")).getId();
			StockVO sv = new StockVO();
			sv.setId(id);
			sv.setStockName(stockName);
			int myStockQu = tradeService.getStockQuantity(sv);
			System.out.println("--------------------------------");
			System.out.println("--------------------------------");
			System.out.println(stockName+"내 수량은ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ"+myStockQu);
			System.out.println("--------------------------------");
			System.out.println("--------------------------------");
			long money = tradeService.getMoney(id);
			List unsettled = tradeService.getUnsettled_ID(id);
			mav.addObject("unsettled", unsettled);
			mav.addObject("myStockQu", myStockQu);
			mav.addObject("money", formatter.format(money) + "원");
		} catch (Exception e) {
			mav.addObject("myStockQu", "로그인이 필요합니다");
			mav.addObject("money", "로그인이 필요합니다");
		}

		stockName = stockName.toUpperCase();

//		RequestChart rc = new RequestChart();
//		rc.connection(stockName);

		Map<String, Object> minChart = tradeService.minuteChart(stockName);
		Map<String, Object> dayChart = tradeService.dayChart(stockName);

		Integer[][] minChartData = new Integer[6][60];
		Integer[][] dayChartData = new Integer[6][60];
//
		try {
			for (int i = 0; i < 60; i++) {
				minChartData[0][i] = (Integer) ((HashMap) minChart.get(i)).get("d");
				minChartData[1][i] = (Integer) ((HashMap) minChart.get(i)).get("hr");
				minChartData[2][i] = (Integer) ((HashMap) minChart.get(i)).get("startprice");
				minChartData[3][i] = (Integer) ((HashMap) minChart.get(i)).get("highprice");
				minChartData[4][i] = (Integer) ((HashMap) minChart.get(i)).get("lowprice");
				minChartData[5][i] = (Integer) ((HashMap) minChart.get(i)).get("lastprice");

				dayChartData[0][i] = (Integer) ((HashMap) dayChart.get(i)).get("d");
				dayChartData[2][i] = (Integer) ((HashMap) dayChart.get(i)).get("startprice");
				dayChartData[3][i] = (Integer) ((HashMap) dayChart.get(i)).get("highprice");
				dayChartData[4][i] = (Integer) ((HashMap) dayChart.get(i)).get("lowprice");
				dayChartData[5][i] = (Integer) ((HashMap) dayChart.get(i)).get("lastprice");
			}
		} catch (Exception e) {
			mav.addObject("msg", "정확한 종목명을 입력해주세요");
			mav.addObject("location", "/trade");
			mav.setViewName("notice");
			return mav;
		}
		
		mav.addObject("min_d", minChartData[0]);
		mav.addObject("min_hr", minChartData[1]);
		mav.addObject("min_startprice", minChartData[2]);
		mav.addObject("min_highprice", minChartData[3]);
		mav.addObject("min_lowprice", minChartData[4]);
		mav.addObject("min_lastprice", minChartData[5]);

		mav.addObject("day_d", dayChartData[0]);
		mav.addObject("day_startprice", dayChartData[2]);
		mav.addObject("day_highprice", dayChartData[3]);
		mav.addObject("day_lowprice", dayChartData[4]);
		mav.addObject("day_lastprice", dayChartData[5]);

		mav.addObject("stockName", stockName);
		mav.addObject("stockCode", stockCode);
		mav.setViewName("stockdealpage");
		return mav;

	}

	@RequestMapping(value = "/trade/search")
	public @ResponseBody Map tradeSearch(Info vo) throws InterruptedException {
		String stockName = vo.getStockName();

		StockParsing st = new StockParsing();

		String stockCode = tradeService.stockSearch(stockName);
		Info trade = st.parse(stockCode);
//		System.out.println(trade.toString());

//		int currentPrice = Integer.parseInt(trade.getCurrentPrice());
//		
//		int[] prices = null;
//		
//		if(currentPrice >= 1000 && currentPrice < 5000) {
//			prices[0] = currentPrice;
//		}

		Map<String, Object> map = new HashMap<String, Object>();

		DecimalFormat formatter = new DecimalFormat("###,###,###");
//				
		int[] up_ = trade.getUp();
		int[] down_ = trade.getDown();
//		System.out.println("호가 down" + Arrays.toString(down_));

		// 호가 개수
		String[] up = new String[6];
		String[] down = new String[6];
		String currentPrice = null;

		for (int i = 0; i < up_.length; i++) {

			up[i] = formatter.format(up_[i]);
			down[i] = formatter.format(down_[i]);
			currentPrice = formatter.format(trade.getCurrentPrice());
		}

//		System.out.println("up "+Arrays.toString(up));
//		System.out.println("down "+Arrays.toString(down));

		// 배열을 json화 시켜서 보낸다 (호가)
		JSONObject obj = new JSONObject();
		JSONArray jArray = new JSONArray();

		for (int i = 0; i < up.length; i++) {
			JSONObject sObject = new JSONObject();// 배열 내에 들어갈 json
			sObject.put("up", up[i]);
			sObject.put("down", down[i]);
			jArray.add(sObject);
		}

		// 호가
//		System.out.println(jArray.toString());
		map.put("currentPrice", currentPrice); // 현재가
		map.put("before", trade.getBefore()); // 전일비
		map.put("updown", trade.getUpDown()); // 등락률
		map.put("maximum", trade.getMaximum()); // 상한가
		map.put("minimum", trade.getMinimum()); // 하한가
		map.put("up", jArray);
		map.put("down", jArray);

		// 차트

		return map;
	}

}
