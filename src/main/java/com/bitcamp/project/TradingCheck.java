package com.bitcamp.project;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import stockCode.Info;

@Component
public class TradingCheck {
	private int count;

	@Autowired
	private SqlSessionTemplate mybatis;

	public Map<String, Info> stockToMap() {
		Map<String, Info> info = new HashMap<String, Info>();
		try {
			String crwaling = "";
			for (int i = 1; i <= 32; i++) {
				String url = "https://finance.naver.com/sise/sise_market_sum.nhn?&page=" + i; // 크롤링할 url지정
				Document doc = null; // Document에는 페이지의 전체 소스가 저장된다
				doc = Jsoup.connect(url).get();
				Elements element = doc.select("table.type_2");
				Iterator<Element> ie1 = element.select("td").iterator();
				while (ie1.hasNext()) {
					crwaling += ie1.next().text() + "ㅇ";
				}
			}
			String[] list = null;
			int n = 0;
			list = crwaling.split("ㅇ");
			// byte[] by=(Arrays.deepToString(list).getBytes());
			// output.write(by);
			Info inf = null;

			for (int i = 0; i < list.length; i++) {
				if (!list[i].equals("")) {
					++n;
				} else {
					continue;
				}

				if (n % 12 == 2) {
					inf = new Info();
					inf.setA(list[i]);
					list[i] = inf.getA();
					info.put(inf.getA(), inf);

				} else if (n % 12 == 3) {
					inf.setB(list[i]);
				}

			
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return info;
	}

	@Scheduled(fixedDelay = 2000)
	public void TestScheduler() {
		Map<String, Info> info = stockToMap();
		System.out.println(info.get("삼성전자").getB());
		Date now = new Date();
		System.out.println(now);
//		UserVO vo = new UserVO();
//		vo.setId("test"+count);
//		vo.setPw("test"+count);
//		vo.setNickname("test"+count);
//		vo.setAddress("test"+count);
//		vo.setTel("test"+count);
//		
//		mybatis.insert("user.signUp", vo);
//		count++;
	}

}
