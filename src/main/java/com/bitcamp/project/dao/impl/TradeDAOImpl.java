package com.bitcamp.project.dao.impl;

import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.TradeDAO;
import com.bitcamp.project.vo.StockVO;

@Repository("TradeDAO")
public class TradeDAOImpl implements TradeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public int getMoney(String id) {
		return mybatis.selectOne("stock.getMoney", id);
	}

	@Override
	public void clearChart() {
		mybatis.delete("stock.clearChart");

	}

	@Override
	public Map minuteChart(String stockName) {
		return mybatis.selectMap("stock.minuteChart", stockName, "cno");
	}

	@Override
	public Map dayChart(String stockName) {
		return mybatis.selectMap("stock.dayChart", stockName, "cno");
	}

	@Override
	public String stockSearch(String stockName) {
		return mybatis.selectOne("stock.stockCode", stockName);
	}

	@Override
	public void callPrice() {
		// TODO Auto-generated method stub

	}

	@Override
	public void stockBuying(StockVO vo) {
		mybatis.insert("stock.preBuying", vo);
		mybatis.update("stock.updateBuying",vo);
	}

	@Override
	public void stockSelling(StockVO vo) {
		mybatis.insert("stock.preSelling", vo);
		mybatis.insert("stock.preSellingUpdate", vo);
	}

	@Override
	public void stockCorrection() {
		// TODO Auto-generated method stub

	}

	@Override
	public void stockCancel() {
		// TODO Auto-generated method stub

	}

	@Override
	public int getStockQuantity(StockVO vo) {
		return mybatis.selectOne("stock.getStockQuantity", vo);
	}

	
}
