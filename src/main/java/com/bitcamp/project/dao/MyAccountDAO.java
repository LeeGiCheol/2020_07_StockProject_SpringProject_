package com.bitcamp.project.dao;

import java.util.List;
import java.util.Map;

import com.bitcamp.project.vo.HoldingStockVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.StockVO;

public interface MyAccountDAO {
	public void moneyCharging();
	
	public void stockReturnsList();
	
	public List<HoldingStockVO> myStockList(PagingVO pv);
	public List<StockVO> myStockHistoryList(PagingVO pv);
//	public List<StockVO> myStockHistoryListByStock(PagingVO pv);
	public void myStockSearch();
	
	public void tradeList();
	
	public int countMyStock(Map map);
	public int countMyStockHistory(Map map);
}
