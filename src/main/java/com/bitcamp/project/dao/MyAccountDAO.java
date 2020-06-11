package com.bitcamp.project.dao;

import com.bitcamp.project.vo.UserVO;

public interface MyAccountDAO {
	public void moneyCharging();
	
	public void stockReturnsList();
	
	public void myStockList();
	public void myStockSearch();
	
	public void tradeList();
	
	public int countMyStock(UserVO loginUser);
}
