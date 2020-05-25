package stockCode;

import java.io.BufferedReader;
import java.io.FileOutputStream;
import java.io.OutputStream;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class StockCode {

	public static void main(String[] args) throws InterruptedException {
		try {
			OutputStream output = new FileOutputStream("C:\\Users\\Wonhee\\spring-workspace\\StockProject/stockCode.txt");
		
				for (int i = 1; i <= 32; i++) {
					String url = "https://finance.naver.com/sise/sise_market_sum.nhn?&page=" + i; // 크롤링할 url지정
					Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
						doc = Jsoup.connect(url).get();
					Elements viewList = doc.select("td");
					String a = "";
					for(Element e : viewList) {
				        String href = "";
				        Elements td = e.getElementsByTag("td");
				        if(td.get(0).hasClass("center")) {
				            href = td.get(0).getElementsByTag("a").attr("href");
				            System.out.println(td);
				            a = href.substring(21);
				            System.out.println(a);
				            byte[] by=(a+",").getBytes();
				            output.write(by);
				        }
					}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}