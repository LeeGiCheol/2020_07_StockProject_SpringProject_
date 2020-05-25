package com.bitcamp.project;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import stockCode.Info;
import stockCode.StockParsing;

@Controller
public class TradingCheck {

	@Autowired
	HttpSession session;

	@Scheduled(fixedDelay = 3000)
	public void TestScheduler() {
//		StockName sn = new StockName();
//		try {
//			sn.start();
//		} catch (InterruptedException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		StockParsing sp = new StockParsing();
//		Map<String, Info> info = sp.parsing();
//		System.out.println(info.get("삼성전자").toString());
//		if (httpSession.getAttribute("stock") != null)
//			System.out.println(httpSession.getAttribute("stock"));
//		System.out.println(session.getCreationTime());
		System.out.println("test");

	}

}
