package com.bitcamp.project;

<<<<<<< HEAD
import java.util.Map;

=======
>>>>>>> 4f843da6f213dc31db55f0852b6b063f6bc1666f
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

<<<<<<< HEAD
import stockCode.Info;
import stockCode.StockName;
import stockCode.StockParsing;

=======
>>>>>>> 4f843da6f213dc31db55f0852b6b063f6bc1666f
@Service
public class TradingCheck {

	@Autowired
	HttpSession httpSession;

	@Scheduled(fixedDelay = 3000)
	public void TestScheduler() {
//		StockName sn = new StockName();
//		try {
//			sn.start();
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		StockParsing sp = new StockParsing();
//		Map<String, Info> info = sp.parsing();
//		System.out.println(info.get("삼성전자").toString());
//		if (httpSession.getAttribute("stock") != null)
//			System.out.println(httpSession.getAttribute("stock"));
		System.out.println("test");

	}

}
