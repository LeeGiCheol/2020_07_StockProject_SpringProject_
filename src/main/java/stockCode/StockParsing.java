package stockCode;

import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.bitcamp.project.vo.Info;

public class StockParsing {
	public Info parse(String code) {
//	public static void main(String[] args) {
		
		//long beforeTime = System.currentTimeMillis(); //코드 실행 전에 시간 받아오기

	
		
		Map<String, Info> info = new HashMap<String, Info>();
		String stockName = null;		// 종목명
		int currentPrice = 0;		// 현재가
		String before = null;			// 전일비
		String upDown = null;			// 상승률
		String maximum = null;			// 상한가
		String minimum = null; 			// 하한가
		int[] priceList = new int[20];  // 호가 +-
		
		// 호가 개수
		int[] up = new int[6];   // 호가 +
		int[] down = new int[6]; // 호가 -
		
		try {
			String url = "https://finance.naver.com/item/main.nhn?code=" + code;
//			String url = "https://finance.naver.com/item/main.nhn?code=" + "005930";
			Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
			doc = Jsoup.connect(url).get();
			Elements viewLists = doc.select("#middle");
			
			String kospidaq_ = doc.select(".description").html();
			boolean kospidaq = kospidaq_.contains("alt=\"코스피\"");
			
			

			for (Element viewList : viewLists) {
				stockName = viewList.selectFirst("strong").text();
				String currentPrice_ = viewList.select(".no_today").text();
				String before_ = viewList.select(".no_exday").text();
				maximum = viewList.select(".no_info tbody tr .no_cha .blind").text();
				minimum = viewList.select(".no_info tbody tr:nth-child(2) .no_cha").text();
				String up_c = viewList.select("#tab_con2 .f_down").text();
				String down_c = viewList.select("#tab_con2 .f_up").text();
				
			////////////////////////////////////////
//				System.out.println(maximum);
//				System.out.println(minimum);
			////////////////////////////////////////
				
//				System.out.println(up_c);
				

				// 
				String[] bFUD = before_.split(" ");
				String[] cPrice = currentPrice_.split(" ");
				String[] up_ = up_c.split(" ");
				String[] down_ = down_c.split(" ");
				
				
				
				
				currentPrice = Integer.parseInt(cPrice[0].replace(",", ""));
//				System.out.println("1 "+currentPrice);
//				currentPrice = cPrice[0].replace(",", "");
				
				
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
				
//				System.out.println(Arrays.toString(up_));
				
				
				int kospiTable[] = new int[10000];
				int kosdaqTable[] = new int[10000];

				int k=1;
				int j=1;
				for (int i = 0; i < 10000; i++) {
					kospiTable[i] = k;
					kosdaqTable[i] = j;
					if(k<1000) {
						k++;
						j++;
					}
					else if(k<5000){
						k+=5;
						j+=5;
					}
					else if(k<10000){
						k+=10;
						j+=10;
					}
					else if(k<50000){
						k+=50;
						j+=50;
					}
					else if(k<100000){
						k+=100;
						j+=100;
					}
					else if(k<500000){
						k+=500;
						j+=100;
					}
					else {
						k+=1000;
						j+=100;
					}
				}
				
				for (int i = 0; i < kospiTable.length; i++) {
					if(currentPrice == kospiTable[i]) {
//						System.out.println("kospi " + kospiTable[i]);
						k = i;
						break;
					}
					else if(currentPrice == kosdaqTable[i]) {
//						System.out.println("kosdaq " + kosdaqTable[i]);
						k = i;
						break;
					}
				}
				
				
				// 호가 앞뒤로 6개씩 
				int right = k + 6;
				int left  = k - 6;

				// index
				j = 5;
				int l = 5;
				
				
				for (int i = 20; i > 0; i--) {
					if(left > right) {
						break;
					}
					if(currentPrice == kospiTable[left]) {
//						System.out.println(currentPrice);
						left++;
						i++;
						continue;
					}
					if(left < k) {
						down[l] = kospiTable[left];
						left++;
						i++;
						l--;
					}
					else {
						up[j] = kospiTable[left];
						left++;
						j--;
					}
				}
			}
			
//			System.out.println("up "+Arrays.toString(up));
//			System.out.println("down "+Arrays.toString(down));
//			
//				
//			System.out.println("현재가 " + currentPrice);
			
			Info inf = new Info();
			inf.setStockName(stockName);
			inf.setCurrentPrice(currentPrice);
			inf.setBefore(before);
			inf.setUpDown(upDown);
			inf.setMaximum(maximum);
			inf.setMinimum(minimum);
			inf.setUp(up);
			inf.setDown(down);

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