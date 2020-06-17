package stockCode;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import com.bitcamp.project.vo.Info;

public class News {
	public Info news() {
//	public static void main(String[] args) {
		try {
//			for (int i= 1; i <= 450; i++) {
				
				String url = "https://finance.naver.com/news/news_list.nhn?mode=LSS3D&section_id=101&section_id2=258&section_id3=402";
				Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
				doc = Jsoup.connect(url).get();
				
//				for (int j = 1; j <= 10; j++) {
					String news = doc.select("#contentarea_left > ul").html();
//				}			
			
			Info inf = new Info();
			inf.setNews(news);
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