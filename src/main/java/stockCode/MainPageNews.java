package stockCode;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.bitcamp.project.vo.Info;

public class MainPageNews {
	public Info news() {
//	public static void main(String[] args) {
		try {
//			for (int i= 1; i <= 450; i++) {
				
				String url = "https://finance.naver.com/";
				Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
				doc = Jsoup.connect(url).get();
				Info inf = new Info();
				String[] mainNews = new String[6];
				
				for (int i = 0; i < 6; i++) {
				
					String news = doc.select("#content > div.article > div.section > div.news_area > div > ul > li:nth-child("+(i+1)+") > span > a").text();
					mainNews[i] = news;
					System.out.println(mainNews[i]);
				}			
				inf.setMainNews(mainNews);
				System.out.println(inf.getMainNews());
			return inf;
			
		} catch (Exception er) {
			er.printStackTrace();
		}
		
		return null;
		
		
	}
//	static boolean isStringDouble(String s) {
//		try {
//			Double.parseDouble(s);
//			return true;
//		} catch (NumberFormatException e) {
//			return false;
//		}
//	}
}