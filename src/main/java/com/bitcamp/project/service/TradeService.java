package com.bitcamp.project.service;

import java.util.List;
import java.util.Map;

import com.bitcamp.project.vo.StockVO;

public interface TradeService {
	public String stockSearch(String stockName);
		
	public List getUnsettled_ID(String id);
	
	public void modify(StockVO vo);
	
	public Map getUnsettledDetail(StockVO vo);

	public void callPrice();

	public void stockBuying(StockVO vo);

	public void stockSelling(StockVO vo);

	public void stockCorrection();

	public void stockCancel(StockVO vo);

	public Map dayChart(String stockName);

	public Map minuteChart(String stockName);
	
	public int getStockQuantity(StockVO vo);

	public void clearChart();

	public long getMoney(String id);
}
