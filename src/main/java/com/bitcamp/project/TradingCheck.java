package com.bitcamp.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import stockCode.StockName;

@Component
public class TradingCheck {

	@Autowired
	HttpSession httpSession;

	@Scheduled(fixedDelay = 3000)
	public void TestScheduler() {
		StockName sn = new StockName();
		try {
			sn.start();
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
//			throw new RuntimeException("Example to throw a runtime exception");
		}
//		StockParsing sp = new StockParsing();
//		Map<String, Info> info = sp.parsing();
//		System.out.println(info.get("삼성전자").toString());
//		if (httpSession.getAttribute("stock") != null)
//			System.out.println(httpSession.getAttribute("stock"));
//		System.out.println("test");

	}

}
