package com.bitcamp.project.board;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import com.bitcamp.project.vo.Info;

public class TEST {
//	public Info parse(String code) {
	public static void main(String[] args) {

		String[] split = null;
		String currentPrice = null;
		String stockName = null;
		
		long beforeTime = System.currentTimeMillis(); // 코드 실행 전에 시간 받아오기
		
		Map<String, Info> info = new HashMap<String, Info>();
		try {
			for (int i = 1; i <= 32; i++) {
//			long t1 = System.currentTimeMillis();
				String url = "https://finance.naver.com/sise/sise_market_sum.nhn?&page=" + i; // 크롤링할 url지정
				Document doc = null; // Document에는 페이지의 전체 소스가 저장된다

				doc = Jsoup.connect(url).get();
//				long t2 = System.currentTimeMillis();
				currentPrice = doc.select("table.type_2 tbody td:nth-child(-1n+5)").text();
				stockName = doc.select("table.type_2 tbody td a").text();
				
				System.out.println(currentPrice);
//				System.out.println(stockName);
//				long t3 = System.currentTimeMillis();
//				System.out.println("1 "+(t2-t1)/1000.0f);
//				System.out.println("2 "+(t3-t2)/1000.0f);
//				split = stockName.split("  ");
//				
//				System.out.println("split" + split[0]);
//				
//				String stockName = null;
//				String currentPrice = null;
//				String before = null;
//				String upDown = null;
//				
//				
//				for (Element e : element) {
//					currentPrice = e.select("table.type_2 tbody td.number").text();
//					stockName = e.select("table.type_2 tbody td a").text();
//				}
//				System.out.println(stockName);
//				split = stockName.split(" ");
//				System.out.println(Arrays.toString(split));
				
//				if(n%12 == 2) {
//					inf = new Info();
//					inf.setA(list[i]);
//					list[i] = inf.getA(); 
//					
//					
//				}
//				else if(n%12 == 3) {
//					inf.setB(list[i]);
//				}
//				
//				else if(n%12 == 4) {
//					inf.setC(list[i]);
//				}
//				else if(n%12 == 5) {
//					inf.setD(list[i]);
//					
//					//info.put(inf.getA(), inf);
//				}
//				
//				System.out.println(split[0]);
				
			}
			long aTime = System.currentTimeMillis(); // 코드 실행 전에 시간 받아오기
			
			System.out.println(aTime - beforeTime); // 코드 실행 전에 시간 받아오기

			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
