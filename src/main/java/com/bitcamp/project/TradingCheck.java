//package com.bitcamp.project;
//
//import java.util.Date;
//import java.util.HashMap;
//import java.util.Iterator;
//import java.util.Map;
//
//import org.jsoup.Jsoup;
//import org.jsoup.nodes.Document;
//import org.jsoup.nodes.Element;
//import org.jsoup.select.Elements;
//import org.mybatis.spring.SqlSessionTemplate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.scheduling.annotation.Scheduled;
//import org.springframework.stereotype.Component;
//
//import com.bitcamp.project.vo.StockVO;
//
//import stockCode.Info;
//
//@Component
//public class TradingCheck {
//	private int count;
//
//	@Autowired
//	private SqlSessionTemplate mybatis;
//
//	public Map<String, Info> stockToMap() {
//		Map<String, Info> info = new HashMap<String, Info>();
//		try {
//			String crwaling = "";
//			for (int i = 1; i <= 32; i++) {
//				String url = "https://finance.naver.com/sise/sise_market_sum.nhn?&page=" + i; // 크롤링할 url지정
//				Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
//				doc = Jsoup.connect(url).get();
//				Elements element = doc.select("table.type_2");
//				Iterator<Element> ie1 = element.select("td").iterator();
//				while (ie1.hasNext()) {
//					crwaling += ie1.next().text() + "ㅇ";
//				}
//			}
//			String[] list = null;
//			int n = 0;
//			list = crwaling.split("ㅇ");
//			// byte[] by=(Arrays.deepToString(list).getBytes());
//			// output.write(by);
//			Info inf = null;
//
//			for (int i = 0; i < list.length; i++) {
//				if (!list[i].equals("")) {
//					++n;
//				} else {
//					continue;
//				}
//
//				if (n % 12 == 2) {
//					inf = new Info();
//					inf.setA(list[i]);
//					list[i] = inf.getA();
//					info.put(inf.getA(), inf);
//
//				} else if (n % 12 == 3) {
//					inf.setB(list[i]);
//				}
//
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return info;
//	}
//
//	@Scheduled(fixedDelay = 2000)
//	public void TestScheduler() {
//		Map<String, Info> info = stockToMap();
//
//		// unsettledcheck테이블에서 모두 가져와서 map에 주입
//		Map<String, StockVO> unsettled = new HashMap<String, StockVO>();
//
//		// 테스트용 코드 시작
//		StockVO testVO = new StockVO();
//		testVO.setStockName("삼성전자");
//		testVO.setrPrice(48850);
//		unsettled.put("삼성전자", testVO);
//		// 테스트용 코드 끝
//
//		for (String key : unsettled.keySet()) {
//			System.out.println(key+" 확인");
//			StockVO sv = unsettled.get(key);
//
//			String price = info.get(key).getB().replaceAll(",", "");
//
//			if (Integer.parseInt(price) == sv.getrPrice()) { // 가격 동일시
//				System.out.println("동일가격 확인 & 거래 실행");
//				int uno = sv.getUno();
//
//				// uno 통해서 미채결 전체정보 받아와서 vo객체에 저장&미채결 테이블 데이터 제거 부분 --
//				sv.setId("test"); // test용 코드
//				sv.setQuantity(3);// test용 코드
//				sv.setTcategory("buy");// test용 코드
//				// uno 통해서 미채결 전체정보 받아와서 vo객체에 저장&미채결 테이블 데이터 제거 부분 --
//
//				if (sv.getTcategory().equals("buy")) { // 구매 거래시
//					System.out.println("case: buy");
//					// 거래기록 테이블에 거래 정보 주입
//					// 보유주식 테이블에 보유주식 추가
//					// 유저 보유 금액 테이블에서 money 차감
//					// 거래 알람 테이블에 알람 추가
//				} else if (sv.getTcategory().equals("sell")) { // 판매 거래시
//					System.out.println("case: sell");
//					// 거래기록 테이블에 거래 정보 주입
//					// 보유주식 테이블에 보유주식 추가
//					// 유저 보유 금액 테이블에서 money 증가
//					// 거래 알람 테이블에 알람 추가
//				}
//			}
//		}
//		
//		Date now = new Date();
//		System.out.println(now);
//	}
//
//}
