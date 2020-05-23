package com.bitcamp.project.dao.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bitcamp.project.board.SignUpService;
import com.bitcamp.project.dao.SignUpDAO;
import com.bitcamp.project.vo.UserVO;


@Service
public class SignUpServiceImpl implements SignUpService{
	
	@Autowired
	private SignUpDAO signUpDAO;
	


	@Override
	public void signUp(UserVO vo) {
		signUpDAO.signUp(vo);
	}

	@Override
	public int duplicateCheck(String id) {
		return signUpDAO.duplicateCheck(id);
	}


}





