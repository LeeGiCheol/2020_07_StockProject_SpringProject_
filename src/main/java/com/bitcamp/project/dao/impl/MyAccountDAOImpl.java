package com.bitcamp.project.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.MyAccountDAO;
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
	public void myStockList() {
		// TODO Auto-generated method stub

	}

	@Override
	public void myStockSearch() {
		// TODO Auto-generated method stub

	}

	@Override
	public void tradeList() {

	}
	
	@Override
	public int countMyStock(UserVO loginUser) {
		return mybatis.selectOne("stock.stockCount");
	}
}
