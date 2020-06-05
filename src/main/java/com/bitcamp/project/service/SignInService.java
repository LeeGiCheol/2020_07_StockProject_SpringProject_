package com.bitcamp.project.service;

import com.bitcamp.project.vo.UserVO;

public interface SignInService {
	public UserVO logIn(UserVO vo);
	public void logOut();
	public UserVO findId(UserVO vo);
	public UserVO tryId(UserVO vo);
	public UserVO findPw(UserVO vo);
}
