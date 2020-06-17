package com.bitcamp.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.bitcamp.project.vo.HoldingStockVO;
import com.bitcamp.project.vo.UserVO;

import stockCode.StockParsing;

public class Ranking {
	
	private SqlSessionTemplate mybatis;
	
	public Ranking(SqlSessionTemplate mybatis) {
		this.mybatis = mybatis;
	}
	
	//회원가입시 userranking테이블에도 유저삽입하도록
	public void computeAsset() {
		StockParsing sp = new StockParsing();
		System.out.println(mybatis);
		List<UserVO> users = mybatis.selectList("user.getAllUser");
		for(int i = 0; i < users.size(); ++i) {
			Map<String, Object> map = new HashMap<String, Object>();
			UserVO user = users.get(i);
			List<HoldingStockVO> hList = mybatis.selectList("stock.holdingStockList2", user.getId());
			long asset = user.getMoney();
			for(int j = 0; j < hList.size(); ++j) {
				asset += hList.get(j).getQuantity() * sp.parse(hList.get(j).getStockCode()).getCurrentPrice();
			}
			map.put("id", user.getId());
			map.put("asset", asset);
			mybatis.update("user.updateRanking",map);
		}
	}
}
