package stockCode;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.bitcamp.project.vo.Info;

public class News3 {
//	public Info news() {
	public static void main(String[] args) {
		try {
//			for (int i= 1; i <= 450; i++) {
				
				String url = "https://kr.investing.com/news/economy/340";
				Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
				doc = Jsoup.connect(url).get();
				
//				for (int j = 1; j <= 10; j++) {
					String news = doc.select("#leftColumn > div.largeTitle > article:nth-child(1) > div.textDiv > a").text();
					String img = doc.select("#leftColumn > div.largeTitle > article:nth-child(1) > a").html();
					int imgIdx = img.indexOf("src=");
					int imgIdx2 = img.indexOf("alt");
					img = img.substring(imgIdx+5, imgIdx2-2);
					
					String source = doc.select("#leftColumn > div.largeTitle > article:nth-child(1) > div.textDiv > span > span:nth-child(1)").text();
					source = source.substring(3);
					
					String date = doc.select("#leftColumn > div.largeTitle > article:nth-child(1) > div.textDiv > span > span.date").text();
					date = date.substring(2);
					
					String newsContent = doc.select("p").html(); 
					
//				}			
					System.out.println(news);
					System.out.println(img);
					System.out.println(source);
					System.out.println(date);
					System.out.println(newsContent);
//			Info inf = new Info();
//			inf.setNews(news);
//			return inf;
			
		} catch (Exception er) {
			er.printStackTrace();
		}
		
//		return null;
		
		
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