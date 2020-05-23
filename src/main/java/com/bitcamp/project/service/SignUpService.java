package com.bitcamp.project.service;

import com.bitcamp.project.vo.UserVO;

public interface SignUpService {
	public void signUp(UserVO vo);
	public int duplicateCheck(String userInfo);	
}
