package com.bitcamp.project.service;

import com.bitcamp.project.vo.UserVO;

public interface SignInService {
	public UserVO logIn();
	public void logOut();
	public void findId();
	public void findPw();
}
