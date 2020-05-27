package com.bitcamp.project.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.UserInfoDAO;
import com.bitcamp.project.service.UserInfoService;
import com.bitcamp.project.vo.UserVO;

@Service
public class UserInfoServiceImpl implements UserInfoService {

	@Autowired
	private UserInfoDAO userInfoDAO;
	
	@Override
	public void memberInfo() {
		// TODO Auto-generated method stub

	}

	@Override
	public void memberDelete() {
		// TODO Auto-generated method stub

	}

	@Override
	public void memberInfoUpdate(UserVO vo) {
		userInfoDAO.memberInfoUpdate(vo);
	}

}
