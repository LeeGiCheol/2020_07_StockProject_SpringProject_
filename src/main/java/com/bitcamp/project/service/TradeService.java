package com.bitcamp.project.service;

import java.util.Map;

public interface TradeService {
	public String stockSearch(String stockName);
	public void callPrice();
	
	public void stockBuying();
	
	public void stockSelling();
	
	public void stockCorrection();
	public void stockCancel();
	public Map dayChart(String stockName);
	public Map minuteChart(String stockName);
	public void clearChart();
}
