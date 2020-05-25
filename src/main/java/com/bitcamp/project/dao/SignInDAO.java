package com.bitcamp.project.dao;

import com.bitcamp.project.vo.UserVO;

public interface SignInDAO {
	public UserVO logIn(UserVO vo);
	public void logOut();
	public void findId();
	public void findPw();
}
