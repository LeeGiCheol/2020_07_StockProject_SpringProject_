package stockCode;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class StockParsing {
	public Info parse(String code) {
//	public static void main(String[] args) {
		
		//long beforeTime = System.currentTimeMillis(); //코드 실행 전에 시간 받아오기
        
		        
		
		Map<String, Info> info = new HashMap<String, Info>();
		try {
			String url = "https://finance.naver.com/item/main.nhn?code=" + code;
//			String url = "https://finance.naver.com/item/main.nhn?code=" + "005930";
			Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
			doc = Jsoup.connect(url).get();
			Elements viewLists = doc.select("#middle");

			String stockName = null;		// 종목명
			String currentPrice = null;		// 현재가
			String before = null;			// 전일비
			String upDown = null;			// 상승률

			for (Element viewList : viewLists) {
				stockName = viewList.selectFirst("strong").text();

				String currentPrice_ = viewList.select(".no_today").text();
				String before_ = viewList.select(".no_exday").text();

				// 
				String[] bFUD = before_.split(" ");
				String[] cPrice = currentPrice_.split(" ");
				
				currentPrice = cPrice[0].replace(",", "");
				upDown = bFUD[6] + "%";
				
				if(bFUD[1].equals("상승")) {

					before = "+" + bFUD[2];
				}
				else if(bFUD[1].equals("하락")) {
					before = "-" + bFUD[2];
				}
				else if(bFUD[1].equals("보합")) {
					before = bFUD[2];
					upDown = bFUD[5] + "%";
				}
				
			}
			
			Info inf = new Info();
			inf.setStockName(stockName);
			inf.setCurrentPrice(currentPrice);
			inf.setBefore(before);
			inf.setUpDown(upDown);

//			System.out.println(inf);
//			long afterTime = System.currentTimeMillis(); // 코드 실행 후에 시간 받아오기
//			long secDiffTime = (afterTime - beforeTime)/1000; //두 시간에 차 계산
//			System.out.println("시간차이(m) : "+secDiffTime);
			
			return inf;
		} catch (Exception e) {
			e.printStackTrace();
		}
		 return null;
	}
}