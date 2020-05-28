//package com.bitcamp.project.view.trade;
//
//package com.bitcamp.project.view.trade;
//
//import java.util.ArrayList;
//import java.util.Arrays;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//import org.json.simple.JSONObject;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.springframework.web.servlet.ModelAndView;
//
//import com.bitcamp.project.service.TradeService;
//import com.mysql.cj.x.protobuf.MysqlxDatatypes.Array;
//
//import com.bitcamp.project.vo.Info;
//import stockCode.RequestChart;
//import stockCode.StockParsing;
//
//@Controller
//public class Check {
//   @Autowired
//   TradeService tradeService;
//
////   public static JSONObject getJsonStringFromMap(Map<String, Object> map) {
////      JSONObject jsonObject = new JSONObject();
////      for (Map.Entry<String, Object> entry : map.entrySet()) {
////         String key = entry.getKey();
////         Object value = entry.getValue();
////         jsonObject.put(key, value);
////      }
////
////      return jsonObject;
////   }
//
//   @GetMapping(value = "/trade")
//   public String tradeView(Info vo, Model model) {
//      String stockName = vo.getStockName();
//
//      // get 방식으로 맨 뒤에 종목명을 받아서
//      // 모델에 저장하면 jsp에서 "${stockName}"으로 불러낼 수 있다
//      model.addAttribute("stockName", stockName);
//
////      RequestChart rc = new RequestChart();
////      rc.connection(stockName);
//
//      return "stockdealpage";
//
//   }
//
//   @RequestMapping(value = "/trade/search")
//   public @ResponseBody Map tradeSearch(Info vo) throws InterruptedException {
//
//      String stockName = vo.getStockName();
//
//      StockParsing st = new StockParsing();
//
//      String stockCode = tradeService.stockSearch(stockName);
//      Info trade = st.parse(stockCode);
//
////      
//      Map<String, Object> map = new HashMap<String, Object>();
//
//      Map<String, Object> chart = tradeService.minuteChart();
//
//      
//      Integer[] d = new Integer[60];
//      Integer[] hr = new Integer[60];
//      Integer[] startprice = new Integer[60];
//      Integer[] highprice = new Integer[60];
//      Integer[] lowprice = new Integer[60];
//      Integer[] lastprice = new Integer[60];
//      Integer[] volume = new Integer[60];
//      
////
//      for (int i = 0; i < 60; i++) {
//         d[i] = (Integer) ((HashMap) chart.get(i)).get("d");
//         hr[i] = (Integer) ((HashMap) chart.get(i)).get("hr");
//         startprice[i] = (Integer) ((HashMap) chart.get(i)).get("startprice");
//         highprice[i] = (Integer) ((HashMap) chart.get(i)).get("highprice");
//         lowprice[i] = (Integer) ((HashMap) chart.get(i)).get("lowprice");
//         lastprice[i] = (Integer) ((HashMap) chart.get(i)).get("lastprice");
//         volume[i] = (Integer) ((HashMap) chart.get(i)).get("volume");
//      }
//      
//      map.put("d", d);
//      map.put("hr", hr);
//      map.put("startprice", startprice);
//      map.put("highprice", highprice);
//      map.put("lowprice", lowprice);
//      map.put("lastprice", lastprice);
//      map.put("volume", volume);
//      
//      
//      map.put("currentPrice", trade.getCurrentPrice()); // 현재가
//      map.put("before", trade.getBefore()); // 전일비
//      map.put("updown", trade.getUpDown()); // 등락률
//
//      return map;
//   }
//
//}