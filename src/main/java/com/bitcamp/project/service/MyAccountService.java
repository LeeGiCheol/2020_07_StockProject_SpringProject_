package com.bitcamp.project.service;

import java.util.HashMap;
import java.util.List;

import com.bitcamp.project.vo.UserVO;
import com.bitcamp.project.vo.holdingStockVO;

public interface MyAccountService {
	HashMap<String, Object> getMyStockList(UserVO loginUser, int nowPage);
}
