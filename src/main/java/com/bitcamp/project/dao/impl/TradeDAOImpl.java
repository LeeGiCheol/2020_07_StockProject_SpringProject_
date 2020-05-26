package com.bitcamp.project.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.TradeDAO;

@Repository("TradeDAO")
public class TradeDAOImpl implements TradeDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	@Override
	public String stockSearch(String stockName) {
		return mybatis.selectOne("stock.stockCode", stockName);
	}

	@Override
	public void callPrice() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void stockBuying() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void stockSelling() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void stockCorrection() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void stockCancel() {
		// TODO Auto-generated method stub
		
	}

	
	
}
