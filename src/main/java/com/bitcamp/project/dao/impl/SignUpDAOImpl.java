package com.bitcamp.project.dao.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bitcamp.project.dao.SignUpDAO;
import com.bitcamp.project.vo.UserVO;

@Repository("SignUpDAO")
public class SignUpDAOImpl implements SignUpDAO {

	
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	
	@Override
	public void signUp(UserVO vo) {
		mybatis.insert("user.signUp", vo);
		//mybatis.insert("SignUp.nickname", vo);
		
	}

	@Override
	public int duplicateCheck(String userInfo) {
		System.out.println("DAO"+userInfo);
		int result = mybatis.selectOne("user.idCheck", userInfo);
		System.out.println(result);
		return result;
	}

	

}
