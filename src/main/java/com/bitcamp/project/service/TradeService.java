package com.bitcamp.project.service;

public interface TradeService {
	public String stockSearch(String stockName);
	public void callPrice();
	
	public void stockBuying();
	
	public void stockSelling();
	
	public void stockCorrection();
	public void stockCancel();
}
