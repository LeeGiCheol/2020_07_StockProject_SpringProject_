package com.bitcamp.project.dao.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.MyAccountDAO;
import com.bitcamp.project.vo.HoldingStockVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.StockVO;
import com.bitcamp.project.vo.UserVO;

@Repository("myAccountDAO")
public class MyAccountDAOImpl implements MyAccountDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public void moneyCharging() {
		// TODO Auto-generated method stub

	}

	@Override
	public void stockReturnsList() {
		// TODO Auto-generated method stub

	}

	@Override
	public List<HoldingStockVO> myStockList(PagingVO pv) {
		return mybatis.selectList("stock.holdingStockList", pv);
	}
	
	@Override
	public List<StockVO> myStockHistoryListByDate(PagingVO pv) {
		return mybatis.selectList("stock.stockHistoryListByDate", pv);
	}
	
	@Override
	public List<StockVO> myStockHistoryListByStock(PagingVO pv) {
		return mybatis.selectList("stock.stockHistoryListByStock", pv);
	}

	@Override
	public void myStockSearch() {
		
	}

	@Override
	public void tradeList() {

	}
	
	@Override
	public int countMyStock(Map map) {
		return mybatis.selectOne("stock.stockCount", map);
	}
	
	@Override
	public int countMyStockHistory(Map map) {
		return mybatis.selectOne("stock.stockHistoryCount", map);
	}
}
