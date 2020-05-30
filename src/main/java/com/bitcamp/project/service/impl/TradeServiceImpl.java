package com.bitcamp.project.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.TradeDAO;
import com.bitcamp.project.service.TradeService;
import com.bitcamp.project.vo.StockVO;

@Service
public class TradeServiceImpl implements TradeService {

	@Autowired
	TradeDAO tradeDAO;
	
	

	@Override
	public int getStockQuantity(StockVO vo) {
		return tradeDAO.getStockQuantity(vo);
	}

	@Override
	public int getMoney(String id) {
		return tradeDAO.getMoney(id);
	}

	@Override
	public void clearChart() {
		tradeDAO.clearChart();

	}

	@Override
	public Map minuteChart(String stockName) {
		return tradeDAO.minuteChart(stockName);
	}

	@Override
	public String stockSearch(String stockName) {
		return tradeDAO.stockSearch(stockName);

	}

	@Override
	public void callPrice() {
		tradeDAO.callPrice();
	}

	@Override
	public void stockBuying(StockVO vo) {
		tradeDAO.stockBuying(vo);
	}

	@Override
	public void stockSelling(StockVO vo) {
		tradeDAO.stockSelling(vo);
	}

	@Override
	public void stockCorrection() {
		tradeDAO.stockCorrection();
	}

	@Override
	public void stockCancel() {
		tradeDAO.stockCancel();
	}

	@Override
	public Map dayChart(String stockName) {
		return tradeDAO.dayChart(stockName);
	}

}
