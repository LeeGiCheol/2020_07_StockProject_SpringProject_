package com.bitcamp.project.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.MyAccountDAO;
import com.bitcamp.project.service.MyAccountService;
import com.bitcamp.project.vo.HoldingStockVO;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.StockVO;
import com.bitcamp.project.vo.UserVO;

@Service
public class MyAccountServiceImpl implements MyAccountService {
	
	@Autowired
	MyAccountDAO myAccountDAO;

	@Override
	public HashMap<String, Object> getMyStockList(UserVO loginUser, int nowPage, String accountSearch) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", loginUser.getId());
		map.put("accountSearch", accountSearch);
		int count = myAccountDAO.countMyStock(map);
		PagingVO pv1 = new PagingVO(count,nowPage,3);
		pv1.getUtil().put("id", loginUser.getId());
		pv1.getUtil().put("accountSearch", accountSearch);
		List<HoldingStockVO> holdingStockList = myAccountDAO.myStockList(pv1);
		HashMap<String, Object> hm1 = new HashMap<String, Object>();
		hm1.put("pv1", pv1);
		hm1.put("holdingStockList", holdingStockList);
		return hm1;
	}

	@Override
	public HashMap<String, Object> getMyTradeHistoryListByDate(UserVO loginUser, int nowPage, String startDate, String endDate) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", loginUser.getId());
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		int count = myAccountDAO.countMyStockHistory(map);
		PagingVO pv2 = new PagingVO(count,nowPage,1);
		pv2.getUtil().put("id", loginUser.getId());
		pv2.getUtil().put("startDate", startDate);
		pv2.getUtil().put("endDate", endDate);
		List<StockVO> stockHistoryListByDate = myAccountDAO.myStockHistoryListByDate(pv2);
		HashMap<String, Object> hm1 = new HashMap<String, Object>();
		hm1.put("pv2", pv2);
		hm1.put("stockHistoryListByDate", stockHistoryListByDate);
		return hm1;
	}
	
	@Override
	public HashMap<String, Object> getMyTradeHistoryListByStock(UserVO loginUser, int nowPage, String tradeSearch) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("id", loginUser.getId());
		map.put("tradeSearch", tradeSearch);
		int count = myAccountDAO.countMyStockHistory(map);
		PagingVO pv3 = new PagingVO(count,nowPage,2);
		pv3.getUtil().put("id", loginUser.getId());
		pv3.getUtil().put("tradeSearch", tradeSearch);
		List<StockVO> stockHistoryListByStock = myAccountDAO.myStockHistoryListByStock(pv3);
		HashMap<String, Object> hm1 = new HashMap<String, Object>();
		hm1.put("pv3", pv3);
		hm1.put("stockHistoryListByStock", stockHistoryListByStock);
		return hm1;
	}
}
