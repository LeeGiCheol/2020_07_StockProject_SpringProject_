package com.bitcamp.project.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.SignInDAO;
import com.bitcamp.project.vo.UserVO;

@Repository("SignInDAO")
public class SignInDAOImpl implements SignInDAO{
	
	@Autowired
	private SqlSessionTemplate mybatis;

	@Override
	public UserVO logIn(UserVO vo) {
		return mybatis.selectOne("signInCheck", vo);
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
	public UserVO findPw(UserVO vo) {
		return mybatis.selectOne("findPassword", vo);
	}

}
