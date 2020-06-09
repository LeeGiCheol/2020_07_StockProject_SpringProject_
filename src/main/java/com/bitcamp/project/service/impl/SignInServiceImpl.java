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
	public UserVO logIn(UserVO vo) {
		return signInDAO.logIn(vo);
	}

	@Override
	public void logOut() {
		signInDAO.logOut();
	}

	@Override
	public UserVO findId(UserVO vo) {
		return signInDAO.findId(vo);

	}
	
	@Override
	public void tryId() {
	}

	@Override
	public UserVO findPw(UserVO vo) {
		return signInDAO.findPw(vo);
	}
	
	@Override
	public UserVO updatePw(UserVO vo) {
		return signInDAO.updatePw(vo);
	}

}
