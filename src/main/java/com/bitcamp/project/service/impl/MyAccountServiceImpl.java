package com.bitcamp.project.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.MyAccountDAO;
import com.bitcamp.project.service.MyAccountService;
import com.bitcamp.project.vo.PagingVO;
import com.bitcamp.project.vo.UserVO;
import com.bitcamp.project.vo.holdingStockVO;

@Service
public class MyAccountServiceImpl implements MyAccountService {
	
	@Autowired
	MyAccountDAO myAccountDAO;

	@Override
	public HashMap<String, Object> getMyStockList(UserVO loginUser, int nowPage) {
		List<holdingStockVO> hodingStockList = null;
		PagingVO pagingVO = new PagingVO(myAccountDAO.countMyStock(loginUser),nowPage,10);
		return null;
	}

}
