package com.bitcamp.project.dao;

import java.util.Map;

public interface TradeDAO {
	public String stockSearch(String stockName);
	public void callPrice();
	
	public void stockBuying();
	
	public void stockSelling();
	
	public void stockCorrection();
	public void stockCancel();
	public Map dayChart();
}
