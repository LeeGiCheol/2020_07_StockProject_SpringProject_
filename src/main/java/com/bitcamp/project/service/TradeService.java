package com.bitcamp.project.service;

import java.util.Map;

import com.bitcamp.project.vo.StockVO;

public interface TradeService {
	public String stockSearch(String stockName);

	public void callPrice();

	public void stockBuying(StockVO vo);

	public void stockSelling(StockVO vo);

	public void stockCorrection();

	public void stockCancel();

	public Map dayChart(String stockName);

	public Map minuteChart(String stockName);
	
	public int getStockQuantity(StockVO vo);

	public void clearChart();

	public int getMoney(String id);
}
