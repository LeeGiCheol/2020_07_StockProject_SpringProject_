package com.bitcamp.project.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.dao.SignInDAO;
import com.bitcamp.project.service.SignInService;
import com.bitcamp.project.vo.UserVO;

@Service
public class SignInServiceImpl implements SignInService {

	@Autowired
	private SignInDAO signInDAO;
	
	@Override
	public UserVO logIn() {
		return signInDAO.logIn();
	}

	@Override
	public void logOut() {
		// TODO Auto-generated method stub

	}

	@Override
	public void findId() {
		// TODO Auto-generated method stub

	}

	@Override
	public void findPw() {
		// TODO Auto-generated method stub

	}

}
