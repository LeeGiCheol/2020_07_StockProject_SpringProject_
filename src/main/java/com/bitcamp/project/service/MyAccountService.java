package com.bitcamp.project.service;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.project.vo.UserVO;
import com.bitcamp.project.vo.HoldingStockVO;

public interface MyAccountService {
	HashMap<String, Object> getMyStockList(UserVO loginUser, int nowPage, String accountSearch);
	HashMap<String, Object> getMyTradeHistoryListByDate(UserVO loginUser, int nowPage, String startDate, String endDate, String tradeSearch);
	HashMap<String, Object> getMyTradeHistoryListByStock(UserVO loginUser, int nowPage, String accountSearch);
}