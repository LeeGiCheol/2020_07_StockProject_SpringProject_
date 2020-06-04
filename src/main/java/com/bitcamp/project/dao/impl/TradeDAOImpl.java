package com.bitcamp.project.dao.impl;

import java.util.List;
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
	public List getUnsettled_ID(String id) {
		return mybatis.selectList("stock.getUnsettled_ID", id);
	}

	@Override
	public Map getUnsettledDetail(StockVO vo) {
		return mybatis.selectOne("stock.getUnsettledDetail", vo);
	}

	@Override
	public long getMoney(String id) {
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
		vo.setBuysell(-1);
		mybatis.update("stock.updateMoney", vo);
	}

	@Override
	public void stockSelling(StockVO vo) {
		vo.setBuysell(-1);
		mybatis.insert("stock.preSelling", vo);
		mybatis.update("stock.updateHoldingstock", vo);
	}

	@Override
	public void stockCorrection() {
		// TODO Auto-generated method stub
	}

	@Override
	public void stockCancel(StockVO vo) {
		if(vo.isModifyALL())
			mybatis.delete("stock.cancleUnsettled_ALL", vo);
		else
			mybatis.update("stock.cancleUnsettled", vo);
		
		vo.setBuysell(1);
		if(vo.getCategory().equals("sell")) {
			mybatis.update("stock.updateHoldingstock", vo);
		} else {
			mybatis.update("stock.updateMoney", vo);
		}
		
	}

	@Override
	public int getStockQuantity(StockVO vo) {
		if (mybatis.selectOne("stock.getStockQuantity", vo) == null)
			return 0;
		return mybatis.selectOne("stock.getStockQuantity", vo);
	}

	@Override
	public void modify(StockVO vo) {
		mybatis.update("stock.modify", vo);
		if(vo.getCategory().equals("sell")) {
			mybatis.update("stock.modifyHoldingStock",vo);
		} else {  //이거 완성
			mybatis.update("stock.modifyMoney",vo);
		}
	}

	@Override
	public List getHistory(String id) {
		return mybatis.selectList("stock.getHistory", id);
	}
	

}
